package metier.Liberation;

import java.util.List;

import metier.entities.Liberation;
import metier.entities.Utilisateur;

public interface LiberationLocal {
	public List<Liberation> listLiberations(Long id);
	public List<Liberation> listLiberations();
	public List<Liberation> listLiberations(Utilisateur prof);
}
