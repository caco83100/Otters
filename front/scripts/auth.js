console.log("script autentification chargé");

document.getElementById("toggle-to-register").addEventListener("click", () => {
    document.getElementById("login-form").classList.add("hidden");
    document.getElementById("register-form").classList.remove("hidden");
});

document.getElementById("toggle-to-login").addEventListener("click", () => {
    document.getElementById("register-form").classList.add("hidden");
    document.getElementById("login-form").classList.remove("hidden");
});

async function handleFormSubmit(url, data, successCallback, errorCallback) {
    try {
        const response = await fetch(url, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data),
        });

        if (!response.ok) throw new Error("Problème de connexion au serveur.");
        const result = await response.json();

        if (result.success) {
            successCallback(result);
        } else {
            errorCallback(result.error || "Erreur inconnue.");
        }
    } catch (error) {
        errorCallback(error.message);
    }
}

document.getElementById("login-form").addEventListener("submit", (e) => {
    e.preventDefault();
    const formData = new FormData(e.target);
    const data = Object.fromEntries(formData.entries());

    handleFormSubmit(
        "../../back/login.php",
        data,
        (result) => {
            console.log(result);
            alert("Connexion réussie !");
            localStorage.setItem("token", result.token);
            window.location.href = "accueil_zoo.html";
        },
        (errorMessage) => {
            document.getElementById("error-message").textContent = errorMessage;
        }
    );
});

document.getElementById("register-form").addEventListener("submit", (e) => {
    e.preventDefault();
    const formData = new FormData(e.target);
    const data = Object.fromEntries(formData.entries());

    handleFormSubmit(
        "../../back/register.php",
        data,
        () => {
            alert("Inscription réussie ! Veuillez vous connecter.");
            document.getElementById("toggle-to-login").click();
        },
        (errorMessage) => {
            document.getElementById("error-message").textContent = errorMessage;
        }
    );
});
