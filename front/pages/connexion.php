<?php
session_start();
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"> <!--caractères spéciaux bien affichés-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!--adapter tel et tab-->
        <title>Login page</title>
        <link rel="stylesheet" href="../style/style1.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <div class="nav">
            <a href="accueil_zoo.html">
                <img src="../../assets/logos/logo_png.png">
            </a>
            <div class="enclos-contain">
                    <button class="enclos-button"><strong>NOS BIOMES</strong></button>
                    <div class="dropdown-enclos">
                        <a href="présentation_biomes.html">Présentation</a>
                        <a href="bergerie.php">La Bergerie des reptiles</a>
                        <a href="vallon.php">Le Vallon des Cascades</a>
                        <a href="belvedere.php">Le Belvédère</a>
                        <a href="plateau.php">Le Plateau</a>
                        <a href="bois.php">Le Bois des Pins</a>
                        <a href="clairieres.php">Les Clairières</a>
                    </div>
                </div>
            <a href="#about"><strong>NOS SERVICES</strong></a>
            <a href="billeterie.html"><strong>PRENEZ VOS BILLETS</strong></a>
            <input type="text" placeholder="Recherche..">
            <div>
            <a href="connexion.php" class="btn"><strong>CONNEXION</strong></a>
            </div>
        </div>
    </head>
    <body>
        <div class="wrapper">
        <form action="../../back/connexion_test.php" method="post">
            <h1>CONNECTEZ-VOUS</h1>
            <div class="userandpswd">
                <input type="text" placeholder="Nom d'utilisateur / Adresse e-mail" name="IDENTIFIANT" required>
            </div>
            <div class="userandpswd">
                <input type="password" placeholder="Mot de passe" name="MDP" required>
            </div>
            
            
            
            <div id="error-message">
                <!-- remplir ce div avec un message d'erreur en cas de connexion échouée -->
                <?php
                    // Vérifiez si l'élément doit être affiché
                    
                    if (isset($_SESSION['afficher_element']) && $_SESSION['afficher_element']) {
                        echo "Mdp faux";
                        session_destroy();
                    }else{
                        session_destroy();
                    }
                     
                    
                ?>
            </div>

            <div class="remember-forgot">
                <label><input type="checkbox">Se souvenir de moi</label>
                <a href="#">Mot de passe oublié ?</a>
            </div>

            <button type="submit" class="bton">Connexion</button>

            <div class="register-link">
                <p>Pas de compte ? <a href="inscription.html">S'inscrire</a></p>
            </div>
        </form>
    </div>
    </body>
</html>