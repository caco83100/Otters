console.log("Script biome-popup chargé !");

async function fetchAndDisplay() {
    try {
        // Fetch data from back
        const result = await fetch("../../back/biome.php");

        if (!result.ok) {
            throw new Error(`Erreur HTTP : ${result.status}`);
        }
        const data = await result.json();

        // The container for all biomes sections
        const container = document.getElementById("container");
        // Run through biomes
        Object.values(data).forEach((biome) => {

            // Creation of one biome section
            const biomeSection = document.createElement("div");
            biomeSection.classList.add("wrapper2");
            biomeSection.style.backgroundColor = biome.biome_color;

            const biomeTitle = document.createElement("h2");
            const biomeSpace = document.createElement("br");
            biomeTitle.textContent = `${biome.biome_name}`;
            biomeSection.appendChild(biomeTitle);
            biomeSection.appendChild(biomeSpace);

            // Run through enclosures
            const grid = document.createElement("div");
            grid.classList.add("cards");
            biome.enclosures.forEach((enclosure) => {
                if (enclosure.animals && enclosure.animals.length > 0) {
                    // Creation of a section for one enclosure
                    const enclosureSection = document.createElement("div");
                    enclosureSection.classList.add("card");
                    enclosureSection.setAttribute("data-enclos", enclosure.id_enclosure);

                    // Image of the first animal
                    const firstAnimal = enclosure.animals[0].name;
                    const animalImage = document.createElement("img");
                    animalImage.src = `../../assets/animaux/${firstAnimal}.jpg`;
                    animalImage.alt = firstAnimal;

                    enclosureSection.appendChild(animalImage);

                    // Add to biome section if enclosureSection exists
                    grid.appendChild(enclosureSection);
                }
            });
            biomeSection.appendChild(grid);
            container.appendChild(biomeSection);
        });
    } catch (error) {
        console.error("Erreur lors de la récupération des données :", error);
        const container = document.getElementById("container");
        if (container) {
            container.textContent = "Erreur lors du chargement des données.";
        } else {
            console.error("Le conteneur pour afficher les données est introuvable.");
        }
    }
}

function popupBiome() {
    console.log("Partie popup !");

    // Utilisation de querySelector pour une sélection plus flexible
    const popup = document.querySelector(".popup");
    const popupContent = document.querySelector(".popup-content");
    const closeBtn = document.querySelector(".close-btn");
    const boxes = document.querySelectorAll(".card");

    if (!popup || !popupContent || !closeBtn) {
        console.error("Un ou plusieurs éléments de popup sont introuvables !");
        return; // Stoppe la fonction si un élément essentiel est manquant
    }

    console.log("Boxes trouvées :", boxes.length);

    boxes.forEach((box) => {
        box.addEventListener("click", () => {
            const enclosureId = box.getAttribute("data-enclos");
            console.log("ID d'enclos cliqué :", enclosureId);

            // Requête AJAX pour récupérer les données JSON
            fetch('../../back/biome.php')
                .then((response) => response.json())
                .then((data) => {
                    const enclosure = findEnclosureById(data, enclosureId);
                    if (enclosure) {
                        displayPopup(enclosure, popupContent);
                        popup.style.display = "flex"; // Affiche le popup
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
}

function displayPopup(enclosure, popupContent) {
    const animals = enclosure.animals || [];
    console.log(enclosure);
    console.log(animals);
    let travauxTxt = 'Enclos accessible';
    if (enclosure.travaux == 1) {
        travauxTxt = 'Enclos en travaux';
    }
    popupContent.innerHTML = `
    <h2>Animaux présents dans cet enclos :</h2>
        <!-- Lignes HTML insérées ici -->
        <div class="enclos-container">
            
            <!-- Swiper container principal -->
            <div class="swiper mySwiper">
                <div class="swiper-wrapper">
                    ${animals.map((animal) => ` 
                        <div class="swiper-slide">
                            <img src='../../assets/animaux/${animal.name}.jpg' alt='${animal.name}'>
                            <p>${animal.name}</p>
                        </div>`).join('')}
                </div>

                <!-- Pagination et navigation -->
                <div class="swiper-pagination"></div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </div>

        <!--<h2>Enclos ID : ${enclosure.id_enclosure}</h2>-->
        
        <br>
        <ul>
        <label>${animals.map((animal) => `
            <li>
                <strong>${animal.name}</strong>: ${animal.description}
            </li>
        `).join('')}
        </label>
        </ul>
        <br>
        <label>Heure de repas: ${enclosure.meal}</label>
        <br>
        <label>${travauxTxt}</label>
        <br>
        
        <div class="comment-section">
            <h3>Laissez un commentaire :</h3>
            <br>
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
                </div><br>

                <label for="comment">Votre commentaire :</label><br>
                <textarea id="comment" class="comment-box" rows="4" placeholder="Écrivez votre commentaire ici..." required></textarea><br><br>

                <button type="button" class="submit-btn">Soumettre</button>
            </form>
            <div id="commentDisplay"></div>
        </div>
        <script src="commentaire.js"></script>
    `;

    // Script étoiles
    let selectedStars = 0;
    document.querySelectorAll('.star').forEach((star) => {
        star.addEventListener('click', () => {
            selectedStars = parseInt(star.getAttribute('data-value'), 10);
            document.querySelectorAll('.star').forEach((s) => s.classList.remove('selected'));
            for (let i = 0; i < selectedStars; i++) {
                document.querySelectorAll('.star')[i].classList.add('selected');
            }
        });
    });

    // Script pour initialiser Swiper
    const swiper = new Swiper('.mySwiper', {
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        autoplay: {
            delay: 3000,
            disableOnInteraction: false,
        },
    });

    // Ajouter la gestion du formulaire de commentaire
    document.querySelector('.submit-btn').addEventListener('click', (e) => {
        e.preventDefault(); // Empêche le rechargement de la page

        const username = document.getElementById("username").value.trim();
        const rating = selectedStars; // La note sélectionnée
        const comment = document.getElementById("comment").value.trim();

        if (username && rating && comment) {
            // Créer un nouvel élément pour afficher le commentaire
            const commentDisplay = document.getElementById("commentDisplay");

            const commentElement = document.createElement("div");
            commentElement.classList.add("user-comment");

            commentElement.innerHTML = `
                <h4>${username} - ${rating} étoiles</h4>
                <p>${comment}</p>
            `;

            commentDisplay.appendChild(commentElement);

            // Réinitialiser le formulaire
            document.getElementById("username").value = "";
            document.getElementById("comment").value = "";
            document.querySelectorAll('.star').forEach((s) => s.classList.remove('selected'));
        } else {
            alert("Veuillez remplir tous les champs !");
        }
    });
}

function findEnclosureById(data, id) {
    for (const biomeKey in data) {
        const biome = data[biomeKey];
        for (const enclosure of biome.enclosures) {
            if (enclosure.id_enclosure && enclosure.id_enclosure.toString() === id) {
                return enclosure;
            }
        }
    }
    return null;
}

async function setupSearch() {
    const searchBar = document.querySelector('.search-bar');
    const suggestionsList = document.querySelector('.suggestions');
    const searchResultsContainer = document.getElementById('searchResults');
    
    let data = []; // Pour stocker les données des biomes et des enclos
    
    // Récupérer les données au chargement de la page
    try {
        const result = await fetch("../../back/biome.php");
        if (result.ok) {
            data = await result.json();
        } else {
            console.error("Erreur lors de la récupération des données");
        }
    } catch (error) {
        console.error("Erreur lors de la récupération des données :", error);
    }

    // Fonction pour filtrer les animaux en fonction de la recherche
    function filterAnimals(query) {
        if (!query) {
            searchResultsContainer.innerHTML = ''; // Si aucune recherche, on vide les résultats
            return;
        }

        const filteredResults = [];
        Object.values(data).forEach(biome => {
            biome.enclosures.forEach(enclosure => {
                if (enclosure.animals) {
                    enclosure.animals.forEach(animal => {
                        if (animal.name.toLowerCase().includes(query.toLowerCase())) {
                            filteredResults.push({
                                biome: biome,
                                enclosure: enclosure,
                                animal: animal
                            });
                        }
                    });
                }
            });
        });

        // Affichage des résultats de recherche
        displaySearchResults(filteredResults);
    }

    // Afficher les résultats dans un nouveau div
    function displaySearchResults(results) {
        searchResultsContainer.innerHTML = ''; // Vider les résultats précédents

        if (results.length === 0) {
            searchResultsContainer.innerHTML = '<p>Aucun résultat trouvé.</p>';
            return;
        }

        results.forEach(result => {
            const resultItem = document.createElement('div');
            resultItem.classList.add('search-result');
            resultItem.innerHTML = `
                <h3>${result.animal.name}</h3>
                <p>Biome : ${result.biome.biome_name}</p>
            `;

            resultItem.addEventListener('click', () => {
                openPopupForEnclosure(result.enclosure); // Ouvre le popup du résultat
            });

            searchResultsContainer.appendChild(resultItem);
        });
    }

    // Ouvrir le popup avec swiper et commentaires
    function openPopupForEnclosure(enclosure) {
        const popup = document.querySelector(".popup");
        const popupContent = document.querySelector(".popup-content");
        
        displayPopup(enclosure, popupContent); // Réutiliser la fonction displayPopup pour afficher les détails
        popup.style.display = "flex"; // Afficher le popup
    }

    // Écouter les entrées de texte dans la barre de recherche
    searchBar.addEventListener('input', (e) => {
        const query = e.target.value;
        filterAnimals(query);
    });
}

async function init() {
    await fetchAndDisplay();
    popupBiome();
    setupSearch();
}

init();
