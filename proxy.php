<?php
// proxy.php

$apiUrl = 'https://localhost/omeka-s/api'; 
$apiKeyIdentity = '98LsLpxqVAHlTqk5ql0gZjazTekis9Br';
$apiKeyCredential = 'UlCuDAUpaY5UT6p3OF0b1USLNKFuRyZO';

$method = $_SERVER['REQUEST_METHOD'];
$path = str_replace('/proxy.php', '', $_SERVER['REQUEST_URI']);

$ch = curl_init("$apiUrl$path");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
curl_setopt($ch, CURLOPT_CUSTOMREQUEST, $method);

// Headers
$headers = [
    "Authorization: OmekaApiKey $apiKeyIdentity:$apiKeyCredential",
    "Content-Type: application/json",
];
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

if ($method === 'POST' || $method === 'PUT') {
    $data = file_get_contents('php://input');
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
}

$response = curl_exec($ch);
$httpcode = curl_getinfo($ch, CURLINFO_HTTP_CODE);

header('Content-Type: application/json');
http_response_code($httpcode);
echo $response;

curl_close($ch);
