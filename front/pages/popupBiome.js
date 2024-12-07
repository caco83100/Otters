console.log("Script chargé !");
console.log("Cartes trouvées :", document.querySelectorAll(".card").length);

document.addEventListener("DOMContentLoaded", function () {
    const popup = document.getElementById("popup");
    const popupContent = document.getElementById("popup-content");
    const closeBtn = document.querySelector(".close-btn");
    const boxes = document.querySelectorAll(".card");

    console.log("Boxes trouvées :", boxes.length);

    // Associer les événements de clic aux cartes
    boxes.forEach((box) => {
        box.addEventListener("click", () => {
            const enclosureId = box.getAttribute("data-enclos");
            console.log("ID d'enclos cliqué :", enclosureId);

            // Requête AJAX pour récupérer les données JSON
            fetch('../../back/popupBiome.php')
                .then((response) => response.json()) // Décoder le JSON
                .then((data) => {
                    // Trouver l'enclos correspondant dans les données
                    const enclosure = findEnclosureById(data, enclosureId);
                    if (enclosure) {
                        // Afficher les informations de l'enclos dans le popup
                        displayPopup(enclosure);
                        popup.style.display = "flex"; // Afficher le popup
                    } else {
                        console.error("Enclos introuvable !");
                    }
                })
                .catch((error) => console.error("Erreur lors de la récupération des données :", error));
        });
    });

    closeBtn.addEventListener("click", () => {
        popup.style.display = "none"; // Fermer le popup
    });

    window.addEventListener("click", (event) => {
        if (event.target === popup) {
            popup.style.display = "none"; // Fermer le popup si on clique à l'extérieur
        }
    });

    /**
     * Trouve un enclos par ID dans les données JSON.
     * @param {Object} data - Les données JSON complètes des biomes.
     * @param {string} id - L'ID de l'enclos à trouver.
     * @returns {Object|null} - Les données de l'enclos ou null si introuvable.
     */
    function findEnclosureById(data, id) {
        for (const biomeKey in data) {
            const biome = data[biomeKey];
            for (const enclosureKey in biome) {
                const enclosure = biome[enclosureKey];
                if (enclosure.id_enclosure && enclosure.id_enclosure.toString() === id) {
                    return enclosure;
                }
            }
        }
        return null;
    }

    /**
     * Affiche les données d'un enclos dans le popup.
     * @param {Object} enclosure - Les données de l'enclos.
     */
    function displayPopup(enclosure) {
        const animals = enclosure.animals || [];
        console.log(enclosure);
        console.log(animals);
        popupContent.innerHTML = `
            <h2>Enclos ID : ${enclosure.id_enclosure}</h2>
            <ul>
                ${animals.map((animal) => `<li>${animal}</li>`).join('')}
            </ul>
            <p>Nombre de repas: ${enclosure.meal}</p>
            
            <!-- Lignes HTML insérées ici -->
            <div class="enclos-container">
                <h1>Le Belvédère</h1>
                
                <!-- Swiper container principal -->
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                    ${animals.map((animal) => ` <div class="swiper-slide"><img src='../../assets/animaux/${animal}.jpg' alt='${animal}'><p>${animal}</p></div>`).join('')}
                    </div>

                    <!-- Pagination et navigation -->
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
            </div>
            
            <div class="comment-section">
                <h3>Laissez un commentaire :</h3>
                <form id="commentForm" class="comment-form">
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
                <div id="commentDisplay"></div>
            </div>
        `;
        //Script pour initialiser Swiper

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
    }
});
