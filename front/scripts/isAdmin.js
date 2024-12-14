console.log("Script isAdmin chargé");
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