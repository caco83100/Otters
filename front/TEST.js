// Get the modal and the close button
const modal = document.getElementById("popup");
const closeButton = document.querySelector(".close-btn");

// When an image is clicked, open the popup
document.querySelectorAll('.card').forEach(card => {
    card.addEventListener('click', function() {
        const enclosureId = card.getAttribute('data-enclos');
        openPopup(enclosureId);  // You can replace with a dynamic function to load data
    });
});

// Function to open the popup and show content
function openPopup(enclosureId) {
    const popupContent = document.getElementById('popup-content');
    popupContent.innerHTML = `<h3>Enclos ID: ${enclosureId}</h3><p>Here will be the carousel or more information.</p>`;
    modal.style.display = "flex";
}

// Close the popup when the close button is clicked
closeButton.addEventListener('click', function() {
    modal.style.display = "none";
});

// Close the popup if the user clicks outside the modal
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
};


console.log("Script chargé !");
console.log("Boxes trouvées :", document.querySelectorAll(".boxS").length);

document.addEventListener("DOMContentLoaded", function () {
  // Sélection de toutes les boxes avec la classe "boxS"
  const boxes = document.querySelectorAll(".boxS");
  console.log("Boxes trouvées :", boxes.length);


  // Sélection de la pop-up et du texte
  const popup = document.getElementById("popup");
  const popupText = document.getElementById("popup-text");
  const closeBtn = document.querySelector(".close-btn");

  // Ajout des écouteurs d'événements aux boxes
  boxes.forEach((box) => {
    box.addEventListener("click", () => {
      console.log("Une box a été cliquée !");

      // Récupération de la valeur de data-service
      const service = box.getAttribute("data-service");
      console.log("Service cliqué :", service);

      // Vérifie si le service a du contenu associé
      if (serviceContent[service]) {
        const content = serviceContent[service];

        // Si le service a une redirection définie
        if (content.redirect) {
          // Redirige immédiatement vers l'URL
          window.location.href = content.redirect;
        } else {
          // Mise à jour du texte et de l'image pour afficher la pop-up
          popupText.textContent = content.text;

          const popupImage = document.getElementById("popup-image");
          if (popupImage) {
            popupImage.src = content.image; // Définit la source de l'image
            popupImage.alt = `Image pour le service ${service}`; // Définit le texte alternatif
            console.log("Image mise à jour :", popupImage.src);
          }

          // Affichage de la pop-up
          popup.style.display = "flex";
        }
      } else {
        console.error("Service non trouvé :", service);
        popupText.textContent = "Service non trouvé.";
      }
    });
  });

  // Ajout d'un écouteur d'événement au bouton de fermeture
  if (closeBtn) {
    closeBtn.addEventListener("click", () => {
      console.log("Fermeture de la pop-up.");
      popup.style.display = "none"; // Masque la pop-up
    });
  }

  // Ferme la pop-up en cliquant en dehors de son contenu
  window.addEventListener("click", (e) => {
    if (e.target === popup) {
      console.log("Clic en dehors de la pop-up !");
      popup.style.display = "none"; // Masque la pop-up
    }
  });
});


fetch('../../front/pages/TEST2.php?id=${id}') // Remplacez l'URL par celle correcte
    .then(response => response.text()) // Lire la réponse brute en texte
    .then(text => {
        console.log('Réponse brute :', text); // Affichez le contenu brut
        const data = JSON.parse(text); // Tente de convertir en JSON
        console.log('Données JSON :', data);
    })
    .catch(error => console.error('Erreur lors de la récupération des données :', error));

