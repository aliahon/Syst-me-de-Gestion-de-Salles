<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>R�servation des Salles</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/stylereservesalle.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form-container">
                    <h2 class="text-center mb-4"> Demande De R�servation</h2>
                    <form>
                        <!-- Type de Salle -->
                        <div class="mb-3">
                            <label for="typeSalle" class="form-label">Type de Salle</label>
                            <select class="form-select" id="typeSalle" required>
                                <option value="">Choisir un type</option>
                                <option value="cour">Cours</option>
                                <option value="td">TD</option>
                                <option value="tp">TP</option>
                            </select>
                        </div>

                        <!-- Créneau Horaire -->
                        <div class="mb-3">
                            <label for="creneauHoraire" class="form-label">Créneau Horaire</label>
                            <select class="form-select" id="creneauHoraire" required>
                                <option value="">Choisir un cr�neau</option>
                                <option value="8:30-10:20">8:30 - 10:20</option>
                                <option value="10:40-12:30">10:40 - 12:30</option>
                                <option value="14:30-16:20">14:30 - 16:20</option>
                                <option value="16:40-18:30">16:40 - 18:30</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="dateReservation" class="form-label">Date</label>
                            <input type="date" class="form-control" id="dateReservation" required>
                        </div>

                        <!-- Filière -->
                        <div class="mb-3">
                            <label for="filiere" class="form-label">Filière</label>
                            <select class="form-select" id="filiere" required>
                                <!-- Options dynamiques à rendre depuis le backend -->
                            </select>
                        </div>

                        <!-- Boutons -->
                        <div class="d-flex justify-content-between">
                            <button type="submit" class="btn btn-custom">Envoyer</button>
                            <button type="button" class="btn btn-retourne" onclick="history.back()">Retourner</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

        <!-- Liste des Demandes -->
        <div class="row justify-content-center mt-5">
            <div class="col-8">
                <h2 class="text-center mb-4">Liste Des Demandes</h2>
                <div class="list-group">
                    <!-- Demande Confirmée -->
                    <div class="list-group-item list-group-item-suc d-flex justify-content-between align-items-center mb-3 rounded-3">
                        <div>
                            <h5 class="mb-1">Demande Confirm�e</h5>
                            <p class="mb-0">Date : 2024-12-15 |Type Salle : Cours | Créneau : 8:30 - 10:20</p>
                        </div>
                        <button class="btn btn-outline-dark btn-sm">Voir Informations</button>
                    </div>

                    <!-- Demande En Cours de Traitement -->
                    <div class="list-group-item list-group-item-warn d-flex justify-content-between align-items-center mb-3 rounded-3">
                        <div>
                            <h5 class="mb-1">Demande En Cours</h5>
                            <p class="mb-0">Date : 2024-12-16 |Type Salle : TD | Créneau : 10:40 - 12:30</p>
                        </div>
                        <div class="d-flex gap-2">
                            <button class="btn btn-outline-dark btn-sm">Voir Informations</button>
                            <button class="btn btn-outline-pri btn-sm">Modifier</button>
                            <button class="btn btn-outline-danger btn-sm">Annuler</button>
                        </div>
                    </div>
                    <div class="list-group-item list-group-item-suc d-flex justify-content-between align-items-center mb-3 rounded-3">
                        <div>
                            <h5 class="mb-1">Demande Confirmée</h5>
                            <p class="mb-0">Date : 2024-12-15 |Type Salle : Cours | Créneau : 8:30 - 10:20</p>
                        </div>
                        <button class="btn btn-outline-dark btn-sm">Voir Informations</button>
                    </div>
                    <div class="list-group-item list-group-item-warn d-flex justify-content-between align-items-center mb-3 rounded-3">
                        <div>
                            <h5 class="mb-1">Demande En Cours</h5>
                            <p class="mb-0">Date : 2024-12-16 |Type Salle : TD | Créneau : 10:40 - 12:30</p>
                        </div>
                        <div class="d-flex gap-2">
                            <button class="btn btn-outline-dark btn-sm">Voir Informations</button>
                            <button class="btn btn-outline-pri btn-sm">Modifier</button>
                            <button class="btn btn-outline-danger btn-sm">Annuler</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Exemple de script pour charger les filières dynamiquement depuis le backend
        document.addEventListener('DOMContentLoaded', function () {
            const filieres = ["Informatique", "Electrique", "FID", "BTP", "JEE"]; // À remplacer par un appel au backend
            const filiereSelect = document.getElementById('filiere');

            filieres.forEach(filiere => {
                const option = document.createElement('option');
                option.value = filiere;
                option.textContent = filiere;
                filiereSelect.appendChild(option);
            });
        });
    </script>
</body>
</html>
