package metier.filiere;

import java.util.List;

import metier.entities.Filiere;

public interface FiliereLocal {
	    public void ajouterFiliere(Filiere F);
	    public Filiere getFiliere(String id);
	    public void modifierNomFiliere(String id , String nom);
	    public void modifierEffectifFiliere(String id , long eff);
	    public void modifierNomMatiere(String id , String ancienNom, String nouveauNom);
	    public void modifierChargeHoraire(String id , String matiere, int nouvelleChargeHoraire);
	    public void ajouterMatiere(String id, String matiere, int chargeHoraire);
	    public List<Filiere> listFilieres();
	    public void supprimerFiliere(String id);
}
