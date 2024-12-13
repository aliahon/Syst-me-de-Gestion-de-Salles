package Tests;

import javax.ejb.EJB;
import metier.entities.Filiere;
import metier.filiere.*;


import java.util.HashMap;
import java.util.Map;

public class TestFiliere {

    @EJB
    private static FiliereImp filiereService;

    public static void main(String[] args) {
        // 1. Tester l'ajout d'une nouvelle filière
        testAjouterFiliere();

        // 2. Tester la modification d'une matière existante
        //testModifierChargeHoraire();

        // 3. Tester le changement de nom d'une matière existante
      //  testModifierNomMatiere();

        // 4. Lister toutes les filières
      //  testListerFilieres();

        // 5. Supprimer une filière
       // testSupprimerFiliere();
    }

    private static void testAjouterFiliere() {
        Filiere filiere = new Filiere();
        filiere.setId("F01");
        filiere.setNom("Informatique");
        filiere.setEffectif(120);

        // Ajouter des matières avec leurs charges horaires
        Map<String, Integer> matieres = new HashMap<>();
        matieres.put("Mathématiques", 20);
        matieres.put("Informatique", 15);
        matieres.put("Physique", 10);
        filiere.setMatieres(matieres);

        // Ajouter la filière en base de données
        filiereService.ajouterFiliere(filiere);
        System.out.println("Filière ajoutée avec succès !");
    }

    private static void testModifierChargeHoraire() {
        String idFiliere = "F01";
        String nomMatiere = "Mathématiques";

        // Modifier la charge horaire d'une matière existante
        filiereService.modifierChargeHoraire(idFiliere, nomMatiere, 25); // Nouveau charge horaire : 25
        System.out.println("Charge horaire modifiée pour la matière " + nomMatiere + ".");
    }

    private static void testModifierNomMatiere() {
        String idFiliere = "F01";
        String ancienNom = "Mathématiques";
        String nouveauNom = "Mathématiques Avancées";

        // Modifier le nom d'une matière existante
        filiereService.modifierNomMatiere(idFiliere, ancienNom, nouveauNom);
        System.out.println("Nom de la matière modifié de " + ancienNom + " à " + nouveauNom + ".");
    }

    private static void testListerFilieres() {
        // Lister toutes les filières et leurs matières
        System.out.println("Liste des filières :");
        filiereService.listFilieres().forEach(f -> {
            System.out.println("Filière : " + f.getNom() + " (Effectif : " + f.getEffectif() + ")");
            f.getMatieres().forEach((matiere, charge) ->
                System.out.println("\tMatière : " + matiere + ", Charge horaire : " + charge)
            );
        });
    }

    private static void testSupprimerFiliere() {
        String idFiliere = "F01";

        // Supprimer une filière par son ID
        filiereService.supprimerFiliere(idFiliere);
        System.out.println("Filière avec l'ID " + idFiliere + " supprimée avec succès !");
    }
}

