<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Filières</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets\css\styleplann.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
   
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
                    <input class="form-control me-2" type="search" placeholder="Rechercher une filière" aria-label="Search">
                    <button class="btn btn-search" type="submit">Rechercher</button>
                </form>
            </div>
        </div>

        <!-- Liste des Filières -->
        <div class="row justify-content-center">
            <div class="col-md-8 list-container">
                <div class="list-group">
                    <div class="list-group-item">
                        <a href="emploitemps.jsp">Informatique</a>
                    </div>
                    <div class="list-group-item">
                        <a href="emploitemps.jsp">Fid</a>
                    </div>
                    <div class="list-group-item">
                        <a href="emploitemps.jsp">Indus</a>
                    </div>
                    <div class="list-group-item">
                        <a href="emploitemps.jsp">�lectronique</a>
                    </div>
                    <div class="list-group-item">
                        <a href="emploitemps.jsp">JEE</a>
                    </div>
                    <div class="list-group-item">
                        <a href="emploitemps.jsp">BTP</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
