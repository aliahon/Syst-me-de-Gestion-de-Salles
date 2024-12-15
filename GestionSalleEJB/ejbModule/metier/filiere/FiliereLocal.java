package metier.filiere;

import java.util.List;

import javax.ejb.Local;

import metier.entities.*;
@Local
public interface FiliereLocal {
	    public void ajouterFiliere(Filiere F);
	    public Filiere getFiliere(String id);
	    public void modifierFiliere(Filiere filiere);
	    public void modifierNomFiliere(String id , String nom);
	    public void modifierEffectifFiliere(String id , long eff);
	    public void modifierNomMatiere(String id , String ancienNom, String nouveauNom);
	    public void modifierChargeHoraire(String id , String matiere, int nouvelleChargeHoraire);
	    public void ajouterMatiere(String id, String matiere, int chargeHoraire);
	    public List<Filiere> listFilieres();
	    boolean existeFiliere(String nomFiliere);
	    public void supprimerFiliere(String id);
}
