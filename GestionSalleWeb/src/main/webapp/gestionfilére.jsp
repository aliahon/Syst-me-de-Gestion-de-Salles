<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Filières</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets\css\sylegestfilier.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card p-4">
                    <h2 class="form-title text-center  ">Ajouter une Nouvelle Filière</h2>
                    
                    <form>
                        <div class="mb-3">
                            <label for="nomFiliere" class="form-label">Nom de la Filière</label>
                            <input type="text" class="form-control" id="nomFiliere" placeholder="Entrez le nom de la filière">
                        </div>
                        <div class="mb-3">
                            <label for="effectif" class="form-label">Effectif</label>
                            <input type="number" class="form-control" id="effectif" placeholder="Entrez l'effectif">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Matières et Charges Horaires</label>
                            <div id="matiereContainer">
                                <div class="row g-2 mb-2">
                                    <div class="col-6">
                                        <input type="text" class="form-control" placeholder="Matière">
                                    </div>
                                    <div class="col-4">
                                        <input type="number" class="form-control" placeholder="Charge horaire">
                                    </div>
                                    <div class="col-2">
                                        <button type="button" class="btn btn-outline btn-custom btn-sm removeMatiere">X</button>
                                    </div>
                                </div>
                            </div>
                            <button type="button" id="addMatiere" class="btn btn-outline btn-custom btn-sm">Ajouter une Matière</button>
                        </div>
                       
                        <button type="submit" class="btn btn-outline btn-custom w-100">Ajouter la Filière</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Section des filières listées -->
        <div class="table-container">
            <h2 class="text-center text-dark">Liste des Filières</h2>
            <table class="table table-hover table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Nom</th>
                        <th>Effectif</th>
                        <th>Charge Horaire</th>
                        <th>Matières</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Exemple statique pour illustrer -->
                    <tr>
                        <td>1</td>
                        <td>Informatique</td>
                        <td>30</td>
                        <td>120</td>
                        <td>Programmation, Bases de données</td>
                        <td>
                            <button class="btn btn-outline-warning btn-sm">Modifier</button>
                            <button class="btn btn-outline-danger btn-sm">Supprimer</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>Gestion</td>
                        <td>25</td>
                        <td>100</td>
                        <td>Comptabilité, Marketing</td>
                        <td>
                            <button class="btn btn-outline-warning btn-sm">Modifier</button>
                            <button class="btn btn-outline-danger btn-sm">Supprimer</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Ajouter une nouvelle matière
        document.getElementById("addMatiere").addEventListener("click", function () {
            const matiereContainer = document.getElementById("matiereContainer");
            const newRow = document.createElement("div");
            newRow.className = "row g-2 mb-2";
            newRow.innerHTML = `
                <div class="col-6">
                    <input type="text" class="form-control" placeholder="Matière">
                </div>
                <div class="col-4">
                    <input type="number" class="form-control" placeholder="Charge horaire">
                </div>
                <div class="col-2">
                   <button type="button" class="btn btn-outline btn-custom btn-sm removeMatiere">X</button>
                </div>
            `;
            matiereContainer.appendChild(newRow);
        });

        // Supprimer une matière
        document.addEventListener("click", function (e) {
            if (e.target.classList.contains("removeMatiere")) {
                e.target.closest(".row").remove();
            }
        });
    </script>
</body>
</html>
