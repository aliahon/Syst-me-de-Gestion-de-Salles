<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Historique des lib prof</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets\css\stylejournalisationfiliere.css" rel="stylesheet">
   
</head>
<body>
    <div class="container">
        <h1 class="text-center mt-4 ">Historique des Libérations</h1>
        <div class="table-container">
            <!-- Tableau des filières supprimées -->
            <h2 style="color: gray;">Libérations</h2>
            <table class="table  table-hover table-rounded">
                <thead class="table-dang">
                    <tr>
                    	<th>Type de la libération</th>
                        <th>Nom de la Salle</th>
                        <th>Horaire</th>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Filière</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="liberation" items="${liberations}">
			                <tr>
		                        <td>${liberation.typeLiberation}</td>
		                        <td>${liberation.nomSalle}</td>
		                        <td>${liberation.horaire}</td>
		                        <td>${liberation.dateReservation}</td>
		                        <td>${liberation.typeSalle}</td>
		                        <td>${liberation.filiere}</td>
		                    </tr>
			        </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
