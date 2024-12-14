<?php
require_once '../vendor/autoload.php'; // Charge toutes les dépendances installées
use Firebase\JWT\JWT;

function generate_jwt($user_id) {
    // Clé secrète pour signer le JWT, à ne pas partager
    $secret_key = "Zq2s!4Tke1XjYpW9Z5wKq2rJmB7hL0P3Z4vU8tR9dX1GfM";
    // Définir l'header du JWT
    $issued_at = time();
    $expiration_time = $issued_at + 3600;  // Le token expire dans 1 heure
    $payload = array(
        "iat" => $issued_at,
        "exp" => $expiration_time,
        "user_id" => $user_id
    );

    // Générer le token JWT
    $jwt = JWT::encode($payload, $secret_key, 'HS256');
    return $jwt;
}
?>
