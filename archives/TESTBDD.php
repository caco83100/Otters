<?php

/**
 * Fonction pour établir une connexion à la base de données
 * @return PDO|false Retourne un objet PDO ou false en cas d'échec
 */
function get_database()
{
    $server = "localhost";
    $username = "root";
    $password = "";
    $databaseName = "Otters";

    try {
        // Création de la connexion PDO
        $pdo = new PDO("mysql:host=$server;dbname=$databaseName;charset=utf8", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); // Activer les exceptions
        return $pdo;
    } catch (PDOException $e) {
        // Enregistrer les erreurs dans les logs (et non les afficher directement)
        error_log("Erreur de connexion à la base de données : " . $e->getMessage());
        return false; // Retourner false en cas d'échec
    }
}

/**
 * Fonction pour récupérer les données des biomes et enclos
 * @param PDO $pdo Connexion PDO
 * @return array Tableau structuré des données ou tableau vide en cas d'erreur
 */
function get_biome_data($pdo)
{
    if (!$pdo) {
        return [];
    }

    $req = "SELECT animaux.id_animal, animaux.name AS animal_name, enclosure.id_enclosure, 
                   enclosure.meal, biomes.id_biome, biomes.name AS biome_name, biomes.color AS biome_color
            FROM animaux
            INNER JOIN enclosure_animals ON animaux.id_animal = enclosure_animals.id_animal
            INNER JOIN enclosure ON enclosure.id_enclosure = enclosure_animals.id_enclosure
            INNER JOIN biomes ON enclosure.id_biome = biomes.id_biome
            ORDER BY biomes.id_biome, enclosure.id_enclosure, animaux.id_animal";

    try {
        $stmt = $pdo->query($req);
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

        $biomeData = [];

        foreach ($result as $row) {
            $biomeId = (int)$row['id_biome'];
            $biomeName = $row['biome_name'];
            $biomeColor = $row['biome_color'];

            // Vérifier si un biome existe déjà, sinon l'ajouter
            if (!isset($biomeData[$biomeId])) {
                $biomeData[$biomeId] = ['biome_name' => $biomeName, 'biome_color' => $biomeColor, 'enclosures' => []];
            }

            $enclosureId = (int)$row['id_enclosure'];
            $meal = (int)$row['meal'];
            $animalName = $row['animal_name'];

            // Vérifier si l'enclos existe déjà dans ce biome
            $enclosureFound = false;
            foreach ($biomeData[$biomeId]['enclosures'] as &$enclosure) {
                if ($enclosure['id_enclosure'] === $enclosureId) {
                    $enclosure['animals'][] = $animalName;
                    $enclosureFound = true;
                    break;
                }
            }

            // Si l'enclos n'a pas été trouvé, l'ajouter
            if (!$enclosureFound) {
                $biomeData[$biomeId]['enclosures'][] = [
                    'id_enclosure' => $enclosureId,
                    'meal' => $meal,
                    'animals' => [$animalName]
                ];
            }
        }

        return $biomeData;
    } catch (PDOException $e) {
        // Enregistrer l'erreur et retourner un tableau vide
        error_log("Erreur lors de la récupération des données : " . $e->getMessage());
        return [];
    }
}

?>
