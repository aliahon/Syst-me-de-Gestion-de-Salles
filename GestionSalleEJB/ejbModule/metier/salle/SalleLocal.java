package metier.salle;

import java.util.Date;
import java.util.List;

import javax.ejb.Local;

import metier.entities.NatureSalle;
import metier.entities.Salle;

@Local
public interface SalleLocal {

	public void modifierSalle(Salle S);
    public Salle getSalle(String id);
    public List<Salle> getSalle(NatureSalle nature);//trouver la salle par sa nature 
    public boolean estDisponible(String salleId, Date dateDebut, Date dateFin);
    public List<Salle> listSalles();
    public void supprimerSalle(String id);
}
