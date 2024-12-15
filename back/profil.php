<?php
include "./bdd.php";
header('Content-Type: application/json');

// Fonction pour récupérer les données utilisateur
function getUserData($conn, $userId) {
    try {
        $req = "SELECT nom, prenom, date, pseudo, mail, pp FROM `users` WHERE id = ?";
        $stmt = $conn->prepare($req);
        $stmt->bind_param("i", $userId);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows > 0) {
            return $result->fetch_assoc();
        } else {
            return ["error" => "Utilisateur introuvable."];
        }
    } catch (Exception $e) {
        return ["error" => "Erreur serveur : " . $e->getMessage()];
    }
}

function updateUserData($conn, $userId, $data) {
    try {
        $req = "UPDATE `users` SET nom = ?, prenom = ?, date = ?, pseudo = ?, mail = ?, pp = ? WHERE id = ?";
        $stmt = $conn->prepare($req);
        $stmt->bind_param("sssssii", $data['nom'], $data['prenom'], $data['date'], $data['pseudo'], $data['mail'], $data['pp'], $userId);
        $stmt->execute();

        // Retourner un succès même si aucune ligne n'a été modifiée
        return ["success" => true];
    } catch (Exception $e) {
        return ["error" => "Erreur serveur : " . $e->getMessage()];
    }
}


// Récupérer les données de la requête POST
$input = json_decode(file_get_contents("php://input"), true);

if (!isset($input['action']) || !isset($input['userId'])) {
    echo json_encode(["error" => "Action ou ID utilisateur manquant."]);
    exit;
}

$action = $input['action'];
$userId = (int)$input['userId'];

if ($action === "get") {
    // Récupérer les données utilisateur
    echo json_encode(getUserData($conn, $userId));
} elseif ($action === "update") {
    // Mettre à jour les données utilisateur
    if (!isset($input['data'])) {
        echo json_encode(["error" => "Données de mise à jour manquantes."]);
        exit;
    }
    echo json_encode(updateUserData($conn, $userId, $input['data']));
} else {
    echo json_encode(["error" => "Action non reconnue."]);
}
?>
