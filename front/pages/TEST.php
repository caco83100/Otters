<?php
include '../../back/bdd.php';
$biomeData = get_database();
?>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Présentation Biomes</title>
    <link rel="stylesheet" href="../style/style1.css">
    <link rel="stylesheet" href="../style/TEST.css">
</head>
<body>
    <div class="nav">
        <a href="accueil_zoo.html"><img src="../../assets/logos/logo_png.png" alt="Logo"></a>
        <a href="présentation_biomes.php"><strong>NOS ENCLOS</strong></a>
        <a href="services.html"><strong>NOS SERVICES</strong></a>
        <input type="text" placeholder="Recherche..">
        <a href="connexion.php" class="btn"><strong>CONNEXION</strong></a>
    </div>

    <?php foreach ($biomeData as $biome): ?>
        <div class="wrapper2" style="background-color: <?= $biome['biome_color'] ?>">
            <h2><?= htmlspecialchars($biome['biome_name']) ?></h2>
            <div class="cards">
                <?php foreach ($biome as $enclosure): 
                        if($enclosure==$biome["biome_name"] || $enclosure==$biome["biome_color"]){
                            continue;
                        }
                        ?>
                    <div class="card" data-id="<?= $enclosure["id_enclosure"] ?>">
                        <img src="../../assets/animaux/<?= htmlspecialchars($enclosure['animals'][0]) ?>.jpg" alt="<?= htmlspecialchars($enclosure['id_enclosure']) ?>">
                        <p><?= htmlspecialchars($enclosure['id_enclosure']) ?></p>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    <?php endforeach; ?>

    <!-- Popup -->
    <div id="popup" class="popup">
        <div class="popup-content">
            <span class="close-btn">&times;</span>
            <div id="popup-content"></div>
        </div>
    </div>

    <footer>
        <div class="footer">
            <p>&copy; 2024 Zoo de la Barben. Tous droits réservés.</p>
        </div>
    </footer>
    <script src="../js/popup.js"></script>
</body>
</html>
