<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Emploi du Temps Interactif</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets\css\styleemploi.css" rel="stylesheet">
 
</head>
<body>
  <div class="container mt-5">
    <h1 class="text-center">Emploi du Temps <span style="color: var(--main-color);">G-INF2</span></h1>
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
          <tr>
            <td>08:30 - 10:20</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
          </tr>
          <tr>
            <td>10:40 - 12:30</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
          </tr>
          <tr>
            <td>14:30 - 16:20</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
          </tr>
          <tr>
            <td>16:40 - 18:30</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
            <td class="editable-cell">+</td>
          </tr>
        </tbody>
      </table>
  </div>

  <!-- Modale Bootstrap -->
  <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="editModalLabel">�diter la cellule</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <!-- Étape 1: Formulaire pour matière, professeur, et nature de salle -->
          <form id="step1Form">
            <div class="mb-3">
              <label for="subject" class="form-label">Mati�re</label>
              <select class="form-select" id="subject" required>
                <!-- Options ajoutées dynamiquement depuis le backend -->
              </select>
            </div>
            <div class="mb-3">
              <label for="professor" class="form-label">Professeur</label>
              <input type="text" class="form-control" id="professor" required>
            </div>
            <div class="mb-3">
              <label for="roomType" class="form-label">Type de salle</label>
              <select class="form-select" id="roomType" required>
                <option value="cour">Cours</option>
                <option value="td">TD</option>
                <option value="tp">TP</option>
              </select>
            </div>
            <div class="text-end">
              <button type="button" class="btn btn-cherche" id="checkRoomsBtn">Chercher les salles disponibles</button>
            </div>
          </form>

          <!-- Étape 2: Choix de la salle -->
          <form id="step2Form" class="d-none">
            <div class="mb-3">
              <label for="roomSelect" class="form-label">Choisir une salle</label>
              <select class="form-select" id="roomSelect" required>
                <!-- Les salles seront ajoutées dynamiquement -->
              </select>
            </div>
            <div class="text-end">
              <button type="button" class="btn btn-secondary" id="backBtn">Retour</button>
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
    const step2Form = document.getElementById('step2Form');
    const roomSelect = document.getElementById('roomSelect');
    const subjectSelect = document.getElementById('subject');
    const roomTypeSelect = document.getElementById('roomType');

    // Charger les matières depuis le backend (simulé ici avec un tableau)
    const loadSubjects = () => {
      const subjects = ["JEE", ".net", "Analyse financiére", "stochastique","th de graph","optimisation","ADD"];
      subjectSelect.innerHTML = subjects.map(subject => `<option value="${subject}">${subject}</option>`).join('');
    };

    // Initialisation
    loadSubjects();

    // Clic sur une cellule pour ouvrir la modale
    document.querySelectorAll('.editable-cell').forEach(cell => {
      cell.addEventListener('click', function () {
        currentCell = this;
        subjectSelect.value = currentCell.dataset.subject || '';
        document.getElementById('professor').value = currentCell.dataset.professor || '';
        roomTypeSelect.value = currentCell.dataset.roomType || '';
        const modal = new bootstrap.Modal(document.getElementById('editModal'));
        modal.show();

        // Réinitialiser l'affichage des étapes
        step1Form.classList.remove('d-none');
        step2Form.classList.add('d-none');
        roomSelect.innerHTML = ''; // Réinitialiser la liste des salles
      });
    });

    // Gestion du clic sur "Chercher les salles disponibles"
    document.getElementById('checkRoomsBtn').addEventListener('click', function () {
      // Exemple de salles disponibles (peut être remplacé par une requête Fetch API)
      const roomType = roomTypeSelect.value;
      const availableRooms = roomType === 'cour' ? ["Salle F12", "Salle K2","Salle F8"] : roomType === 'td' ? ["Salle 303", "Salle 404"] : ["Salle 505", "Salle 606"];

      // Ajouter les salles au select
      roomSelect.innerHTML = availableRooms.map(room => `<option value="${room}">${room}</option>`).join('');

      // Passer à l'étape 2
      step1Form.classList.add('d-none');
      step2Form.classList.remove('d-none');
    });

    // Retour à l'étape 1
    document.getElementById('backBtn').addEventListener('click', function () {
      step1Form.classList.remove('d-none');
      step2Form.classList.add('d-none');
    });

    // Soumission finale
    step2Form.addEventListener('submit', function (e) {
      e.preventDefault();

      // Récupérer les données saisies
      const subject = subjectSelect.value;
      const professor = document.getElementById('professor').value;
      const room = roomSelect.value;
      const roomType = roomTypeSelect.value;

      // Mettre à jour la cellule
      currentCell.dataset.subject = subject;
      currentCell.dataset.professor = professor;
      currentCell.dataset.room = room;
      currentCell.dataset.roomType = roomType;
      currentCell.innerHTML = `
        <strong>${subject}</strong><br>
        <small>${professor} - ${room} (${roomType.toUpperCase()})</small>
      `;
      currentCell.style.backgroundColor='var(--main-color)';

      // Fermer la modale
      const modal = bootstrap.Modal.getInstance(document.getElementById('editModal'));
      modal.hide();
    });
  </script>
</body>
</html>
