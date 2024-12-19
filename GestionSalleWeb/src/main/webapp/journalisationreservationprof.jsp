<!-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> -->
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Historique des resr lib prof</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets\css\stylejournalisationfiliere.css" rel="stylesheet">
   
</head>
<body>
    <div class="container">
        <h1 class="text-center mt-4 ">Historique des Réservations Libérations</h1>
        <div class="table-container">
            <!-- Tableau des filières ajoutées -->
            <h2 style="color: #ff8522;">Réservations</h2>
            <table class="table table-hover  table-rounded">
                <thead class="table-succ">
                    <tr>
                        <th>Nom de la Salle</th>
                        <th>Horaire</th>
                        <th>Date</th>
                        <th>Type</th>
                        <th>Filière</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Les données dynamiques depuis le backend Java -->
                    <!-- Exemples fictifs à remplacer par des balises Java -->
                    <tr>
                        <td>salle K13 </td>
                        <td>14:00 - 16:00</td>
                        <td>2024-12-16</td>
                       
                        <td>Cours</td>
                        <td>FID</td>
                     
                    </tr>
                    <tr>
                        <td>salle K13 </td>
                        <td>14:00 - 16:00</td>
                        <td>2024-12-16</td>
                       
                        <td>Cours</td>
                        <td>FID</td>
                    </tr>
                </tbody>
            </table>

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
                    <!-- Les données dynamiques depuis le backend Java -->
                    <!-- Exemples fictifs à remplacer par des balises Java -->
                    <tr>
                    	<td>Exceptionnelle</td>
                        <td>salle K13 </td>
                        <td>14:00 - 16:00</td>
                        <td>2024-12-16</td>
                        <td>Cours</td>
                        <td>FID</td>
                     
                    </tr>
                    <tr>
                    	<td>Definitive</td>
                        <td>salle K13 </td>
                        <td>14:00 - 16:00</td>
                        <td>2024-12-16</td>
                        <td>Cours</td>
                        <td>FID</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
