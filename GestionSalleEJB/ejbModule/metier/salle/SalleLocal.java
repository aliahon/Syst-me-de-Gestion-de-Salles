package metier.salle;

import java.util.List;

import metier.entities.Salle;

public interface SalleLocal {
	public void ajouterSalle(Salle S);
    public Salle getSalle(String id);
    public void modifierSalle(String id);
    public List<Salle> listSalles();
    public void supprimerSalle(String id);
}
