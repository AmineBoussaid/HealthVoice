<?php
// proxy.php

$apiUrl = 'http://localhost/omeka-s/api';
$apiKeyIdentity = '9kKYaeVduzTk3jbe8zXc9BBdvXK83z46';
$apiKeyCredential = 'jQ6CNQ46Qh0M67qhzazuZRueu6RyoodT';

$method = $_SERVER['REQUEST_METHOD'];

// Support deux modes d'adresse:
// 1) /proxy.php/items (PATH_INFO)
// 2) /proxy.php?path=/items&... (recommandé pour serveurs sans PATH_INFO)
$requestUri = $_SERVER['REQUEST_URI'];
$path = isset($_GET['path']) ? $_GET['path'] : str_replace('/proxy.php', '', $requestUri);

// Concaténer les autres paramètres de requête (hors 'path') dans l'URL cible
$queryParams = $_GET ?? [];
if (isset($queryParams['path'])) {
    unset($queryParams['path']);
}
if (!empty($queryParams)) {
    $path .= (strpos($path, '?') !== false ? '&' : '?') . http_build_query($queryParams);
}

// Début du logging de débogage
$logFile = __DIR__ . '/proxy_debug.log';
$rawInput = file_get_contents('php://input'); // read once and reuse
$logData = "--- " . date('Y-m-d H:i:s') . " ---\n";
$logData .= "Method: $method\n";
$logData .= "Path: $path\n";
$logData .= "Content-Type: " . (isset($_SERVER["CONTENT_TYPE"]) ? $_SERVER["CONTENT_TYPE"] : 'N/A') . "\n";
$logData .= "--- Headers ---\n";
foreach (getallheaders() as $name => $value) {
    $logData .= "$name: $value\n";
}
$logData .= "--- POST Data ---\n";
$logData .= print_r($_POST, true) . "\n";
$logData .= "--- FILES Data ---\n";
$logData .= print_r($_FILES, true) . "\n";
$logData .= "--- Raw Input ---\n";
$logData .= $rawInput . "\n";
$logData .= "-------------------\n\n";
file_put_contents($logFile, $logData, FILE_APPEND);
// Fin du logging de débogage

// Pour les méthodes POST, PUT, DELETE, PATCH, ajouter les clés d'API dans l'URL
if (in_array($method, ['POST', 'PUT', 'DELETE', 'PATCH'])) {
    $separator = strpos($path, '?') !== false ? '&' : '?';
    $path .= $separator . "key_identity=$apiKeyIdentity&key_credential=$apiKeyCredential";
}

$targetUrl = "$apiUrl$path";

// Log de la cible finale pour debug
$logData = "Target URL: $targetUrl\n\n";
file_put_contents($logFile, $logData, FILE_APPEND);

$ch = curl_init($targetUrl);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);

// Determine content type once
$contentType = isset($_SERVER["CONTENT_TYPE"]) ? trim($_SERVER["CONTENT_TYPE"]) : '';

// Set headers carefully: let cURL set multipart boundaries
if ($method === 'GET') {
    curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
}

if ($method === 'POST' || $method === 'PUT' || $method === 'PATCH') {
    if (strpos($contentType, 'multipart/form-data') !== false) {
        // Pour multipart, on reconstruit les données pour cURL
        // Ne pas fixer Content-Type ici: cURL gère le boundary automatiquement
        curl_setopt($ch, CURLOPT_HTTPHEADER, []);
        $postData = [];
        if (isset($_POST['data'])) {
            $postData['data'] = $_POST['data'];
        }
        
        if (isset($_FILES['file'])) {
            foreach ($_FILES['file']['tmp_name'] as $index => $tmpName) {
                if (!empty($tmpName) && is_uploaded_file($tmpName)) {
                    $fileName = $_FILES['file']['name'][$index];
                    $fileType = $_FILES['file']['type'][$index];
                    // Omeka attend 'file[<index>]'
                    $postData["file[$index]"] = new CURLFile($tmpName, $fileType, $fileName);
                }
            }
        }
        curl_setopt($ch, CURLOPT_POSTFIELDS, $postData);
    } else {
        // Pour JSON, on utilise le corps brut
        curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $rawInput);
    }
}

$response = curl_exec($ch);
$httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
$curl_error = curl_error($ch);

header('Content-Type: application/json');

// Debug: Log only errors
if ($curl_error) {
    http_response_code(500);
    error_log("CURL Error: " . $curl_error);
    echo json_encode(['error' => 'CURL Error: ' . $curl_error]);
} elseif ($httpcode >= 400) {
    http_response_code($httpcode);
    error_log("API Error - HTTP Code: " . $httpcode);
    error_log("Response: " . substr($response, 0, 500)); // Log seulement les 500 premiers caractères
    
    // Si la réponse contient du HTML (erreur Omeka), convertir en JSON
    if (strpos($response, '<!DOCTYPE html>') !== false || strpos($response, '<html') !== false) {
        echo json_encode([
            'error' => 'Server error',
            'http_code' => $httpcode,
            'message' => 'Omeka S a rencontré une erreur. Vérifiez les logs du serveur.'
        ]);
    } else {
        echo $response;
    }
} elseif ($httpcode == 204 || empty($response)) {
    // DELETE réussit avec 204 No Content ou réponse vide - renvoyer 200 avec JSON
    http_response_code(200);
    echo json_encode(['success' => true, 'message' => 'Operation completed']);
} else {
    http_response_code($httpcode);
    echo $response;
}

curl_close($ch);
