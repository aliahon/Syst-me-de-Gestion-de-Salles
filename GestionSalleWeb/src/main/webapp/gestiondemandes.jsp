<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <title>Liste des Demandes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/stylereservesalle.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
     
         <div class="col-12 d-flex justify-content-between">
                <!-- Bouton Retour à la page principale -->
                <a href="gestionnaire.jsp" class="btn btn-outline-secondary">
                    <i class="bi bi-house-door"></i> Home
                </a>
                <!-- Bouton Retour à la page précédente -->
                <button class="btn btn-outline-secondary" onclick="history.back()">
                    <i class="bi bi-arrow-left"></i> Retour
                </button>
            </div>
             
        <h1 class="text-center">Liste des Demandes en Attente</h1>
        <div class="list-group mt-5">
            <c:forEach var="reservation" items="${reservationAttente}">
                <form action="ServletConfirmation" method="post" class="list-group-item list-group-item-action">
                    <div class="d-flex justify-content-between align-items-center">
                        <span>Date : ${reservation.creneauReserve.dateDebut} | Créneau : ${reservation.creneauReserve.periode} | Type Salle : ${reservation.creneauReserve.salle.nature} | Salle : ${reservation.creneauReserve.salle.id }</span>
                        <input type="hidden" name="reservationId" value="${reservation.id}">
                        <button type="submit" class="btn btn-success btn-sm">Confirmer</button>
                    </div>
                </form>
            </c:forEach>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
