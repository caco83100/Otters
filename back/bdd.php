<?php
$server ="localhost";
$username="root";
$password="";
$databaseName="Otters";

$conn = new mysqli($server,$username,$password,$databaseName);
if($conn->connect_error){
    die("connection BDD échouée");
}

$req="SELECT animaux.name FROM animaux, enclosure_animals, enclosure WHERE enclosure.id_biome=5 AND enclosure.id_enclosure=enclosure_animals.id_enclosure AND animaux.id_animal=enclosure_animals.id_animal";

$req_enclos="SELECT * FROM enclosure";

$result=$conn->query($req_enclos);
$enclos=array();
while($row=$result->fetch_assoc()){
    $tab["id_enclosure"]=$row["id_enclosure"];
    $tab["id_biome"]=$row["id_biome"];
    $tab["meal"]=$row["meal"];
    $enclos[]=$tab;
}




$result=$conn->query($req);
$animaux=array();
while($row=$result->fetch_assoc()){
    $name["name"]=$row["name"];
    $animaux[]=$name;
}
var_dump($enclos);
?>