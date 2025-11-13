<?php
// proxy.php

$apiUrl = 'http://localhost/omeka-s/api';
$apiKeyIdentity = '9kKYaeVduzTk3jbe8zXc9BBdvXK83z46';
$apiKeyCredential = 'jQ6CNQ46Qh0M67qhzazuZRueu6RyoodT';

$method = $_SERVER['REQUEST_METHOD'];
$path = str_replace('/proxy.php', '', $_SERVER['REQUEST_URI']);

// Pour les méthodes POST, PUT, DELETE, ajouter les clés d'API dans l'URL
if (in_array($method, ['POST', 'PUT', 'DELETE', 'PATCH'])) {
    $separator = strpos($path, '?') !== false ? '&' : '?';
    $path .= $separator . "key_identity=$apiKeyIdentity&key_credential=$apiKeyCredential";
}

$ch = curl_init("$apiUrl$path");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);

// Headers
$headers = [
    "Content-Type: application/json",
];
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

if ($method === 'POST' || $method === 'PUT') {
    $data = file_get_contents('php://input');
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
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
