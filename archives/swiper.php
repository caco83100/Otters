<?php
$server ="localhost";
$username="root";
$password="";
$databaseName="Otters";

$conn = new mysqli($server,$username,$password,$databaseName);
if($conn->connect_error){
    die("connection BDD échouée");
}

$req="SELECT nom FROM animaux WHERE biome='$biome'";

$result=$conn->query($req);
$animaux=array();
while($row=$result->fetch_assoc()){
    $nom["nom"]=$row["nom"];
    $animaux[]=$nom;
}
?>