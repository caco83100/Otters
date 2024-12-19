<?php
include "./bdd.php";
header('Content-Type: application/json');

function get_database()
{
    global $conn;

    $req="SELECT animaux.id_animal, animaux.name AS animal_name, enclosure.id_enclosure, 
                   enclosure.meal, biomes.id_biome, biomes.name AS biome_name, biomes.color AS biome_color,
                   enclosure.travaux AS travaux,
                   animaux.description AS description
            FROM animaux
            INNER JOIN enclosure_animals ON animaux.id_animal=enclosure_animals.id_animal
            INNER JOIN enclosure ON enclosure.id_enclosure=enclosure_animals.id_enclosure
            INNER JOIN biomes ON enclosure.id_biome=biomes.id_biome
            ORDER BY biomes.id_biome, enclosure.id_enclosure, animaux.id_animal";

    /* Fetch data */
    $result=$conn->query($req);

    $biomeData=[];

    foreach($result as $row){
        $biomeId=(int)$row['id_biome'];
        $biomeName=$row['biome_name'];
        $biomeColor=$row['biome_color'];

        /* Test if a biome does not already exist, if it doesn't then add it */
        if(!isset($biomeData[$biomeId])){
            $biomeData[$biomeId]=['biome_name'=>$biomeName,'biome_color'=>$biomeColor, 'enclosures'=>[]];
        }

        $enclosureId=(int)$row['id_enclosure'];
        $meal=$row['meal'];
        $travaux=$row['travaux'];
        $animalName=$row['animal_name'];
        $animalDescription=$row['description'];

        /* Check if the enclosure already exists in this biome */
        $enclosureFound=false;
        foreach($biomeData[$biomeId]['enclosures'] as &$enclosure){
            if($enclosure['id_enclosure']==$enclosureId){
                $enclosure['animals'][] = [
                    'name' => $animalName,
                    'description' => $animalDescription
                ];
                $enclosureFound=true;
                break;
            }
        }

        /* If no matching enclosure is found, add a new enclosure entry */
        if(!$enclosureFound){
            $biomeData[$biomeId]['enclosures'][] = [
                'id_enclosure' => $enclosureId,
                'meal' => $meal,
                'travaux' => $travaux,
                'animals' => [
                    [
                        'name' => $animalName,
                        'description' => $animalDescription
                    ]
                ]
            ];
        }
    }

    return $biomeData;
}

// Simule des données si elles ne proviennent pas de la base de données.
$tab=get_database();

// Encode les données en JSON.
echo (json_encode($tab, JSON_UNESCAPED_UNICODE));
?>
