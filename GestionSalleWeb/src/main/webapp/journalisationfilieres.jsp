<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Historique des Filères</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets\css\stylejournalisationfiliere.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
  
</head>
<body>
    <div class="container">
     <div class="col-12 d-flex justify-content-between">
                <!-- Bouton Retour à la page principale -->
                <a href="coordinateur.jsp" class="btn btn-outline-secondary">
                    <i class="bi bi-house-door"></i> Home
                </a>
                <!-- Bouton Retour à la page précédente -->
                <button class="btn btn-outline-secondary" onclick="history.back()">
                    <i class="bi bi-arrow-left"></i> Retour
                </button>
            </div>
        <h1 class="text-center mt-4 ">Historique des Filières </h1>
        <div class="table-container">
            <!-- Tableau des filières ajoutées -->
         
            <table class="table table-hover  table-rounded">
                <thead class="table-succ">
                    <tr>
                        <th>Nom </th>
                        <th>Type d'opération</th>
                        <th>Détaille</th>
                        <th>Date d'opération</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="journalisationFiliere" items="${journalisationFilieres}">
			            <!-- Condition si la demande est confirmée -->
			            <c:if test="${journalisationFiliere.operationType == 'Ajout'}">
			                <tr class="ajoute">
		                        <td>${journalisationFiliere.recordId}</td>
		                        <td> ${journalisationFiliere.operationType}</td>
		                        <td>${journalisationFiliere.details }</td>
		                        <td>${journalisationFiliere.operationTime}</td>
		                    </tr>
			            </c:if>
			
			            <!-- Condition si la demande est en attente -->
			            <c:if test="${journalisationFiliere.operationType== 'Suppression'}">
			           		<tr class="supprim">
		                        <td>${journalisationFiliere.recordId}</td>
		                        <td> ${journalisationFiliere.operationType}</td>
		                        <td>${journalisationFiliere.details }</td>
		                        <td>${journalisationFiliere.operationTime}</td>
		                    </tr>
			            </c:if>
			        </c:forEach>

                </tbody>
            </table>

        
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
