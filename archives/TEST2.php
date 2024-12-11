<?php
include '../../front/pages/TESTBDD.php';

// Activer l'affichage des erreurs pour le débogage
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Définir les en-têtes pour retourner du JSON
header('Content-Type: application/json');

// Vérifier la connexion à la base de données
$pdo = get_database();
if (!$pdo) {
    echo json_encode(['error' => 'Erreur de connexion à la base de données.']);
    exit;
}

// Vérifier si l'ID de l'enclos est fourni
if (!isset($_GET['id']) || empty($_GET['id'])) {
    echo json_encode(['error' => 'Aucun ID fourni ou ID vide.']);
    exit;
}

// Convertir l'ID en entier
$id = intval($_GET['id']);
error_log('ID reçu : ' . $id);

try {
    // Préparer et exécuter la requête SQL pour récupérer les animaux associés à l'enclos
    $stmt = $pdo->prepare("
        SELECT animaux.id_animal, animaux.name AS animal_name, biomes.name AS biome_name
        FROM animaux
        INNER JOIN enclosure_animals ON animaux.id_animal = enclosure_animals.id_animal
        INNER JOIN enclosure ON enclosure.id_enclosure = enclosure_animals.id_enclosure
        INNER JOIN biomes ON enclosure.id_biome = biomes.id_biome
        WHERE enclosure.id_enclosure = ?
    ");
    $stmt->execute([$id]);
    $animals = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Vérifier si des animaux ont été trouvés
    if (!$animals) {
        echo json_encode(['error' => 'Aucun animal trouvé pour l\'ID de l\'enclos fourni.']);
        exit;
    }


    // Créer un tableau pour stocker les informations des animaux
    $animal_data = [];
    foreach ($animals as $animal) {
        // Construire le chemin de l'image pour chaque animal
        $image_path = "../../assets/animaux/{$animal['biome_name']}/{$animal['animal_name']}.jpg";

        $animal_data[] = [
            'animal_name' => $animal['animal_name'],
            'image_path' => $image_path,
        ];
    }

    // Retourner les données au format JSON
    echo json_encode([
        'animals' => $animal_data,
    ]);

} catch (PDOException $e) {
    // En cas d'erreur SQL, retourner un message d'erreur
    echo json_encode(['error' => 'Erreur SQL : ' . $e->getMessage()]);
    exit;
}
?>
