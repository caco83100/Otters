<?php
include '../../back/bdd.php';

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $enclosure = get_enclosure_by_id($id); // Implémente cette fonction dans ta logique backend

    if ($enclosure) {
        echo '<div class="swiper mySwiper">';
        echo '<div class="swiper-wrapper">';
        foreach ($enclosure['animals'] as $animal) {
            echo '<div class="swiper-slide">';
            echo "<img src='../../assets/animaux/{$animal}.jpg' alt='{$animal}'>";
            echo "<p>{$animal}</p>";
            echo '</div>';
        }
        echo '</div>';
        echo '<div class="swiper-pagination"></div>';
        echo '<div class="swiper-button-next"></div>';
        echo '<div class="swiper-button-prev"></div>';
        echo '</div>';
        echo "<p>{$enclosure['description']}</p>";
    } else {
        echo "<p>Enclos non trouvé.</p>";
    }
} else {
    echo "<p>ID non fourni.</p>";
}
?>
