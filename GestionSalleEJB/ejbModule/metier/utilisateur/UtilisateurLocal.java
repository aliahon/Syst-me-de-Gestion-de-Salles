package metier.utilisateur;

import java.util.List;
import javax.ejb.Local;
import metier.entities.Utilisateur;

@Local
public interface UtilisateurLocal {
	
	    void ajouterUtilisateur(Utilisateur u);
	    
	    Utilisateur getUtilisateur(String email);
	    
	    void modifierUtilisateur(Utilisateur u);
	    
	    void supprimerUtilisateur(Long id);
	    
	    List<Utilisateur> listProfesseurs();

}
