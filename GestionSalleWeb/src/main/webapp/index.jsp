<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion Salle</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <link href="assets/css/style.css" rel="stylesheet">
</head>

<body class="bg-light">


  <div class="container d-flex flex-column justify-content-center align-items-center vh-100">

    <div class="row mb-4">
      <div class="col-12 d-flex justify-content-center">
        <img src="assets\images\Blue_Simple_Keep_Calm_Desktop_Wallpaper-removebg-preview.png" alt="Wallpaper" class="img-fluid  ">
      </div>
    </div>

    <div class="row">
      <div class="col-12 d-flex justify-content-center">
        <button type="button" class="btn btn-outline-secondary btn-lg px-4 py-2" data-bs-toggle="modal" data-bs-target="#formModal">Connecter</button>
      </div>
    </div>

  </div>
  <div class="modal fade" id="formModal" tabindex="-1" aria-labelledby="formModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <!-- Image dans le header -->
          <img src="assets/images/Blue_Simple_Keep_Calm_Desktop_Wallpaper-removebg-preview.png" alt="Wallpaper" class="img-fluid">
          <h5 class="modal-title" id="formModalLabel">Saisir vos informations</h5>
        </div>
        <div class="modal-body">
          <!-- Display authentication message -->
		    <c:if test="${not empty errorMessage}">
		        <div class="alert alert-danger">${errorMessage}</div>
		    </c:if>
          <!-- Formulaire à l'intérieur de la modal -->
          <form method="post" action="loginServlet">
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" class="form-control" id="email" placeholder="Entrez votre email" required>
            </div>
            <div class="mb-3">
              <label for="password" class="form-label">Mot de passe</label>
              <input type="password" class="form-control" id="password" placeholder="Entrez votre mot de passe" required>
            </div>
            
           <div class="modal-footer">
	          <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Fermer</button>
	          <button type="submit" class="btn btn-outline-primary">Connecter</button>
           </div>
           
          </form>
        </div>
        
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

