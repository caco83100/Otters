<?php
header("Content-Type: application/json");
require_once "./jwt_helper.php";
require_once "./bdd.php";

// Active l'affichage des erreurs pour le débogage
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Récupérer les données envoyées par le client
$data = json_decode(file_get_contents("php://input"), true);

// Vérifier que les champs "PSEUDO" et "MDP" sont présents
$username = $data["PSEUDO"] ?? "";
$password = $data["MDP"] ?? "";


if (empty($username) || empty($password)) {
    echo json_encode(["error" => "Nom d'utilisateur ou mot de passe manquant"]);
    exit;
}

// Vérifier si l'utilisateur existe dans la base de données
$query = "SELECT * FROM users WHERE pseudo = ? || mail = ? LIMIT 1";
$stmt = $conn->prepare($query);
$stmt->bind_param("ss", $username, $username);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();


if (!$user) {
    echo json_encode(["error" => "Identifiants invalides"]);
    exit;
}



// Vérification du mot de passe avec le hachage
 if (password_verify($password, $user['MDP'])) {
     // Générer le JWT si l'authentification est réussie
     $jwt = generate_jwt($user['Id'],$user['role'],$user['PRENOM'],$user['PP']); 
     echo json_encode(["success" => true, "token" => $jwt]);
 } else {
     echo json_encode(["error" => "Mot de passe incorrect"]);
 }

$stmt->close();
$conn->close();
?>
