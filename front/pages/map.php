<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"> <!--caractères spéciaux bien affichés-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" type="image/png" href="../../assets/logos/otter.png">
        <title>Page d'accueil</title>
        <link rel="stylesheet" href="../style/style1.css">
        <link rel="stylesheet" href="../style/enclos.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <div class="nav">
            <a href="accueil_zoo.html">
                <img src="../../assets/logos/logo_png.png">
            </a>
            <a href="présentation_biomes.html"><strong>NOS ENCLOS</strong></a>
            <a href="services.html"><strong>NOS SERVICES</strong></a>
            <a href="billeterie.html"><strong>PRENEZ VOS BILLETS</strong></a>
            <input type="text" placeholder="Recherche..">
            <div>
            <a href="connexion.php" class="btn"><strong>CONNEXION</strong></a>
            </div>
        </div>
    </head>
    <body>
        <div class="wrapper2 map-display"> 
            <img usemap="#mappingmap" src='../../assets/plan-du-parc.png' width="900" height="600">
            <map name="mappingmap">
                <area shape="circle" coords="280,170,15" href="#" enclosid="1" role-enclos="belvedere" />
            </map>
        </div>

    </body>

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