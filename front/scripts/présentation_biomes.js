console.log("Script biome-popup chargé !");

async function fetchAndDisplay() {

try {
    // fetch data from back
    const result = await fetch("../../back/biome.php");
    
    if (!result.ok) {
      throw new Error(`Erreur HTTP : ${result.status}`);
    }
    const data =await result.json();

    // the container for all biomes sections
    const container = document.getElementById("container");
    // run through biomes
    Object.values(data).forEach((biome)=>{

        // creation of one biome section
        const biomeSection = document.createElement("div");
        biomeSection.classList.add("wrapper2");
        biomeSection.style.backgroundColor = biome.biome_color;

        const biomeTitle = document.createElement("h2");
        const biomeSpace = document.createElement("br");
        biomeTitle.textContent = `${biome.biome_name}`;
        biomeSection.appendChild(biomeTitle);
        biomeSection.appendChild(biomeSpace);
        

        // run through enclosure
        const grid = document.createElement("div");
        grid.classList.add("cards");
        Object.values(biome).forEach((enclosure) => {
            if (enclosure.animals && enclosure.animals.length > 0) {
              // Création de la section pour un enclos
              const enclosureSection = document.createElement("div");
              enclosureSection.classList.add("card");
              enclosureSection.setAttribute("data-enclos",enclosure.id_enclosure)
          
              // Image du premier animal
              const firstAnimal = enclosure.animals[0];
              const animalImage = document.createElement("img");
              animalImage.src = `../../assets/animaux/${firstAnimal}.jpg`;
              animalImage.alt = firstAnimal;
          
              enclosureSection.appendChild(animalImage);
          
              // Ajout à la section du biome si l'enclosureSection existe
              if (enclosureSection) {
                grid.appendChild(enclosureSection)
              }
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

async function init() {
    await fetchAndDisplay();
    popupBiome();
}

init();