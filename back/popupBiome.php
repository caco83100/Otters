<?php
header('Content-Type: application/json');
include './bdd.php';

// Simule des données si elles ne proviennent pas de la base de données.
$tab=get_database();

// Encode les données en JSON.
echo (json_encode($tab, JSON_UNESCAPED_UNICODE));
?>