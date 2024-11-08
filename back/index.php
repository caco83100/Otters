<?php

$prenom=$_POST["PRENOM"];
$nom=$_POST["NOM"];
$mail=$_POST["MAIL"];
$mdp=$_POST["MDP"];

$server ="localhost";
$username="root";
$password="";
$databaseName="projetweb";

$conn = new mysqli($server,$username,$password,$databaseName);
if($conn->connect_error){
    die("connection BDD échouée");
}

$req="INSERT INTO useraccount (NOM, PRENOM, MAIL, MDP) VALUES ('$nom', '$prenom', '$mail', '$mdp')";
$conn->query($req);

$conn->close();

header("Location: index.html");
exit();

?>