<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                    <form id="formSalle" action="SalleServlet" method="post">
                        <div class="mb-3">
                            <div class="mb-3">
                                <label for="nomSalle" class="form-label">Nom De Salle</label> 
                                <input type="text" class="form-control" id="nomSalle" value="${salle != null ? salle.nom : ''}"  name="nomSalle" placeholder="Entrez la localisation" required>
                            </div>
                            <label for="typeSalle" class="form-label">Nature de Salle</label>
						    <select class="form-select" id="natureSalle" name="natureSalle" required>
							    <c:forEach var="nature" items="${natureSalleList}">
							        <option value="${nature}" ${salle != null && salle.natureSalle == nature ? 'selected' : ''}>
							            ${nature}
							        </option>
							    </c:forEach>
							</select>
                        </div>
                        <div class="mb-3">
                            <label for="nombreplace" class="form-label">Nombre de Places</label>
                            <input type="number" class="form-control" id="nombreplaces" name="nombreplaces" value="${salle != null ? salle.nbplace : ''}" placeholder="Entrez le nombre de salles" required>
                        </div>
                        <div class="mb-3">
                            <label for="localisationSalle" class="form-label">Localisation</label>
                            <input type="text" class="form-control" id="localisationSalle" name="localisationSalle" value="${salle != null ? salle.localisation : ''}" placeholder="Entrez la localisation" required>
                        </div>
                        <input type="hidden" name="action" value="ajouter">
                        <button type="submit" id="ajouterSalle" class="btn btn-outline btn-custom w-100">Ajouter la Salle</button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Section des salles listées -->
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
                <c:set var="counter" value="0" scope="page" />
                
    				<c:forEach var="salle" items="${salles}">
				    <c:set var="counter" value="${counter + 1}" />
                    <tr>
                        <td>${counter}</td>
                        <td>${salle.id}</td>
                        <td>${salle.nature}</td>
                        <td>${salle.nbplace}</td>
                        <td>${salle.localisation}</td>
                        <td>
                        		<form method="get" action="SalleServlet">
				                        <input type="hidden" name="action" value="modifier">
				                        <input type="hidden" name="idSalle" value="${salle.id}">
				                        <button type="submit" class="btn btn-outline-warning btn-sm">Modifier</button>
				                </form>
				                <form method="post" action="SalleServlet">
				                        <input type="hidden" name="action" value="supprimer">
				                        <input type="hidden" name="idSalle" value="${salle.id}">
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
    
</body>
</html>
