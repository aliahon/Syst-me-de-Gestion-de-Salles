package metier.liberation;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import metier.entities.Liberation;

@Stateless(name="Liberation")
public class LiberationImp implements LiberationLocal, LiberationRemote {

    @PersistenceContext(unitName="GestionSalle")
    private EntityManager em;

    @Override
    public List<Liberation> listLiberations() {
        
        String jpql = "SELECT l FROM Liberation l";
        TypedQuery<Liberation> query = em.createQuery(jpql, Liberation.class);
        return query.getResultList();  
    }

    @Override
    public List<Liberation> listLiberations(Long idProf) {
        
        String jpql = "SELECT l FROM Liberation l WHERE l.idProf = :idProf";
        TypedQuery<Liberation> query = em.createQuery(jpql, Liberation.class);
        query.setParameter("idProf", idProf);  
        return query.getResultList(); 
    }
}
