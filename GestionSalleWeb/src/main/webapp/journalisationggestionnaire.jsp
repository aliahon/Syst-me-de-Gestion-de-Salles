<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Coordination des Salles</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets\css\stylecorrdinateur.css" rel="stylesheet">

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
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card card-journ" >
                  

                    

                    <!-- Buttons Section -->
                    <div class="buttons-section">
                        <div class="d-grid gap-3">
                            <a href="JournalisationServlet?req=2" class="btn btn-outline  btn-custom">Salles</a>
                            <a href="journalisationreservationprof.jsp" class="btn btn-outline btn-custom">Reservation/Libération</a>
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
