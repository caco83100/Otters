console.log("Script profil chargé");


function getUser() {
    const token = localStorage.getItem("token");
    if (token) {
        try {
            // Décoder le payload du JWT
            const payload = JSON.parse(atob(token.split('.')[1]));
    
            // Récupérer l'ID utilisateur
            const userId = payload.user_id; // Assurez-vous que 'user_id' existe dans le JWT
            console.log('ID utilisateur :', userId);
    
            // Envoyer l'ID au backend
            fetch('../../back/profil.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': `Bearer ${token}` // Optionnel : ajoutez le JWT pour vérification serveur
                },
                body: JSON.stringify({ userId }) // Envoyer l'ID utilisateur
            })
                .then(response => response.json())
                .then(data => {
                    if (data.error) {
                        console.error(data.error);
                        return;
                    }
    
                    // Mettre à jour la page avec les données utilisateur
                    document.getElementById("PP").setAttribute('src',`../../assets/pp/${data.PP}.png`);
                    document.getElementById("NOM").textContent = `Nom: ${data.NOM}`;
                    document.getElementById("PRENOM").textContent = `Prénom: ${data.PRENOM}`;
                    document.getElementById("DATE").textContent = `Date de naissance: ${data.DATE}`;
                    document.getElementById("PSEUDO").textContent = `Nom d'utilisateur: ${data.PSEUDO}`;
                    document.getElementById("MAIL").textContent = `Adresse e-mail: ${data.MAIL}`;
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

async function init() {
    await getUser();

}

init();