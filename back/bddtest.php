<?php
    include './bdd.php';
    $biome=get_database();
    
    $tab=json_encode($biome);
    echo $tab;
?>