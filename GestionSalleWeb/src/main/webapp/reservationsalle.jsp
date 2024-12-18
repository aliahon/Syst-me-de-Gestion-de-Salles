<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Demande De Réservation</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/stylereservesalle.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="form-container">
                    <h2 class="text-center mb-4">Demande De Réservation</h2>
                    <form>
                        <!-- Type de Salle -->
                        <div class="mb-3">
                            <label for="typeSalle" class="form-label">Nature de Salle</label>
						    <select class="form-select" id="natureSalle" name="natureSalle" required>
							    <c:forEach var="nature" items="${natureSalleList}">
							        <option value="${nature}" ${salle != null && salle.nature == nature ? 'selected' : ''}>
							            ${nature}
							        </option>
							    </c:forEach>
							</select>
                        </div>

                        <!-- CrÃ©neau Horaire -->
                        <div class="mb-3">
                            <label for="creneauHoraire" class="form-label">Créneau Horaire</label>
                            <select class="form-select" id="creneauHoraire" required>
                                <option value="">Choisir un créneau</option>
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

                        <!-- FiliÃ¨re -->
                        <div class="mb-3">
                            <label for="idFiliere" class="form-label">Filière</label>
                            <select class="form-select" id="idFiliere" name="idFiliere" required>
                                <!-- Options dynamiques Ã  rendre depuis le backend -->
                                <c:forEach var="filiere" items="${filieres}">
							        <option value="${filiere.id}" ${filiere != null && filiere.id == id ? 'selected' : ''}>
							            ${filiere.id}
							        </option>
							    </c:forEach>
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
                    <c:forEach var="demande" items="${demandes}">
			            <!-- Condition si la demande est confirmée -->
			            <c:if test="${demande.statut == 'confirmée'}">
			                <div class="list-group-item list-group-item-success d-flex justify-content-between align-items-center mb-3 rounded-3">
			                    <div>
			                        <h5 class="mb-1">Demande Confirmée</h5>
			                        <p class="mb-0">Date : ${demande.date} | Type Salle : ${demande.typeSalle} | Créneau : ${demande.creneau}</p>
			                    </div>
			                    <form method="post" action="SalleServlet">
				                        <input type="hidden" name="action" value="supprimer">
				                        <input type="hidden" name="idSalle" value="${salle.id}">
				                        <button class="btn btn-outline-dark btn-sm">Voir Informations</button>
				                </form>
			                </div>
			            </c:if>
			
			            <!-- Condition si la demande est en attente -->
			            <c:if test="${demande.statut == 'en attente'}">
			                <div class="list-group-item list-group-item-warning d-flex justify-content-between align-items-center mb-3 rounded-3">
			                    <div>
			                        <h5 class="mb-1">Demande En Cours</h5>
			                        <p class="mb-0">Date : ${demande.date} | Type Salle : ${demande.typeSalle} | Créneau : ${demande.creneau}</p>
			                    </div>
			                    <div class="d-flex gap-2">
			                    	<form method="get" action="SalleServlet">
					                        <input type="hidden" name="action" value="modifier">
					                        <input type="hidden" name="idSalle" value="${salle.id}">
					                        <button class="btn btn-outline-primary btn-sm">Modifier</button>
					                </form>
					                <form method="post" action="SalleServlet">
					                        <input type="hidden" name="action" value="supprimer">
					                        <input type="hidden" name="idSalle" value="${salle.id}">
					                        <button class="btn btn-outline-danger btn-sm">Annuler</button>
					                </form>
			                        
			                        
			                    </div>
			                </div>
			            </c:if>
			        </c:forEach>
                </div>
            </div>
            
            
            
            
        </div>
    

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Exemple de script pour charger les filiÃ¨res dynamiquement depuis le backend
        document.addEventListener('DOMContentLoaded', function () {
            const filieres = ["Informatique", "Electrique", "FID", "BTP", "JEE"]; // Ã€ remplacer par un appel au backend
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
