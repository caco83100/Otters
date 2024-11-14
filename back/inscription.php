<?php

$prenom=$_POST["PRENOM"];
$nom=$_POST["NOM"];
$date=$_POST["DATE"];
$pseudo=$_POST["PSEUDO"];
$mail=$_POST["MAIL"];
$mdp=$_POST["MDP"];
$nl=$_POST["NL"];

$server ="localhost";
$username="root";
$password="";
$databaseName="Otters";

$conn = new mysqli($server,$username,$password,$databaseName);
if($conn->connect_error){
    die("connection BDD échouée");
}

$req="INSERT INTO users (NOM, PRENOM, DATE, PSEUDO, MAIL, MDP, NL) VALUES ('$nom', '$prenom', '$date', '$pseudo', '$mail', '$mdp', $nl)";
$conn->query($req);

$conn->close();

header("Location: ../front/pages/inscription.php");
exit();

?>