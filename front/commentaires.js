document.addEventListener('DOMContentLoaded', function () {
    let selectedStars = 0;

    // Fonction pour gérer la sélection des étoiles
    document.querySelectorAll('.star').forEach(function(star) {
        star.addEventListener('click', function () {
            selectedStars = parseInt(this.getAttribute('data-value')); // Conversion en entier
            // Réinitialiser la classe 'selected' pour toutes les étoiles
            document.querySelectorAll('.star').forEach(function(s) {
                s.classList.remove('selected');
            });
            // Ajouter la classe 'selected' aux étoiles sélectionnées
            for (let i = 0; i < selectedStars; i++) {
                document.querySelectorAll('.star')[i].classList.add('selected');
            }
        });
    });

    // Fonction pour ajouter un commentaire
    function addComment(event) {
        // Empêcher le comportement par défaut du formulaire (rechargement de la page)
        event.preventDefault();

        const username = document.getElementById('username') ? document.getElementById('username').value : null;
        const commentText = document.getElementById('comment') ? document.getElementById('comment').value : null;
        const commentDisplay = document.getElementById('commentDisplay');

        // Vérifier que les champs sont remplis et qu'une note a été donnée
        if (username && commentText && selectedStars > 0) {
            // Créer un nouveau commentaire avec l'utilisateur, l'étoile et le texte
            const newComment = document.createElement('div');
            newComment.classList.add('comment');
            newComment.innerHTML = `
                <p class="username">${username}</p>
                <p class="rating">Évaluation : ${'★'.repeat(selectedStars)}${'☆'.repeat(5 - selectedStars)}</p>
                <p>${commentText}</p>
            `;
            if (commentDisplay) {
                commentDisplay.appendChild(newComment);
            }

            // Réinitialiser le formulaire
            document.getElementById('commentForm').reset();
            document.querySelectorAll('.star').forEach(function(s) {
                s.classList.remove('selected');
            });
            selectedStars = 0;
        } else {
            alert("Veuillez remplir tous les champs !");
        }
    }

    // Ajouter l'événement au bouton de soumission
    const submitButton = document.querySelector('.submit-btn');
    if (submitButton) {
        submitButton.addEventListener('click', addComment);
    }
});
