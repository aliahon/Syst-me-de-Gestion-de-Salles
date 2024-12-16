<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Gestion des Filières</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets\css\styleplann.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
   
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <h1>Planification des emplois des temps </h1>
    </div>

    <!-- Barre de recherche -->
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 search-bar">
                <form class="d-flex">
                    <i class="fas fa-search icon "></i>
                    <input id="filter" class="form-control me-2" type="search" placeholder="Rechercher une filière ..." aria-label="Search">
                </form>
            </div>
        </div>

        <!-- Liste des FiliÃ¨res -->
        <div class="row justify-content-center">
            <div class="col-md-8 list-container">
                <div class="list-group" id="filiere-list">
                
                <c:forEach var="filiere" items="${filieres}">
                    <div class="list-group-item">
                        <a href="emploitemps.jsp?idFiliere=${filiere.id}">${filiere.nom}</a>
                    </div>
                </c:forEach>  
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
	    $(document).ready(function () {
	        $("#filter").on("keyup", function () {
	            var value = $(this).val().trim().toLowerCase(); // Remove spaces and convert to lowercase
	
	            if (value === "") {
	                // If the input is empty or spaces, show all items
	                $("#filiere-list .list-group-item").show();
	            } else {
	                // Filter the list
	                $("#filiere-list .list-group-item").filter(function () {
	                    $(this).toggle($(this).text().toLowerCase().includes(value));
	                });
	            }
	        });
	    });
    </script>
</body>
</html>
