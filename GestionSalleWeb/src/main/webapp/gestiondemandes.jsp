<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Demandes</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/stylereservesalle.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center ">Liste des Demandes</h1>
        <div class="list-group mt-5 " id="demandeList">
            <!-- Les demandes seront ajoutées dynamiquement ici -->
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Simulation des données reçues depuis le backend
        const demandes = [
            { id: 1, titre: "Demande 1" },
            { id: 2, titre: "Demande 2" },
            { id: 3, titre: "Demande 3" },
            { id: 4, titre: "Demande 4" }
        ];

        // Charger les demandes dans la liste
        const demandeList = document.getElementById("demandeList");
        demandes.forEach(demande => {
            const link = document.createElement("a");
            link.className = "list-group-item list-group-item-action list-group-item-suc list-group-item-confirmer  mb-3 rounded-3 p-3";
            link.textContent = demande.titre;
            // Redirection vers une autre page avec l'ID de la demande dans l'URL
            link.href = `proposition1.jsp?id=${demande.id}`;
            demandeList.appendChild(link);
        });
    </script>
</body>
</html>
