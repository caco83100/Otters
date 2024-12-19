console.log("Script chargé !");

async function getServices() {
    try {
        // Récupérer les données depuis le serveur
        const result = await fetch("../../back/service.php");

<<<<<<< HEAD
        if (!result.ok) {
            throw new Error(`Erreur HTTP : ${result.status}`);
=======
    // fetch data from back
    const result = await fetch("../../back/service.php");
    
    if (!result.ok) {
      throw new Error(`Erreur HTTP : ${result.status}`);
    }
    const services =await result.json();
    return services;
  
  } catch (error) {
  console.error("Erreur lors de la récupération des données :", error);
  }
}

const services=getServices();

document.addEventListener("DOMContentLoaded", function () {
  // Sélection de toutes les boxes avec la classe "boxS"
  const boxes = document.querySelectorAll(".boxS");
  console.log("Boxes trouvées :", boxes.length);

  // Objet contenant le contenu dynamique pour chaque service
  const serviceContent = {
    gare: {
      text: "En famille ou entre amis, le petit train permet de rejoindre le cœur du parc facilement et agréablement. Attention, il ne fonctionne que les samedis, dimanches, jours fériés et durant les vacances scolaires.",
      image: "../../assets/photos_accueil/train.jpg",
    },
    "cafe-nomade": {
      text: "Pour une pause gourmande ou un repas rapide, le Café Nomade est l’adresse idéale ! Nichée dans un cadre convivial, moderne et chaleureux, cette escale culinaire propose une variété de délices pour petits et grands voyageurs.",
      image: "../../assets/images/resto.jpg",
    },
    map: {
      text: "Le plan interactif vous aide à repérer facilement les attractions, services et zones du parc. Cliquez pour découvrir !",
      image: "../../assets/images/map.jpg",
      redirect: "map.html" // Redirection vers la page HTML de la carte
    },
    adresse: {
      text: "Route du Château, 13330 La Barben, France.",
      image: "../../assets/images/adresse.jpg",
      redirect: "https://maps.app.goo.gl/vnGFPeJADqWp4tEZ8" // Lien Google Maps pour l'adresse
    },
    "Aires-picnic": {
      text: "Envie de profiter d’un repas en plein air ? Des aires de pique-nique ombragées sont à votre disposition au cœur du zoo.",
      image: "../../assets/images/picnic.jpg",
    },
    billeterie: {
      text: "Achetez vos billets en ligne ou sur place pour vivre une expérience mémorable au parc.",
      image: "../../assets/images/billeterie.jpg",
      redirect: "billeterie.html"
    },
    "petit-cafe": {
      text: "Situé en face de l’entrée, le Petit Café vous accueille sur sa terrasse ombragée sous la cascade avec une cuisine maison et des produits locaux.",
      image: "../../assets/images/resto.jpg",
    },
    paillote: {
      text: "Au cœur du parc, La Paillote propose une sélection gourmande sous une terrasse ombragée : crêpes, frites, steaks, glaces et bien plus.",
      image: "../../assets/images/resto.jpg",
    },
  };

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
>>>>>>> 3ad51302f57d90526ee9492fd4ec6dac980d178f
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
