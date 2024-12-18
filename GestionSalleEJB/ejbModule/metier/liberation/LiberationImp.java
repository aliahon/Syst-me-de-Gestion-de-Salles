package metier.liberation;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import metier.entities.Liberation;
@Stateless(name="Liberation")
public class LiberationImp implements LiberationLocal, LiberationRemote{
	@PersistenceContext(unitName="GestionSalle")
	private EntityManager em;
	@Override
	public List<Liberation> listLiberations() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Liberation> listLiberations(Long idProf) {
		// TODO Auto-generated method stub
		return null;
	}

}
