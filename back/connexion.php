<?php

$id=$_POST["IDENTIFIANT"];
$mdp=$_POST["MDP"];


$server ="localhost";
$username="root";
$password="";
$databaseName="Otters";

$conn = new mysqli($server,$username,$password,$databaseName);
if($conn->connect_error){
    die("connection BDD échouée");
}

$req="SELECT MDP FROM `users` WHERE PSEUDO='$id' OR MAIL='$id'";
$result=$conn->query($req);

$trueMdp = $result->fetch_assoc();

if($mdp==$trueMdp["MDP"]){
    echo "Connexion reussie";
}else{
    echo "MDP erroné";
}

?>