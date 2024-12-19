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
        // Crée une requête pour récupérer toutes les libérations
        String jpql = "SELECT l FROM Liberation l";
        TypedQuery<Liberation> query = em.createQuery(jpql, Liberation.class);
        return query.getResultList();  // Retourne la liste des libérations
    }

    @Override
    public List<Liberation> listLiberations(Long idProf) {
        // Crée une requête pour récupérer les libérations d'un professeur spécifique
        String jpql = "SELECT l FROM Liberation l WHERE l.idProf = :idProf";
        TypedQuery<Liberation> query = em.createQuery(jpql, Liberation.class);
        query.setParameter("idProf", idProf);  // Remplace le paramètre dans la requête
        return query.getResultList();  // Retourne la liste des libérations du professeur
    }
}
