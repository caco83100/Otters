console.log("Script token chargé");

function getName(){
    const token = localStorage.getItem("token");

    if (!token) {
        console.log("Pas de token, donc l'utilisateur n'est pas connecté");
        return null;
    }

    // Décoder le token (le décodage n'affecte pas la sécurité, car il ne le vérifie pas)
    const payload = JSON.parse(atob(token.split('.')[1]));  // Décoder le payload (partie du milieu du JWT)
    

    if (payload.prenom != null) {
        console.log(`Tu es ${payload.prenom}`);
        return payload.prenom;
    }else{
        return null;
    }
}

function getPP(){
    const token = localStorage.getItem("token");

    if (!token) {
        console.log("Pas de token, donc l'utilisateur n'est pas connecté");
        return null;
    }

    // Décoder le token (le décodage n'affecte pas la sécurité, car il ne le vérifie pas)
    const payload = JSON.parse(atob(token.split('.')[1]));  // Décoder le payload (partie du milieu du JWT)
    

    if (payload.pp != null) {
        return payload.pp;
    }else{
        return null;
    }
}

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
        localStorage.removeItem('token');
        return false;
    }
    console.log("Le token est valide");
    return true;
}

window.onload = function() {
    const isLoggedIn = isTokenValid();  // Vérifier si le token est valide
    const admin = isAdmin();
    const name = getName();
    const pp = getPP();
    const loginButton = document.getElementById("login-button");  // Bouton "Connexion"
    const profileButton = document.getElementById("profile-button");  // Bouton "Profil"
    const profileButtonName = document.getElementById("profile-button-name");
    const profileButtonPP = document.getElementById("profile-button-pp");
    const profileDropdownList = document.getElementsByClassName("profile-dropdown-list")[0];
    if (isLoggedIn) {
        // Si l'utilisateur est connecté, cacher le bouton "Connexion" et afficher le bouton "Profil"
        if (loginButton) loginButton.style.display = 'none';  // Cacher le bouton "Connexion"
        if (profileButton){
            profileButton.style.display = 'block'; // Afficher le bouton "Profil"
            if(name!= null){
                profileButtonName.textContent=name;
            }
            if(pp!= null){
                profileButtonPP.setAttribute("src",`../../assets/pp/${pp}.png`);
            }
            if(admin){
            const li= document.createElement('li');
            const adminLink = document.createElement('a');
            adminLink.textContent="Administration";
            adminLink.setAttribute("href","./admin.html");
            li.appendChild(adminLink);
            profileDropdownList.insertBefore(li,profileDropdownList.firstChild);
            }
          }
    } else {
        // Si l'utilisateur n'est pas connecté, cacher le bouton "Profil" et afficher le bouton "Connexion"
        if (loginButton) loginButton.style.display = 'block';  // Afficher le bouton "Connexion"
        if (profileButton) profileButton.style.display = 'none';  // Cacher le bouton "Profil"
    }
};

document.getElementById("logout-button").addEventListener("click", () => {
    localStorage.removeItem("token"); // Supprime le token
    alert("Vous avez été déconnecté.");
    window.location.href = "../pages/accueil_zoo.html"; // Redirige vers la page de connexion
});
