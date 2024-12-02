console.log("Script chargé !");
console.log("Boxes trouvées :", document.querySelectorAll(".boxS").length);
console.log("Popup trouvé :", document.getElementById("popup"));
console.log("Bouton de fermeture trouvé :", document.querySelector(".close-btn"));


document.addEventListener("DOMContentLoaded", function() {
    const popup = document.getElementById("popup");
    const closeBtn = document.querySelector(".close-btn");
  
    console.log("Popup trouvé :", popup);
    console.log("Bouton de fermeture trouvé :", closeBtn);
  
    if (popup && closeBtn) {
      const boxes = document.querySelectorAll(".boxS");
      console.log("Boxes trouvées :", boxes.length);
  
      boxes.forEach((box) => {
        box.addEventListener("click", () => {
          console.log("Une box a été cliquée !");
          popup.style.display = "flex"; // Affiche la pop-up
        });
      });
  
      closeBtn.addEventListener("click", () => {
        console.log("Fermeture de la pop-up.");
        popup.style.display = "none"; // Masque la pop-up
      });
  
      // Ferme la pop-up en cliquant en dehors de son contenu
      window.addEventListener("click", (e) => {
        if (e.target === popup) {
          console.log("Clic en dehors de la pop-up !");
          popup.style.display = "none"; // Masque la pop-up
        }
      });
    } else {
      console.error("Éléments HTML manquants pour le pop-up !");
    }
  });
  

























// Sélectionne toutes les box avec la classe "boxS"
const boxes = document.querySelectorAll(".boxS");

// Sélectionne les éléments de la pop-up
const popup = document.getElementById("popup");
const popupText = document.getElementById("popup-text");
const closeBtn = document.querySelector(".close-btn");

// Vérification que les éléments existent
if (boxes && popup && closeBtn) {
  // Ajoute un événement de clic à chaque box
  boxes.forEach((box) => {
    box.addEventListener("click", () => {
      console.log("Une box a été cliquée !");
      popup.style.display = "flex"; // Affiche la pop-up
    });
  });

  // Ferme la pop-up en cliquant sur le bouton "fermer"
  closeBtn.addEventListener("click", () => {
    console.log("Bouton de fermeture cliqué !");
    popup.style.display = "none"; // Masque la pop-up
  });

  // Ferme la pop-up en cliquant en dehors de son contenu
  window.addEventListener("click", (e) => {
    if (e.target === popup) {
      console.log("Clic en dehors de la pop-up !");
      popup.style.display = "none"; // Masque la pop-up
    }
  });
} else {
  console.error("Éléments HTML manquants pour le pop-up !");
}
