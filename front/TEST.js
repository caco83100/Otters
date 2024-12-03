document.addEventListener("DOMContentLoaded", function () {
  const popup = document.getElementById("popup");
  const popupContent = document.getElementById("popup-content");
  const closeBtn = document.querySelector(".close-btn");

  document.querySelectorAll(".card").forEach((card) => {
      card.addEventListener("click", () => {
          const enclosureId = card.getAttribute("data-id");

          // Récupérer le contenu via une requête Ajax vers une page PHP
          fetch(`TEST2.php?id=${enclosureId}`)
              .then((response) => response.text())
              .then((data) => {
                  popupContent.innerHTML = data;
                  popup.style.display = "flex";
              })
              .catch((error) => console.error("Erreur:", error));
      });
  });

  closeBtn.addEventListener("click", () => {
      popup.style.display = "none";
  });

  window.addEventListener("click", (event) => {
      if (event.target === popup) {
          popup.style.display = "none";
      }
  });
});
