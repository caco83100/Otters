<?php
include "./bdd.php";
header('Content-Type: application/json');

function get_database(){
    global $conn;

    $req="SELECT services.name AS name, 
                services.type AS type, 
                biomes.name AS biomeName 
            FROM services 
            INNER JOIN service_biomes ON services.id_service=service_biomes.id_service 
            INNER JOIN biomes ON service_biomes.id_biome=biomes.id_biome 
            ORDER BY services.type";


    /* Fetch data */
    $result=$conn->query($req);
    $services=[];

    foreach($result as $row){
        $type=$row['type'];
        $name=$row['name'];
        $biomeName=$row['biomeName'];
        
        if(!isset($services[$type])){
            $services[$type]=[];
        }
        if(!isset($services[$type][$name])){
            $services[$type][$name]=[];
        }
        
        $services[$type][$name][]=$biomeName;
    }
    echo(json_encode($services));
}

get_database();
?>