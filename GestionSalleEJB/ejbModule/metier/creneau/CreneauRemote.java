package metier.creneau;

import java.util.List;

import javax.ejb.Remote;

import metier.entities.Creneau;
@Remote
public interface CreneauRemote {
	public void ajouterCreneau(Creneau R);
    public Creneau getReservation(Long id);
    public void modifierCreneau(Long id);
    public List<Creneau> listReservations();
    public void supprimerCreneau(Long id);// sera t-il supprimer un jour ? car meme si la reservation
                                         // est supprimee il reste dans la liberation ? ou bien c'est 
                                         //just l'information copier dans la table et c'est tous ?
}
