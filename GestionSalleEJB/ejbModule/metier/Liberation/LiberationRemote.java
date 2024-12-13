package metier.Liberation;

import java.util.List;

import metier.entities.Liberation;

public interface LiberationRemote {
	public List<Liberation> listLiberations(Long id);
	public List<Liberation> listLiberations();
}
