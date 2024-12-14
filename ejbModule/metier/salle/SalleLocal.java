package metier.salle;
import java.util.List;
import metier.entities.NatureSalle;
import metier.entities.Salle;

public interface SalleLocal {
	public void ajouterSalle(Salle S);
    public Salle getSalle(String id);//trouver la salle avec son id (nom)
    public List<Salle> getSalle(NatureSalle nature);//trouver la salle par sa nature 
    public void modifierLocalisation(String id , String local);
    public void modifierNature(String id , NatureSalle nature);
    public void modifierId(String id , String newId);
    public void modifierNbPlaces(String id , long nbp);
    public void disponibilite(String id);
    public List<Salle> listSalles();
    public void supprimerSalle(String id);
}
