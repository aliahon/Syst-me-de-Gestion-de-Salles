package metier.utilisateur;

import java.util.List;
import javax.ejb.Remote;
import metier.entities.Utilisateur;

@Remote
public interface UtilisateurRemote {
	
	    void ajouterUtilisateur(Utilisateur u);
	    
	    Utilisateur getUtilisateur(String email);
	    
	    boolean validerUtilisateur(String email, String password);
	    
	    void modifierUtilisateur(Utilisateur u);
	    
	    void supprimerUtilisateur(Long id);
	    
	    List<Utilisateur> listProfesseurs();

		Utilisateur getUtilisateurByid(Long id);

}
