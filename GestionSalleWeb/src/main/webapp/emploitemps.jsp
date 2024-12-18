<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
  <title>Emploi du Temps Interactif</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets\css\styleemploi.css" rel="stylesheet">
 
</head>
<body>
  <div class="container mt-5">
    <h1 class="text-center">Emploi du Temps <span style="color: var(--main-color);">${Filiere.nom}</span></h1>
    <table class="table table-bordered text-center rounded-4 overflow-hidden tableprincip">
        <thead class="tete table-light">
          <tr>
            <th>Heures</th>
            <th>Lundi</th>
            <th>Mardi</th>
            <th>Mercredi</th>
            <th>Jeudi</th>
            <th>Vendredi</th>
            <th>Samedi</th>
          </tr>
        </thead>
        <tbody>
  <!-- Première période : 08:30 - 10:20 -->
  <tr>
    <td>08:30 - 10:20</td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Monday" data-time="08:30 - 10:20">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Tuesday" data-time="08:30 - 10:20">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Wednesday" data-time="08:30 - 10:20">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Thursday" data-time="08:30 - 10:20">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Friday" data-time="08:30 - 10:20">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Saturday" data-time="08:30 - 10:20">+</button></td>
  </tr>

  <!-- Deuxième période : 10:40 - 12:30 -->
  <tr>
    <td>10:40 - 12:30</td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Monday" data-time="10:40 - 12:30">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Tuesday" data-time="10:40 - 12:30">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Wednesday" data-time="10:40 - 12:30">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Thursday" data-time="10:40 - 12:30">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Friday" data-time="10:40 - 12:30">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Saturday" data-time="10:40 - 12:30">+</button></td>
  </tr>

  <!-- Troisième période : 14:30 - 16:20 -->
  <tr>
    <td>14:30 - 16:20</td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Monday" data-time="14:30 - 16:20">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Tuesday" data-time="14:30 - 16:20">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Wednesday" data-time="14:30 - 16:20">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Thursday" data-time="14:30 - 16:20">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Friday" data-time="14:30 - 16:20">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Saturday" data-time="14:30 - 16:20">+</button></td>
  </tr>

  <!-- Quatrième période : 16:40 - 18:30 -->
  <tr>
    <td>16:40 - 18:30</td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Monday" data-time="16:40 - 18:30">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Tuesday" data-time="16:40 - 18:30">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Wednesday" data-time="16:40 - 18:30">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Thursday" data-time="16:40 - 18:30">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Friday" data-time="16:40 - 18:30">+</button></td>
    <td><button class="editable-cell btn btn-outline-secondary rounded-3" data-bs-toggle="modal" data-bs-target="#editModal" data-day="Saturday" data-time="16:40 - 18:30">+</button></td>
  </tr>
</tbody>

      </table>
  </div>

  <!-- Modale Bootstrap -->
  <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editModalLabel">Éditer la cellule</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <!-- Étape 1: Formulaire pour matière, professeur, et nature de salle -->
          <form id="step1Form" action="ServletEmploi" method="post">
            <input type="hidden" id="filiere" name="idFiliere" value="${Filiere.id}">
            <input type="hidden" id="currentDay" name="day">
            <input type="hidden" id="currentTime" name="time">
            <div class="mb-3">
              <label for="subject" class="form-label">Mati�re</label>
              <select class="form-select" id="subject" name="matiere" required>
                <c:forEach var="matiere" items="${matieres}">
                        <option value="${matiere}">${matiere}</option>
                 </c:forEach>
              </select>
            </div>
            <div class="mb-3">
              <label for="idProf" class="form-label">Professeur</label>
              <select class="form-select" id="idProf" name="idProf" required>
                <c:forEach var="prof" items="${profs}">
                  <option value="${prof.id}">${prof.nom}</option>
                </c:forEach>
              </select>
            </div>
            <div class="mb-3">
              <label for="roomType" class="form-label">Type de salle</label>
              <select class="form-select" id="roomType" name="roomType" required>
                <c:forEach var="nature" items="${natureSalles}">
                  <option value="${nature}">${nature}</option>
                </c:forEach>
              </select>
            </div>
             <div class="mb-3">
              <label for="roomSelect" class="form-label">Choisir une salle</label>
              <select class="form-select" id="roomSelect" name="room" required>
               <c:forEach var="salle" items="${salles}">
                     <option value="${salle.id}">${salle.id}</option>
               </c:forEach>
              </select>
            </div>
            <div class="text-end">
               <button type="submit" class="btn btn-cherche">Soumettre</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    let currentCell; // Stocke la cellule actuellement cliquée
    const step1Form = document.getElementById('step1Form');
    const roomSelect = document.getElementById('roomSelect');
    const subjectSelect = document.getElementById('subject');
    const roomTypeSelect = document.getElementById('roomType');

    // Initialisation de la modal
    const modalElement = document.getElementById('editModal');
    const modal = new bootstrap.Modal(modalElement);

    // Clic sur une cellule pour ouvrir la modale
    document.querySelectorAll('.editable-cell').forEach(button => {
        button.addEventListener('click', function () {
            currentCell = this; // Sauvegarder la cellule cliquée

            // Récupérer les attributs data-day et data-time
            const day = this.dataset.day;
            const time = this.dataset.time;

            // Injecter les valeurs dans les champs cachés du formulaire
            document.getElementById('currentDay').value = day;
            document.getElementById('currentTime').value = time;

            console.log("Clic détecté - Jour :", day, "Heure :", time); // Debug dans la console

            modal.show(); // Afficher la modale
        });
    });

    // Vérifier les champs avant soumission du formulaire
    step1Form.addEventListener('submit', function (e) {
        const day = document.getElementById('currentDay').value;
        const time = document.getElementById('currentTime').value;

        if (!day || !time) {
            e.preventDefault(); // Bloquer la soumission si les champs sont vides
            alert("Jour et heure ne sont pas définis !");
            console.log("Erreur : day ou time manquant");
        } else {
            console.log("Soumission en cours - Jour :", day, "Heure :", time);
        }
    });

    // Mettre à jour les cellules après soumission
    step1Form.addEventListener('submit', function (e) {
        e.preventDefault(); // Empêcher la soumission par défaut

        // Récupérer les données saisies dans le formulaire
        const subject = subjectSelect.value;
        const professor = document.getElementById('professor').value;
        const room = roomSelect.value;
        const roomType = roomTypeSelect.value;
        const day = document.getElementById('currentDay').value;
        const time = document.getElementById('currentTime').value;

        // Mise à jour de la cellule avec les nouvelles informations
        currentCell.dataset.subject = subject;
        currentCell.dataset.professor = professor;
        currentCell.dataset.room = room;
        currentCell.dataset.roomType = roomType;
        currentCell.innerHTML = `
            <strong>${subject}</strong><br>
            <small>${professor} - ${room} (${roomType.toUpperCase()})</small>
        `;
        currentCell.style.backgroundColor = 'var(--main-color)';

        console.log("Cellule mise à jour :", { day, time, subject, professor, room, roomType });

        // Fermer la modale après la mise à jour
        modal.hide();

        // Soumettre le formulaire manuellement (envoyer au serveur)
        step1Form.submit();
    });
</script>

</body>
</html>