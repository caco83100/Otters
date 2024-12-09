<?php
session_start();
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"> <!--caractères spéciaux bien affichés-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!--adapter tel et tab-->
        <link rel="icon" type="image/png" href="../../assets/logos/otter.png">
        <title>Login page</title>
        <link rel="stylesheet" href="../style/style1.css">
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
        <div class="wrapper">
        <form action="../../back/connexion_test.php" method="post">
            <h2>CONNECTEZ-VOUS</h2>
            <div class="userandpswd">
                <input type="text" placeholder="Nom d'utilisateur / Adresse e-mail" name="IDENTIFIANT" required>
            </div>
            <div class="userandpswd">
                <input type="password" placeholder="Mot de passe" name="MDP" required>
            </div>
            
            
            
            <div id="error-message">
                <?php
                    
                    if (isset($_POST['IDENTIFIANT'], $_POST['MDP'])) {
                        $isAdminIdentifiant = 'admin'; 
                        $isAdminMdp = '1234'; 
                    

                    if($_POST["IDENTIFIANT"]==$isAdminIdentifiant AND $_POST["MDP"]==$isAdminMdp){
                        $_SESSION['MDP']=$_POST['MDP'];
                        header('Location: index.php');
                        exit();
                    } else{
                        $_SESSION['afficher_element']=true;
                        echo("Mot de passe erroné, veuillez réessayer");
                    }
                }
                else{
                    echo'<div class="centered-paragraph">Veuillez renseigner tous les champs</div>';
                }

                    if(isset($_SESSION['afficher_element']) && $_SESSION['afficher_element']){
                        session_destroy();
                    }

                    
                ?>
            </div>
            <br>
            <div class="remember-forgot">
                <label><input type="checkbox">Se souvenir de moi</label>
                <a href="#">Mot de passe oublié ?</a>
            </div>
            <br>
            <button type="submit" class="bton">Connexion</button>

            <div class="register-link">
                <p>Pas de compte ? <a href="inscription.html">S'inscrire</a></p>
            </div>
        </form>
    </div>
    </body>
</html>