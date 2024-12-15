<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Salles</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets\css\sylegestfilier.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card p-4">
                    <h2 class="text-center form-title">Ajouter une Nouvelle Salle</h2>
                    <form id="formSalle">
                        <div class="mb-3">
                            <div class="mb-3">
                                <label for="NomSalle" class="form-label">Nom De Salle</label>
                                <input type="text" class="form-control" id="NomSalle" placeholder="Entrez la localisation">
                            </div>
                            <label for="typeSalle" class="form-label">Type de Salle</label>
                            <select class="form-select" id="typeSalle">
                                <option value="Cours">Cours</option>
                                <option value="TD">TD</option>
                                <option value="TP">TP</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="nombreplace" class="form-label">Nombre de Places</label>
                            <input type="number" class="form-control" id="nombreplaces" placeholder="Entrez le nombre de salles">
                        </div>
                        <div class="mb-3">
                            <label for="localisationSalle" class="form-label">Localisation</label>
                            <input type="text" class="form-control" id="localisationSalle" placeholder="Entrez la localisation">
                        </div>
                        <button type="button" id="ajouterSalle" class="btn btn-outline btn-custom w-100">Ajouter la Salle</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Section des salles listÃ©es -->
        <div class="mt-5">
            <h2 class="text-center">Liste des Salles</h2>
            <table class="table table-hover table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>#</th>
                        <th>Nom</th>
                        <th>Type</th>
                        <th>Nombre</th>
                        <th>Localisation</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody id="salleList">
                    <tr>
                        <td>1</td>
                        <td>F12</td>
                        <td>Cours</td>
                        <td>40</td>
                        <td> BÃ¢timent F, troisième étage </td>
                        <td>
                            <button class="btn btn-outline-warning btn-sm" >Modifier</button>
                            <button class="btn btn-outline-danger btn-sm" >Supprimer</button>
                        </td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>K2</td>
                        <td>Tp</td>
                        <td>30</td>
                        <td>
                            BÃ¢timent K, premier Ã©tage </td>
                        <td>
                            <button class="btn btn-outline-warning btn-sm">Modifier</button>
                            <button class="btn btn-outline-danger btn-sm" >Supprimer</button>
                        </td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>h11</td>
                        <td>cours</td>
                        <td>50</td>
                        <td>Bàtiment H, premier étage</td>
                        <td>
                            <button class="btn btn-outline-warning btn-sm" >Modifier</button>
                            <button class="btn btn-outline-danger btn-sm" >Supprimer</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
