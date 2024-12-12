<?php

/* Connection to database */
    $server="localhost";
    $username="root";
    $password="";
    $databaseName="Otters";

    $conn=new mysqli($server,$username,$password,$databaseName);
    if($conn->connect_error){die("Connection BDD échouée");}
    
?>