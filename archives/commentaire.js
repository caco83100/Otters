document.addEventListener('DOMContentLoaded', function () {
    console.log("DOM chargé avec succès !");

    let selectedStars = 0;

    // Fonction pour gérer la sélection des étoiles
    document.querySelectorAll('.star').forEach(function(star) {
        star.addEventListener('click', function () {
            selectedStars = parseInt(this.getAttribute('data-value')); // Conversion en entier
            document.querySelectorAll('.star').forEach(function(s) {
                s.classList.remove('selected');
            });
            for (let i = 0; i < selectedStars; i++) {
                document.querySelectorAll('.star')[i].classList.add('selected');
            }
        });
    });

    // Fonction pour ajouter un commentaire
    function addComment(event) {
        console.log("Soumission du formulaire !");
        event.preventDefault();

        const username = document.getElementById('username')?.value || null;
        const commentText = document.getElementById('comment')?.value || null;
        const commentDisplay = document.getElementById('commentDisplay');

        console.log("Nom d'utilisateur :", username);
        console.log("Commentaire :", commentText);
        console.log("Nombre d'étoiles :", selectedStars);

        if (username && commentText && selectedStars > 0) {
            console.log("Création d'un nouveau commentaire...");
            const newComment = document.createElement('div');
            newComment.classList.add('comment');
            newComment.innerHTML = `
                <p class="username">${username}</p>
                <p class="rating">Évaluation : ${'★'.repeat(selectedStars)}${'☆'.repeat(5 - selectedStars)}</p>
                <p>${commentText}</p>
            `;

            if (commentDisplay) {
                console.log("Ajout du commentaire au conteneur...");
                commentDisplay.appendChild(newComment);
            } else {
                console.error("Le conteneur #commentDisplay est introuvable !");
            }

            document.getElementById('commentForm').reset();
            document.querySelectorAll('.star').forEach(function(s) {
                s.classList.remove('selected');
            });
            selectedStars = 0;
        } else {
            console.warn("Tous les champs ne sont pas remplis !");
            alert("Veuillez remplir tous les champs !");
        }
    }

    // Ajouter l'événement au bouton de soumission
    const submitButton = document.querySelector('.submit-btn');
    if (submitButton) {
        console.log("Écouteur ajouté au bouton de soumission.");
        submitButton.addEventListener('click', addComment);
    } else {
        console.error("Bouton de soumission introuvable !");
    }
});

const submitButton = document.querySelector('.submit-btn');
console.log(submitButton); // Cela doit afficher l'élément bouton dans la console
