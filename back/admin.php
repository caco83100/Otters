<?php
include "./bdd.php";
header('Content-Type: application/json');

// Affichage des erreurs pour le débogage
ini_set('display_errors', 1);
error_reporting(E_ALL);

function get_database()
{
    global $conn;

    $enclosureQuery = "SELECT enclosure.id_enclosure AS id_enclosure, 
                       enclosure.meal AS meal, 
                       enclosure.travaux AS travaux, 
                       enclosure_animals.id_animal AS id_animal, 
                       animaux.name AS animal_name
                       FROM enclosure
                       LEFT JOIN enclosure_animals ON enclosure.id_enclosure = enclosure_animals.id_enclosure
                       LEFT JOIN animaux ON enclosure_animals.id_animal = animaux.id_animal
                       ORDER BY enclosure.id_enclosure;";

    $animalsQuery = "SELECT id_animal, name FROM animaux ORDER BY name;";

    $enclosureResult = $conn->query($enclosureQuery);
    $animalsResult = $conn->query($animalsQuery);

    $enclosureData = [];
    foreach ($enclosureResult as $row) {
        $enclosureId = (int)$row['id_enclosure'];
        $meal = $row['meal'];
        $travaux = (int)$row['travaux'];
        $id_animal = (int)$row['id_animal'];
        $animalName = $row['animal_name'];

        if (!isset($enclosureData[$enclosureId])) {
            $enclosureData[$enclosureId] = [
                'meal' => $meal,
                'travaux' => $travaux,
                'animals' => []
            ];
        }
        if ($id_animal) {
            $enclosureData[$enclosureId]['animals'][$id_animal] = $animalName;
        }
    }

    $animalsData = [];
    foreach ($animalsResult as $row) {
        $animalsData[(int)$row['id_animal']] = $row['name'];
    }

    return ['enclosures' => $enclosureData, 'animals' => $animalsData];
}

function update_enclosure($id, $data)
{
    global $conn;

    $conn->begin_transaction(MYSQLI_TRANS_START_READ_WRITE);

    try {
        // Mise à jour des informations de l'enclos
        $stmt = $conn->prepare("UPDATE enclosure SET meal = ?, travaux = ? WHERE id_enclosure = ?");
        $stmt->bind_param('sii', $data['meal'], $data['travaux'], $id);
        $stmt->execute();

        // Récupération des animaux existants dans l'enclos
        $stmt = $conn->prepare("SELECT id_animal FROM enclosure_animals WHERE id_enclosure = ?");
        $stmt->bind_param('i', $id);
        $stmt->execute();
        $existingAnimals = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
        $existingAnimalIds = array_column($existingAnimals, 'id_animal');

        // Conversion de la chaîne 'animals' en tableau d'entiers
        $newAnimalIds = is_string($data['animals']) ? array_map('trim', explode(',', $data['animals'])) : (array)$data['animals'];

        // Assurer que les éléments sont des entiers
        $newAnimalIds = array_map('intval', $newAnimalIds);

        // Détection des animaux à ajouter et à supprimer
        $toAdd = array_diff($newAnimalIds, $existingAnimalIds);
        $toRemove = array_diff($existingAnimalIds, $newAnimalIds);

        // Suppression des associations obsolètes
        if (!empty($toRemove)) {
            $placeholders = implode(',', array_fill(0, count($toRemove), '?'));
            $stmt = $conn->prepare("DELETE FROM enclosure_animals WHERE id_enclosure = ? AND id_animal IN ($placeholders)");
            $types = str_repeat('i', count($toRemove) + 1);
            $stmt->bind_param($types, $id, ...$toRemove);
            $stmt->execute();
        }

        // Ajout des nouvelles associations
        foreach ($toAdd as $animalId) {
            $stmt = $conn->prepare("INSERT INTO enclosure_animals (id_enclosure, id_animal) VALUES (?, ?)");
            $stmt->bind_param('ii', $id, $animalId);
            $stmt->execute();
        }

        $conn->commit();
        return ["success" => "Enclos $id mis à jour avec succès."];

    } catch (Exception $e) {
        $conn->rollback();
        return ["error" => "Erreur lors de la mise à jour : " . $e->getMessage()];
    }
}


if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    echo json_encode(get_database(), JSON_UNESCAPED_UNICODE);
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    if (!isset($input['id']) || !isset($input['data'])) {
        http_response_code(400);
        echo json_encode(["error" => "Données invalides."]);
        exit;
    }

    $result = update_enclosure((int)$input['id'], $input['data']);
    echo json_encode($result);
    exit;
}

http_response_code(405);
echo json_encode(["error" => "Méthode non autorisée."]);
?>
