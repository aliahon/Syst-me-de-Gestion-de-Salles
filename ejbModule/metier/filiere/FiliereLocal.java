package metier.filiere;

import java.util.List;

import metier.entities.Filiere;

public interface FiliereLocal {
	public void ajouterFiliere(Filiere F);
    public Filiere getFiliere(String id);
    public void modifierFiliere(String id);
    public List<Filiere> listFilieres();
    public void supprimerFiliere(String id);
}
