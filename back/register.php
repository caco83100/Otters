<?php
header("Content-Type: application/json");
require_once "./jwt_helper.php";
require_once "./bdd.php"; // Inclure ton fichier de configuration de la base de données

$data = json_decode(file_get_contents("php://input"), true);
$name = $data["NOM"] ?? "";
$firstname = $data["PRENOM"] ?? "";
$date = $data["DATE"] ?? "";
$username = $data["PSEUDO"] ?? "";
$email = $data["MAIL"] ?? "";
$password = $data["MDP"] ?? "";
$nl = $data["NL"] ?? "";

// Vérifie si l'utilisateur ou l'email existe déjà
$query = "SELECT * FROM users WHERE pseudo = ? OR mail = ? LIMIT 1"; // Correction de la requête SELECT
$stmt = $conn->prepare($query);

if ($stmt === false) {
    // Erreur de préparation de la requête
    echo json_encode(["error" => "Erreur lors de la préparation de la requête", "details" => $conn->error]);
    exit;
}

$stmt->bind_param("ss", $username, $email);
$stmt->execute();
$result = $stmt->get_result();
$user = $result->fetch_assoc();

if ($user) {
    http_response_code(409);
    echo json_encode(["error" => "Nom d'utilisateur ou email déjà utilisé"]);
    exit;
}

// Hash du mot de passe avant de l'enregistrer
$hashedPassword = password_hash($password, PASSWORD_BCRYPT);

// Ajout de l'utilisateur à la base de données
$query = "INSERT INTO users (nom, prenom, date, pseudo, mail, mdp, nl) VALUES (?, ?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($query);

if ($stmt === false) {
    // Erreur de préparation de la requête INSERT
    echo json_encode(["error" => "Erreur lors de la préparation de la requête d'insertion", "details" => $conn->error]);
    exit;
}

$stmt->bind_param("ssssssi", $name, $firstname, $date, $username, $email, $hashedPassword, $nl);

if ($stmt->execute()) {
    // Réponse avec succès
    echo json_encode(["success" => true]);
} else {
    // Gestion de l'erreur d'insertion
    echo json_encode(["error" => "Échec de l'insertion dans la base de données", "details" => $stmt->error]);
}

// Fermeture de la connexion
$stmt->close();
$conn->close();
?>
