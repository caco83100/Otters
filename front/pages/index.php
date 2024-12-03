<?php
session_start();
if(!$_SESSION['MDP']){
    header('Location: connexion.php');
}

?>