<?php
    include '../../back/bdd.php';
    $biomeData=get_database();

?>

<html>
    <head>
        <meta charset="UTF-8"> <!--caractères spéciaux bien affichés-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!--adapter tel et tab-->
        <link rel="icon" type="image/png" href="../../assets/logos/otter.png">
        <title>Présentation</title>
        <link rel="stylesheet" href="../style/style1.css">
        <link rel="stylesheet" href="../style/comm.css">
        <link rel="stylesheet" href="../style/enclos.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <div class="nav">
            <a href="accueil_zoo.html">
                <img src="../../assets/logos/logo_png.png">
            </a>
            <a href="présentation_biomes.php"><strong>NOS ENCLOS</strong></a>
            <a href="services.html"><strong>NOS SERVICES</strong></a>
            <a href="billeterie.html"><strong>PRENEZ VOS BILLETS</strong></a>
            <input type="text" placeholder="Recherche..">
            <div>
            <a href="connexion.php" class="btn"><strong>CONNEXION</strong></a>
            </div>
        </div>
    </head>
    <body>
        <br>
            <?php
                /* fetch in biome data the name of the biome
                   then fetch each enclosure and print the name 
                   of the first animal
                */
                foreach($biomeData as $biome){
                    echo '<div class="wrapper2" style=" background-color: '.$biome["biome_color"].'">';
                    echo '<h2>'.$biome['biome_name'].'<h2>';
                    echo '<br>';
                    echo '<div class="cards">';
                    foreach($biome as $enclosure){
                        if($enclosure==$biome["biome_name"] || $enclosure==$biome["biome_color"]){
                            continue;
                        }
                        echo '<div class="card" data-enclos='.$enclosure["id_enclosure"].'><img src="../../assets/animaux/'.$enclosure['animals'][0].'.jpg"></div>';
                    }
                    echo '</div>';
                    echo '<br>';
                    echo '</div>';
                }

                /*girls, you have to make these picture clicable 
                and showing a popup with a carousel that i will fill with picture
                you can just put html code in php by type echo 'your html here';
                */
            ?>
            <div id="popup" class="popup">
                <div class="popup-content">
                <span class="close-btn">&times;</span>
                <div id="popup-content"></div>
            </div>
    </body>
    <script src="./popupBiome.js"></script>

<footer>
    <div class="footer">
            <p>&copy; 2024 Zoo de la Barben. Tous droits réservés.</p>
            <div class="social-links">
                <a href="#facebook">
                    <img src="../../assets/logos/facebook.png">
                </a>
                <a href="#x">
                    <img src="../../assets/logos/X-Logo.png">
                </a>
                <a href="#instagram">
                    <img src="../../assets/logos/Instagram-Logo.png">
                </a>
            </div>
        </div>
    </footer>
</html>