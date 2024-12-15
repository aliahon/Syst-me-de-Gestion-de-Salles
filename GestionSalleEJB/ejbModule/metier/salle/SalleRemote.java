package metier.salle;

import java.util.Date;
import java.util.List;

import javax.ejb.Remote;

import metier.entities.NatureSalle;
import metier.entities.Salle;

@Remote
public interface SalleRemote {
	public void ajouterSalle(Salle S);
    public Salle getSalle(String id);
    public List<Salle> getSalle(NatureSalle nature);//trouver la salle par sa nature 
    public void modifierLocalisation(String id , String local);
    public void modifierNature(String id , NatureSalle nature);
    public void modifierId(String id , String newId);
    public void modifierNbPlaces(String id , long nbp);
    public boolean estDisponible(String salleId, Date dateDebut, Date dateFin);
    public List<Salle> listSalles();
    public void supprimerSalle(String id);
}
