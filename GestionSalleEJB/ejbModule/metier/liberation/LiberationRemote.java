package metier.liberation;

import java.util.List;

import javax.ejb.Remote;

import metier.entities.Liberation;
@Remote
public interface LiberationRemote {
	public List<Liberation> listLiberations();
	public List<Liberation> listLiberations(Long idProf);
}
