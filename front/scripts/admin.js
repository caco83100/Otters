console.log("Script admin chargé !");

// verrifie si c'est un admin
function isAdmin() {
    const token = localStorage.getItem("token");

    if (!token) {
        console.log("Pas de token, donc l'utilisateur n'est pas connecté");
        return false;
    }

    // Décoder le token (le décodage n'affecte pas la sécurité, car il ne le vérifie pas)
    const payload = JSON.parse(atob(token.split('.')[1]));  // Décoder le payload (partie du milieu du JWT)
    

    if (payload.role == "admin") {
        console.log("Tu es admin");
        return true;
    }else{
        return false;
    }
}

const admin=isAdmin();

if(admin){

// Variables globales
let enclosData = null; // Stocke les données des enclos
let animalsList = null; // Stocke la liste complète des animaux
let currentEnclos = null; // Stocke l'enclos actuellement sélectionné

// Charger les données des enclos et des animaux depuis ../../back/admin.php
async function fetchAndDisplay() {
    try {
        const result = await fetch("../../back/admin.php");
        if (!result.ok) {
            throw new Error(`Erreur HTTP : ${result.status}`);
        }
        const data = await result.json();
        enclosData = data.enclosures;
        animalsList = data.animals;

        // Remplir la liste déroulante des enclos
        const selector = document.getElementById('enclos');
        for (let id in enclosData) {
            const option = document.createElement('option');
            option.value = id;
            option.textContent = `Enclos ${id}`;
            selector.appendChild(option);
        }
    } catch (error) {
        console.error("Erreur lors du chargement des données :", error);
        console.log("Une erreur est survenue lors du chargement des données.");
    }
}

// Afficher les détails de l'enclos sélectionné
document.getElementById('zooForm').addEventListener('submit', function (event) {
    event.preventDefault();

    const selectedEnclos = document.getElementById('enclos').value;
    currentEnclos = selectedEnclos;
    const enclosInfo = enclosData[selectedEnclos];

    const resultDiv = document.getElementById('result');
    if (enclosInfo) {
        // Afficher les noms des animaux dans la visualisation
        const animalNames = Object.keys(enclosInfo.animals).map(id => enclosInfo.animals[id]).join(', ');
        resultDiv.innerHTML = `
            <h2>Détails de l'enclos ${selectedEnclos}</h2>
            <p><strong>Animaux présents :</strong> ${animalNames}</p>
            <p><strong>État des travaux :</strong> ${enclosInfo.travaux ? '<span class="warning">En travaux</span>' : 'Accessible'}</p>
            <p><strong>Heure du déjeuner :</strong> ${enclosInfo.meal || 'Non défini'}</p>
            <button id="editButton">Modifier</button>
        `;
        document.getElementById('editButton').addEventListener('click', openEditForm);
    }
});

// Ouvrir le formulaire d'édition
function openEditForm() {
    if (!enclosData || !currentEnclos || !animalsList) {
        console.log("Les données de l'enclos ou des animaux ne sont pas disponibles.");
        return;
    }

    const enclosInfo = enclosData[currentEnclos];
    const animalsSelect = document.getElementById('animals');
    const animalsText = document.getElementById('animalsText');

    // Vider le champ de texte
    animalsText.value = ''; 

    // Remplir le menu déroulant des animaux
    animalsSelect.innerHTML = '';
    for (let id in animalsList) {
        const option = document.createElement('option');
        option.value = id;
        option.textContent = `${id}- ${animalsList[id]}`;
        animalsSelect.appendChild(option);
    }

    // Afficher dans le champ de texte les IDs des animaux déjà présents dans l'enclos
    const existingIds = Object.keys(enclosInfo.animals).join(',');
    animalsText.value = existingIds;

    document.getElementById('editForm').classList.remove('hidden');
    document.getElementById('travaux').value = enclosInfo.travaux ? 'true' : 'false';
    document.getElementById('meal').value = enclosInfo.meal || '';
}

// Ajouter un animal au champ de texte via le menu déroulant
document.getElementById('animals').addEventListener('change', function () {
    const selectedOptions = Array.from(this.selectedOptions);
    const selectedIds = selectedOptions.map(option => option.value);
    const animalsText = document.getElementById('animalsText');

    // Ajouter les IDs sélectionnés au champ de texte sans écraser le contenu existant
    selectedIds.forEach(id => {
        const currentText = animalsText.value.trim();
        
        const currentIds = currentText.split(',').map(item => item.trim());
        // Vérifier si l'ID est déjà présent dans la liste
        if (!currentIds.includes(id)) {
            
            if (currentText === "") {
                animalsText.value += id;
            } else {
                
                animalsText.value += ',' + id;
            }
        }
    });;

    console.log("IDs des animaux sélectionnés : ", animalsText.value);
});

// Gérer la modification manuelle du champ de texte
document.getElementById('animalsText').addEventListener('input', function () {
    const inputValue = this.value.trim();
    console.log("Contenu du champ de texte : ", inputValue);
});

// Sauvegarder les modifications dans ../../back/admin.php
async function saveEnclosData() {
    try {
        const travaux = document.getElementById('travaux').value === 'true';
        const meal = document.getElementById('meal').value;
        let animalsText = document.getElementById('animalsText').value.trim();

        // Nettoyer les espaces inutiles autour des IDs et ajouter une virgule si nécessaire
        animalsText = animalsText.split(',').map(id => id.trim()).join(',');

        // Log des données avant l'envoi
        console.log("Données à sauvegarder : ", {
            meal,
            travaux,
            animals: animalsText
        });

        // Si le champ est vide, envoyer un tableau vide
        const updatedData = {
            id: currentEnclos,
            data: {
                meal,
                travaux,
                animals: animalsText.length > 0 ? animalsText : '' // Envoi des IDs sous forme de chaîne
            }
        };

        const response = await fetch("../../back/admin.php", {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(updatedData)
        });

        const responseText = await response.text(); // Utilisez text() pour récupérer la réponse brute
        console.log("Réponse du serveur : ", responseText); // Affichez la réponse brute

        if (!response.ok) {
            throw new Error(`Erreur HTTP : ${response.status}`);
        }

        const result = JSON.parse(responseText); // Convertissez en JSON après l'affichage
        if (result.success) {
            console.log(result.success);
        } else {
            throw new Error(result.error);
        }

        // Recharger les données et mettre à jour l'affichage
        document.getElementById('editForm').classList.add('hidden');
        await fetchAndDisplay();
    } catch (error) {
        console.error("Erreur lors de la sauvegarde :", error);
        console.log(`Une erreur est survenue lors de la sauvegarde des données : ${error.message}`);
    }
}

// Annuler l'édition
document.getElementById('cancelEdit').addEventListener('click', function () {
    document.getElementById('editForm').classList.add('hidden');
});

// Soumettre le formulaire d'édition
document.getElementById('editEnclosForm').addEventListener('submit', function (event) {
    event.preventDefault();
    saveEnclosData();
    location.reload(); // Recharger la page pour voir les changements
});

// Charger les données au démarrage
document.addEventListener('DOMContentLoaded', fetchAndDisplay);

}else{
    window.location.href = "../pages/accueil_zoo.html";
}