<!DOCTYPE html>
<html lang="fr">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proposition d'Horaires et de Salles</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets\css\styleproposition2.css" rel="stylesheet">
  
</head>

<body>
    <div class="container fade-in">
        <h1 class="text-center mb-5">Proposition d'Horaires et de Salles</h1>

        <!-- Formulaire de choix -->
        <form>
            <!-- Choix de l'horaire ou de la salle -->
            <div class="card mb-4">
                <div class="card-header">
                    Choisissez une Option
                </div>
                <div class="card-body">
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="choice" id="option1" value="horaires" checked>
                        <label class="form-check-label" for="option1">
                            Proposition d'Horaires
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="choice" id="option2" value="salles">
                        <label class="form-check-label" for="option2">
                            Proposition de Salles
                        </label>
                    </div>
                </div>
            </div>

            <!-- Proposition d'Horaires (affichée si choisie) -->
            <div id="horaires" class="card mb-4">
                <div class="card-header">
                    Horaires
                </div>
                <div class="card-body">
                    <p class="h5">8:30 - 10:20</p>
                </div>
            </div>

            <!-- Proposition de Salles (affichée si choisie) -->
            <div id="salles" class="card mb-4" style="display: none;">
                <div class="card-header">
                    Proposition de Salle
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Nom</th>
                                <th>Type</th>
                                <th>Nombre de Places</th>
                                <th>Localisation</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Salle A</td>
                                <td>Cours</td>
                                <td>50</td>
                                <td>Bâtiment 1</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Bouton Envoyer -->
            <div class="btn-container">
                <button type="submit" class="btn btn-primar btn-lg">Envoyer</button>
            </div>
        </form>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Script pour afficher/masquer les sections selon le choix -->
    <script>
        document.querySelectorAll('input[name="choice"]').forEach(function(radio) {
            radio.addEventListener('change', function() {
                if (document.getElementById('option1').checked) {
                    document.getElementById('horaires').style.display = 'block';
                    document.getElementById('salles').style.display = 'none';
                } else {
                    document.getElementById('horaires').style.display = 'none';
                    document.getElementById('salles').style.display = 'block';
                }
            });
        });
    </script>
</body>

</html>
