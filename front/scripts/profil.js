console.log("Script profil chargé");

// Fonction pour récupérer les données utilisateur
function getUser() {
    const token = localStorage.getItem("token");
    if (token) {
        try {
            const payload = JSON.parse(atob(token.split('.')[1])); // Décoder le JWT
            const userId = payload.user_id; // Récupérer l'ID utilisateur

            fetch('../../back/profil.php', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ action: 'get', userId })
            })
                .then(response => response.json())
                .then(data => {
                    if (data.error) {
                        console.error(data.error);
                        return;
                    }

                    // Mise à jour des données affichées
                    document.getElementById("PP").setAttribute('src', `../../assets/pp/${data.pp}.png`);
                    document.getElementById("NOM").textContent = `Nom: ${data.nom}`;
                    document.getElementById("PRENOM").textContent = `Prénom: ${data.prenom}`;
                    document.getElementById("DATE").textContent = `Date de naissance: ${data.date}`;
                    document.getElementById("PSEUDO").textContent = `Nom d'utilisateur: ${data.pseudo}`;
                    document.getElementById("MAIL").textContent = `Adresse e-mail: ${data.mail}`;

                    // Préremplir le formulaire d'édition
                    document.getElementById("edit-nom").value = data.nom;
                    document.getElementById("edit-prenom").value = data.prenom;
                    document.getElementById("edit-date").value = data.date;
                    document.getElementById("edit-pseudo").value = data.pseudo;
                    document.getElementById("edit-mail").value = data.mail;

                    // Mettre à jour la sélection PP initiale
                    document.getElementById("edit-pp").value = data.pp;
                })
                .catch(error => console.error('Erreur :', error));
        } catch (error) {
            console.error('Erreur lors du décodage du JWT :', error.message);
        }
    } else {
        console.error('Token JWT non trouvé dans le stockage local');
        window.location.href = "../pages/accueil_zoo.html";
    }
}

// Fonction pour sauvegarder les modifications
function saveUserProfile() {
    const token = localStorage.getItem("token");
    if (token) {
        const payload = JSON.parse(atob(token.split('.')[1])); // Décoder le JWT
        const userId = payload.user_id;

        const updatedData = {
            nom: document.getElementById("edit-nom").value.trim(),
            prenom: document.getElementById("edit-prenom").value.trim(),
            date: document.getElementById("edit-date").value.trim(),
            pseudo: document.getElementById("edit-pseudo").value.trim(),
            mail: document.getElementById("edit-mail").value.trim(),
            pp: document.getElementById("edit-pp").value // Ajouter PP sélectionnée
        };

        fetch('../../back/profil.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ action: 'update', userId, data: updatedData })
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert("Profil mis à jour avec succès ! Veuillez vous reconnecter");
                    localStorage.removeItem("token"); // Supprime le token
                    window.location.href = "../pages/connexion.html"; // Redirige vers la page de connexion
                } else {
                    console.error(data.error);
                    alert("Erreur lors de la mise à jour du profil.");
                }
            })
            .catch(error => console.error('Erreur :', error));
    } else {
        console.error('Token JWT non trouvé');
    }
}

// Fonction pour gérer le clic sur les photos de profil
function setupPpSelection() {
    const ppOptions = document.querySelectorAll(".pp-option");
    ppOptions.forEach(option => {
        option.addEventListener("click", function () {
            const selectedPp = this.getAttribute("data-pp"); // Récupérer l'attribut data-pp
            document.getElementById("edit-pp").value = selectedPp; // Mettre à jour le champ caché
            alert(`Photo de profil ${selectedPp} sélectionnée.`);
        });
    });
}

// Fonction pour annuler l'édition et fermer le formulaire
function cancelEdit() {
    document.getElementById("edit-profile-form").style.display = "none";
    document.getElementById("profile-form").style.display="block";
    alert("Modifications annulées.");
}

// Fonction d'initialisation
async function init() {
    await getUser();

    // Ajouter l'événement pour le bouton d'édition
    document.getElementById("edit-profile-btn").addEventListener("click", () => {
        document.getElementById("edit-profile-form").style.display = "block";
        document.getElementById("profile-form").style.display="none";
    });

    // Ajouter l'événement pour le bouton de sauvegarde
    document.getElementById("save-profile-btn").addEventListener("click", saveUserProfile);

    // Ajouter l'événement pour le bouton annuler
    document.getElementById("cancel-edit-btn").addEventListener("click", cancelEdit);

    // Ajouter la gestion des clics sur les photos de profil
    setupPpSelection();
}


init();
