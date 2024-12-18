package metier.journalisation;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import metier.entities.Journalisation;
@Stateless(name="Journalisation")
public class JournalisationImp implements JournalisationLocal, JournalisationRemote{
	@PersistenceContext(unitName="GestionSalle")
    private EntityManager em;
	// Récupération des opérations sur "salle"
    @Override
    public List<Journalisation> getJournalisationSalle() {
        TypedQuery<Journalisation> query = em.createQuery(
            "SELECT j FROM Journalisation j WHERE j.tableName = :tableName", 
            Journalisation.class
        );
        query.setParameter("tableName", "salle");
        return query.getResultList();
    }

    // Récupération des opérations sur "filiere"
    @Override
    public List<Journalisation> getJournalisationFiliere() {
        TypedQuery<Journalisation> query = em.createQuery(
            "SELECT j FROM Journalisation j WHERE j.tableName = :tableName", 
            Journalisation.class
        );
        query.setParameter("tableName", "filiere");
        return query.getResultList();
    }

}
