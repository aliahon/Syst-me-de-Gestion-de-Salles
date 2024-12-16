<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
                    
                    <form action="ServletAjoutFiliere" method="post">
                        <div class="mb-3">
                            <label for="nomFiliere" class="form-label">Nom de la Filière</label>
                            <input type="text" class="form-control" value="${filiere != null ? filiere.nom : ''}" id="nomFiliere" name="nomFiliere" placeholder="Entrez le nom de la filière" required>
                        </div>
                        <div class="mb-3">
                            <label for="effectif" class="form-label">Effectif</label>
                            <input type="number" class="form-control"  value="${filiere != null ? filiere.effectif : ''}" id="effectif" name="effectif" placeholder="Entrez l'effectif" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Matières et Charges Horaires</label>
                            <div id="matiereContainer">
                                 <c:forEach var="matiere" items="${filiere.matieres}">
					                <div class="row g-2 mb-2">
					                    <div class="col-6">
					                        <input type="text" class="form-control" name="matiere[]" value="${matiere.key}" placeholder="Matière" required>
					                    </div>
					                    <div class="col-4">
					                        <input type="number" class="form-control" name="charge[]" value="${matiere.value}" placeholder="Charge horaire" required>
					                    </div>
					                    <div class="col-2">
					                        <button type="button" class="btn btn-outline btn-custom btn-sm removeMatiere">X</button>
					                    </div>
					                </div>
					            </c:forEach>
                            </div>
                            <button type="button" id="addMatiere" class="btn btn-outline btn-custom btn-sm">Ajouter une Matière</button>
                        </div>
                        <input type="hidden" name="action" value="ajouter">
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
                <c:set var="counter" value="0" scope="page" />
    <c:forEach var="filiere" items="${filieres}">
    <c:set var="counter" value="${counter + 1}" />
        <tr>
            <td> ${counter}</td>
            <td>${filiere.nom}</td>
            <td>${filiere.effectif}</td>
            <td>${filiere.chargeHoraireTotale}</td> <!-- Charge Horaire Totale -->
            <td>${filiere.nomsMatieres}</td> <!-- Noms des matières -->
            <td>
                <form method="get" action="ServletAjoutFiliere">
                        <input type="hidden" name="action" value="modifier">
                        <input type="hidden" name="idFiliere" value="${filiere.id}">
                        <button type="submit" class="btn btn-outline-warning btn-sm">Modifier</button>
                </form>
                <form method="post" action="ServletAjoutFiliere">
                        <input type="hidden" name="action" value="supprimer">
                        <input type="hidden" name="idFiliere" value="${filiere.id}">
                        <button type="submit" class="btn btn-outline-danger btn-sm">Supprimer</button>
                </form>
            </td>
        </tr>
    </c:forEach>
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
                    <input type="text" class="form-control" name="matiere[]" placeholder="Matière">
                </div>
                <div class="col-4">
                    <input type="number" class="form-control" name="charge[]" placeholder="Charge horaire">
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