<?php
$biome='La Bergerie des Reptiles';
include '../../back/swiper.php';
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
        <link rel="stylesheet" href="../../front/style/style1.css">
        <link rel="stylesheet" href="../../front/style/enclos.css">
        <link rel="stylesheet" href="../../front/style/comm.css">
        <script src="../commentaires.js"></script>

        <!-- Lien vers le CSS de Swiper -->
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
      
        <!-- Lien vers le script JS de Swiper -->
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
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
            <a href="connexion.html" class="btn"><strong>CONNEXION</strong></a>
            </div>
        </div>
    <title>La Bergerie des Reptiles</title>
</head>

<body>
    <div class="enclos-container">
      <h1> La Bergerie des Reptiles</h1>
      
      <!-- Swiper container principal -->
      <div class="swiper mySwiper">
        <div class="swiper-wrapper">
          
        <?php
          if (!empty($animaux)) {
            foreach ($animaux as $animal) {
              $animal['nom'] = str_replace("'", "%27", $animal['nom']);
              echo '<div class="swiper-slide">';
              echo "<img src='../../assets/animaux/$biome/{$animal['nom']}.jpg' alt=' {$animal['nom']}' />";
              $animal['nom'] = str_replace("%27", "'", $animal['nom']);
              echo "<p>{$animal['nom']}</p>";
              echo '</div>';  
            }
        } else {
            echo "<p>Aucun animal trouvé.</p>";
        }
          ?>

        </div>
  
        <!-- Pagination et navigation -->
        <div class="swiper-pagination"></div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
      </div>
    </div>
  
    <!-- Script pour initialiser Swiper -->
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        const swiper = new Swiper('.mySwiper', {
          // Activer la boucle
          loop: true,
  
          // Paramètres de navigation
          navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
          },
  
          // Pagination
          pagination: {
            el: '.swiper-pagination',
            clickable: true,
          },
  
          // Lecture automatique
          autoplay: {
            delay: 3000,
            disableOnInteraction: false,
          },
        });
      });
    </script>
    <div class="comment-section">
      <h3>Laissez un commentaire :</h3>
      <form id="commentForm" class="comment-form" action="../../back/commentaire.php">
          <label for="username">Nom d'utilisateur :</label>
          <input type="text" id="username" required placeholder="Entrez votre nom..." /><br><br>

          <label for="rating">Évaluation (de 1 à 5 étoiles) :</label>
          <div id="rating" class="stars">
              <span class="star" data-value="1">&#9733;</span>
              <span class="star" data-value="2">&#9733;</span>
              <span class="star" data-value="3">&#9733;</span>
              <span class="star" data-value="4">&#9733;</span>
              <span class="star" data-value="5">&#9733;</span>
          </div><br><br>

          <label for="comment">Votre commentaire :</label><br>
          <textarea id="comment" class="comment-box" rows="4" placeholder="Écrivez votre commentaire ici..." required></textarea><br><br>

          <button type="button" class="submit-btn" onclick="addComment()">Soumettre</button>
      </form>

      <!-- Zone d'affichage des commentaires -->
      <div id="commentDisplay"></div>
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