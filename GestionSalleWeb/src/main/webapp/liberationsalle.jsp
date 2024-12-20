<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.lang.Object" %>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion des RÃ©servations</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets\css\styleliberation.css" rel="stylesheet">

</head>
<body>

  <div class="container">
   <div class="col-12 d-flex justify-content-between">
                <!-- Bouton Retour à la page principale -->
                <a href="professeur.jsp" class="btn btn-outline-secondary">
                    <i class="bi bi-house-door"></i> Home
                </a>
                <!-- Bouton Retour à la page précédente -->
                <button class="btn btn-outline-secondary" onclick="history.back()">
                    <i class="bi bi-arrow-left"></i> Retour
                </button>
            </div>
    <!-- Titre de la page -->
    <div class="table-header">
      <h1>Liste des Salles Réservées</h1>
    </div>

    <!-- Tableau des rÃ©servations -->
    <div class="table-container">
      <table class="table table-bordered text-center rounded-3 overflow-hidden ">
        <thead class="table-dark">
          <tr>
            <th>#</th>
            <th>Nom de la Salle</th>
            <th>Horaire</th>
            <th>Date</th>
            <th>Type</th>
            <th>Filière</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody id="reservationTableBody">
		  <% 
		    List<Object[]> reservations = (List<Object[]>) request.getAttribute("reservationsConfirmees");
		    if (reservations != null) {
		        int index = 1; // Compteur pour le numéro de la réservation
		        for (Object[] row : reservations) {
		  %>
		  <tr>
		    <td><%= row[0] %></td>  <!-- ID de la réservation -->
		    <td><%= row[1] %></td>  <!-- Nom de la salle -->
		    <td><%= row[2] %></td>  <!-- Horaire -->
		    <td><%= row[3] %></td>  <!-- Date -->
		    <td><%= row[4] %></td>  <!-- Type -->
		    <td><%= row[5] %></td>  <!-- Filière -->
		        <!-- Colonne des actions -->
			<td>
			  <!-- Formulaire pour Libération Définitive -->
			  <form method="POST" action="ReservationServlet">
			    <input type="hidden" name="id" value="<%= row[0] %>">
			    <input type="hidden" name="action" value="definitive">
			    <button type="submit" class="btn btn-success btn-sm"
			            onclick="return confirm('Confirmez-vous la libération définitive ?');">
			      Libération Définitive
			    </button>
			  </form>
			
			  <!-- Formulaire pour Libération Exceptionnelle -->
			  <form method="POST" action="ReservationServlet">
			    <input type="hidden" name="id" value="<%= row[0] %>">
			    <input type="hidden" name="action" value="exceptionnelle">
			    <button type="submit" class="btn btn-warning btn-sm"
			            onclick="return confirm('Confirmez-vous la libération exceptionnelle ?');">
			      Libération Exceptionnelle
			    </button>
			  </form>
			</td>
		  </tr>
		  <% 
		        }
		    }
		  %>
        </tbody>
      </table>
    </div>
  </div>

  <!-- Bootstrap JS + JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
