console.log("Script chargé !");

async function fetchAndDisplay() {

try {
    // fetch data from back
    const result = await fetch("../../back/popupBiome.php");
    
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
        const biomeEspace = document.createElement("br")
        biomeTitle.textContent = `${biome.biome_name}`;
        biomeSection.appendChild(biomeTitle);
        biomeSection.appendChild(biomeEspace);


        // run through enclosure
        const grid = document.createElement("div");
        grid.classList.add("cards");
        Object.values(biome).forEach((enclosure) => {
            if (enclosure.animals && enclosure.animals.length > 0) {
              // Création de la section pour un enclos
              const enclosureSection = document.createElement("div");
              enclosureSection.classList.add("card");
          
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

fetchAndDisplay();
