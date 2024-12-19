<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Gestion des Réservations</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets\css\styleliberation.css" rel="stylesheet">

</head>
<body>

  <div class="container">
    <!-- Titre de la page -->
    <div class="table-header">
      <h1>Liste des Salles Réservées</h1>
    </div>

    <!-- Tableau des réservations -->
    <div class="table-container">
      <table class="table table-bordered text-center rounded-3 overflow-hidden ">
        <thead class="table-dark">
          <tr>
            <th>#</th>
            <th>Nom de la Salle</th>
            <th>Horaire</th>
            <th>Date</th>
            <th>Type</th>
            <th>Fili�re</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody id="reservationTableBody">
          <!-- Les données du backend seront insérées ici -->
        </tbody>
      </table>
    </div>
  </div>

  <!-- Bootstrap JS + JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    // Exemple de données récupérées depuis le backend
    const reservations = [
      {
        id: 1,
        nomSalle: "Salle F12",
        horaire: "08:00 - 10:00",
        date: "2024-12-15",
        type: "TD",
        filiere: "Info4"
      },
      {
        id: 2,
        nomSalle: "Salle F08",
        horaire: "10:00 - 12:00",
        date: "2024-12-15",
        type: "TP",
        filiere: "BTP"
      },
      {
        id: 3,
        nomSalle: "Salle k12",
        horaire: "14:00 - 16:00",
        date: "2024-12-16",
        type: "Cours",
        filiere: "FID"
      }
    ];

    // Fonction pour insérer les données dans le tableau
    function afficherReservations() {
      const tableBody = document.getElementById('reservationTableBody');
      reservations.forEach(reservation => {
        const row = document.createElement('tr');
        row.innerHTML = `
          <td>${reservation.id}</td>
          <td>${reservation.nomSalle}</td>
          <td>${reservation.horaire}</td>
          <td>${reservation.date}</td>
          <td>${reservation.type}</td>
          <td>${reservation.filiere}</td>
          <td>
            <button class="btn btn-temp btn-sm liberer-temporaire" data-id="${reservation.id}">
              Libération Temporaire
            </button>
            <button class="btn btn-defi btn-sm liberer-definitive" data-id="${reservation.id}">
              Libération Définitive
            </button>
          </td>
        `;
        tableBody.appendChild(row);
      });

      // Ajouter les événements sur les boutons après avoir généré le tableau
      document.querySelectorAll('.liberer-temporaire').forEach(button => {
        button.addEventListener('click', (e) => {
          const id = e.target.getAttribute('data-id');
          libererSalle(id, 'temporaire');
        });
      });

      document.querySelectorAll('.liberer-definitive').forEach(button => {
        button.addEventListener('click', (e) => {
          const id = e.target.getAttribute('data-id');
          libererSalle(id, 'definitive');
        });
      });
    }

    // Fonction pour gérer la libération de salle
    function libererSalle(id, type) {
      // Exemple de requête au backend (remplacez cette URL par la vôtre)
      fetch(`/api/reservations/${id}/liberation`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ type }),
      })
      .then(response => response.json())
      .then(data => {
        alert(`Salle ${id} libérée (${type}) avec succès !`);
        // Actualiser l'interface si nécessaire
      })
      .catch(error => {
        console.error('Erreur lors de la libération :', error);
        alert('Une erreur s\'est produite.');
      });
    }

    // Charger les données au chargement de la page
    afficherReservations();
  </script>
</body>
</html>
