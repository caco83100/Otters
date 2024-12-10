<?php
/*session_start();
if(!$_SESSION['MDP']){
    header('Location: connexion.php');
}*/
?>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8"> <!--caractères spéciaux bien affichés-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> <!--adapter tel et tab-->
        <link rel="icon" type="image/png" href="../../assets/logos/otter.png">
        <title>Login page</title>
        <link rel="stylesheet" href="../style/style1.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <div class="nav">
            <a href="accueil_zoo.html">
                <img src="../../assets/logos/logo_png.png">
            </a>
            <a href="présentation_biomes.html"><strong>NOS ENCLOS</strong></a>
            <a href="services.html"><strong>NOS SERVICES</strong></a>
            <a href="billeterie.html"><strong>PRENEZ VOS BILLETS</strong></a>
            <input type="text" placeholder="Recherche..">
            <div>
            <a href="connexion.php" class="btn"><strong>CONNEXION</strong></a>
            </div>
        </div>
    </head>
    <body>
        <div class="wrapper2">
        <h2>Etat des enclos</h2>
        <br>
        <form id="zooForm">
        <label for="enclos">Sélectionnez un numéro d'enclos pour voir son état:</label>
        <select id="enclos" name="enclos">
            <option value="1">Enclos 1</option>
            <option value="2">Enclos 2</option>
            <option value="3">Enclos 3</option>
        </select>
        <button type="submit">Valider</button>
        </form>

        <div id="result"></div>
        <div id="editForm" class="hidden">
        <h2>Modifier les données de l'enclos</h2>
        <br>
        <form id="editEnclosForm">
            <label for="animaux">Animaux présents :</label>
            <input type="text" id="animaux" name="animaux" placeholder="Exemple : Lion, Girafe"><br><br>
            <label for="travaux">En travaux :</label>
            <select id="travaux" name="travaux">
                <option value="false">Non</option>
                <option value="true">Oui</option>
            </select><br><br>
            <label for="dejeuner">Heure du déjeuner :</label>
            <input type="time" id="dejeuner" name="dejeuner"><br><br>
            <button type="submit">Enregistrer</button>
            <button type="submit" id="cancelEdit">Annuler</button>
        </form>
        </div>
        <script>
        document.addEventListener('DOMContentLoaded', function () {
            const enclosData = {
                1: { animaux: ["Python", "Tortue", "Iguane"], travaux: false, dejeuner: "12:00" },
                2: { animaux: ["Binturong", "Loutre"], travaux: true, dejeuner: "11:30" },
                3: { animaux: ["Émeu", "Wallaby"], travaux: false, dejeuner: "13:00" },
            };

            let currentEnclos = null;

            document.getElementById('zooForm').addEventListener('submit', function (event) {
                event.preventDefault();

                const selectedEnclos = document.getElementById('enclos').value;
                currentEnclos = selectedEnclos;
                const enclosInfo = enclosData[selectedEnclos];

                const resultDiv = document.getElementById('result');
                if (enclosInfo) {
                    let htmlContent = `<h2>Détails de l'enclos ${selectedEnclos}</h2>`;
                    htmlContent += `<p><strong>Animaux présents :</strong> ${enclosInfo.animaux.join(', ')}</p>`;
                    htmlContent += `<p><strong>État des travaux :</strong> ${enclosInfo.travaux ? '<span class="warning">En travaux</span>' : 'Accessible'}</p>`;
                    htmlContent += `<p><strong>Heure du déjeuner :</strong> ${enclosInfo.dejeuner}</p>`;
                    htmlContent += `<button id="editButton">Modifier</button>`;
                    resultDiv.innerHTML = htmlContent;

                    document.getElementById('editButton').addEventListener('click', openEditForm);
                }
            });

            function openEditForm() {
                const enclosInfo = enclosData[currentEnclos];
                document.getElementById('editForm').classList.remove('hidden');
                document.getElementById('animaux').value = enclosInfo.animaux.join(', ');
                document.getElementById('travaux').value = enclosInfo.travaux;
                document.getElementById('dejeuner').value = enclosInfo.dejeuner;
            }

            document.getElementById('editEnclosForm').addEventListener('submit', function (event) {
                event.preventDefault();

                const animaux = document.getElementById('animaux').value.split(',').map(a => a.trim());
                const travaux = document.getElementById('travaux').value === 'true';
                const dejeuner = document.getElementById('dejeuner').value;

                enclosData[currentEnclos] = { animaux, travaux, dejeuner };

                document.getElementById('editForm').classList.add('hidden');
                document.getElementById('zooForm').dispatchEvent(new Event('submit'));
            });

            document.getElementById('cancelEdit').addEventListener('click', function () {
                document.getElementById('editForm').classList.add('hidden');
            });
        });
    </script>
    </div>
    </body>
    </html>