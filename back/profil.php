<?php
include "./bdd.php";
header('Content-Type: application/json');

// Récupérer les données de la requête POST
$input = json_decode(file_get_contents("php://input"), true);

if (!isset($input['userId']) || empty($input['userId'])) {
    echo json_encode(["error" => "ID utilisateur manquant ou invalide."]);
    exit;
}

$userId = (int)$input['userId'];

try {
    // Préparer et exécuter la requête
    $req = "SELECT nom, prenom, date, pseudo, mail, pp FROM `users` WHERE id = ?";
    $stmt = $conn->prepare($req);
    $stmt->bind_param("i", $userId);
    $stmt->execute();

    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $user = $result->fetch_assoc();

        // Retourner les données utilisateur en JSON
        echo json_encode([
            "NOM" => $user['nom'],
            "PRENOM" => $user['prenom'],
            "DATE" => $user['date'],
            "PSEUDO" => $user['pseudo'],
            "MAIL" => $user['mail'],
            "PP" => $user['pp']
        ]);
    } else {
        echo json_encode(["error" => "Utilisateur introuvable."]);
    }
} catch (Exception $e) {
    echo json_encode(["error" => "Erreur serveur : " . $e->getMessage()]);
}

