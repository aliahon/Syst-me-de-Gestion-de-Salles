package metier.utilisateur;

import java.util.List;
import javax.ejb.Remote;
import metier.entities.Utilisateur;

@Remote
public interface UtilisateurRemote {
	
	    void ajouterUtilisateur(Utilisateur u);
	    
	    Utilisateur getUtilisateur(String email);
	    
	    void modifierUtilisateur(Utilisateur u);
	    
	    void supprimerUtilisateur(Long id);
	    
	    List<Utilisateur> listProfesseurs();

}
