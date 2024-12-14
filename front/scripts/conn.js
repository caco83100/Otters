console.log("Script token chargé");
function isTokenValid() {
    const token = localStorage.getItem("token");

    if (!token) {
        console.log("Pas de token, donc l'utilisateur n'est pas connecté");
        return false;
    }

    // Décoder le token (le décodage n'affecte pas la sécurité, car il ne le vérifie pas)
    const payload = JSON.parse(atob(token.split('.')[1]));  // Décoder le payload (partie du milieu du JWT)
    
    // Vérifier si la date d'expiration est passée
    const currentTime = Math.floor(Date.now() / 1000);  // Temps actuel en secondes
    if (payload.exp < currentTime) {
        console.log("Le token est expiré");
        return false;
    }
    console.log("Le token est valide");
    return true;
}

window.onload = function() {
    const isLoggedIn = isTokenValid();  // Vérifier si le token est valide
    const loginButton = document.getElementById("login-button");  // Bouton "Connexion"
    const profileButton = document.getElementById("profile-button");  // Bouton "Profil"

    if (isLoggedIn) {
        // Si l'utilisateur est connecté, cacher le bouton "Connexion" et afficher le bouton "Profil"
        if (loginButton) loginButton.style.display = 'none';  // Cacher le bouton "Connexion"
        if (profileButton) profileButton.style.display = 'block';  // Afficher le bouton "Profil"
    } else {
        // Si l'utilisateur n'est pas connecté, cacher le bouton "Profil" et afficher le bouton "Connexion"
        if (loginButton) loginButton.style.display = 'block';  // Afficher le bouton "Connexion"
        if (profileButton) profileButton.style.display = 'none';  // Cacher le bouton "Profil"
    }
};