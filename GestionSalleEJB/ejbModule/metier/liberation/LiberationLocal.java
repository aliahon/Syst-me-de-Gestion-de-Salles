package metier.liberation;

import java.util.List;

import javax.ejb.Local;

import metier.entities.Liberation;
@Local
public interface LiberationLocal {
	public List<Liberation> listLiberations();
	public List<Liberation> listLiberations(Long idProf);
}
