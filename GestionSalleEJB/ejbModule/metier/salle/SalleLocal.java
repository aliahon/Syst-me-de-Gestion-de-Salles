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
    public boolean estDisponible(String salleId, Date dateDebut, String periode);
    public List<Salle> listSalles();
    
    public List<Salle> SalleConvenable(NatureSalle nature, long eff,Date dateDebut, String horaire);
    
    public void supprimerSalle(String id);
}
