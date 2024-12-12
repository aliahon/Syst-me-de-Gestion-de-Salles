package metier.filiere;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.*;
import metier.entities.*;
@Stateless(name="Filiere")
public class FiliereImp implements FiliereLocal , FiliereRemote {
	@PersistenceContext(unitName="GestionSalle")
	private EntityManager em;
	@Override
	public void ajouterFiliere(Filiere F) {
		 em.persist(F);
	}

	@Override
	public Filiere getFiliere(String id) {
		Filiere F = em.find(Filiere.class, id);
        if (F == null) throw new RuntimeException("Filiere introuvable");
        return F;
	}

	@Override
	public void modifierFiliere(String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Filiere> listFilieres() {
		 Query req = em.createQuery("select f from Filiere f");
	        return req.getResultList();
	}

	@Override
	public void supprimerFiliere(String id) {
		// TODO Auto-generated method stub
		
	}
	

}
