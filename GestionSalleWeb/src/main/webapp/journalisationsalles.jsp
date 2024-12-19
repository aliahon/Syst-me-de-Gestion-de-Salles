<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Historique des Salles</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets\css\stylejournalisationfiliere.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
  
</head>
<body>
    <div class="container">
        <h1 class="text-center mt-4 ">Historique des Salles</h1>
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
                   <c:forEach var="journalisationSalle" items="${journalisationSalles}">
			            <!-- Condition si la demande est confirmée -->
			            <c:if test="${journalisationSalle.operationType == 'Ajout'}">
			                <tr class="ajoute">
		                        <td>${journalisationSalle.recordId}</td>
		                        <td> ${journalisationSalle.operationType}</td>
		                        <td>${journalisationSalle.details }</td>
		                        <td>${journalisationSalle.operationTime}</td>
		                    </tr>
			            </c:if>
			
			            <!-- Condition si la demande est en attente -->
			            <c:if test="${journalisationSalle.operationType== 'Suppression'}">
			           		<tr class="supprim">
		                        <td>${journalisationSalle.recordId}</td>
		                        <td> ${journalisationSalle.operationType}</td>
		                        <td>${journalisationSalle.details }</td>
		                        <td>${journalisationSalle.operationTime}</td>
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
