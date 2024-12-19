console.log("Script chargé !");

async function getServices() {
    try {
        // Récupérer les données depuis le serveur
        const result = await fetch("../../back/service.php");

        if (!result.ok) {
            throw new Error(`Erreur HTTP : ${result.status}`);
        }

        const services = await result.json();
        console.log("Données reçues : ", services);
        return services;
    } catch (error) {
        console.error("Erreur lors de la récupération des données :", error);
        return {};  // Retourner un objet vide en cas d'erreur
    }
}

document.addEventListener("DOMContentLoaded", async function () {
    const services = await getServices();
    const servicesContainer = document.getElementById("services-container");

    if (Object.keys(services).length > 0) {
        // Itérer sur les types de services
        for (const [type, serviceGroup] of Object.entries(services)) {
            // Créer une box pour chaque type de service
            const box = document.createElement('div');
            box.classList.add('boxS'); // Appliquer la classe "boxS" pour le style

            const boxHeader = document.createElement('div');
            boxHeader.classList.add('box-headerS');
            boxHeader.textContent = type;  // Afficher le type de service (Activités, Restauration, etc.)
            box.appendChild(boxHeader);

            // Ajouter un écouteur d'événement sur la box
            box.addEventListener("click", function () {
                showServiceDetails(type, serviceGroup);
            });

            // Ajouter la box au container
            servicesContainer.appendChild(box);
        }
    } else {
        console.log("Aucun service trouvé ou erreur dans les données");
    }

    // Fonction pour afficher les détails dans la pop-up
    function showServiceDetails(type, serviceGroup) {
        const popup = document.getElementById("popup");
        const popupText = document.getElementById("popup-text");
        const popupImage = document.getElementById("popup-image");

        let serviceDetails = `<h4>${type}</h4>`; // Ajouter le titre du type de service

        // Itérer sur chaque service du groupe
        for (const [serviceName, biomes] of Object.entries(serviceGroup)) {
            serviceDetails += `<p><strong>${serviceName}</strong><br>Biomes associés : ${biomes.join(", ")}</p>`;
        }

        // Mettre à jour le contenu de la pop-up
        popupText.innerHTML = serviceDetails;

        // Utiliser le nom du type pour créer le nom de l'image
        const imageName = `${type}.jpg`; // Le nom de l'image basée sur le type
        popupImage.src = `../../assets/images/${imageName}`;
        popupImage.alt = `Image pour le service ${type}`;

        // Afficher la pop-up
        popup.style.display = "flex";
    }

    // Gestion de la fermeture de la pop-up
    const closeBtn = document.querySelector(".close-btn");
    const popup = document.getElementById("popup");

    if (closeBtn) {
        closeBtn.addEventListener("click", function () {
            popup.style.display = "none";
        });
    }

    // Fermer la pop-up en cliquant en dehors de la fenêtre
    window.addEventListener("click", function (e) {
        if (e.target === popup) {
            popup.style.display = "none";
        }
    });
});
