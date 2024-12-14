package metier.salle;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.*;
import metier.entities.*;

@Stateless(name="Salle")
public class SalleImp implements SalleLocal,SalleRemote{
	@PersistenceContext(unitName="GestionSalle")
    private EntityManager em;

	@Override
    public void ajouterSalle(Salle salle) {
        em.persist(salle);
    }

    @Override
    public Salle getSalle(String id) {
        return em.find(Salle.class, id);
    }
    
    @Override
    public List<Salle> getSalle(NatureSalle nature) {
        TypedQuery<Salle> query = em.createQuery("SELECT s FROM Salle s WHERE s.nature = :nature", Salle.class);
        query.setParameter("nature", nature);
        return query.getResultList();
    }

    @Override
    public void modifierLocalisation(String id, String local) {
        Salle salle = em.find(Salle.class, id);
        if (salle != null) {
            salle.setLocalisation(local);
            em.merge(salle);
        }
    }
    @Override
    public void modifierNature(String id, NatureSalle nature) {
        Salle salle = em.find(Salle.class, id);
        if (salle != null) {
            salle.setNature(nature);
            em.merge(salle);
        }
    }

    @Override
    public void modifierId(String id, String newId) {
        Salle salle = em.find(Salle.class, id);
        if (salle != null) {
            salle.setId(newId);
            em.merge(salle);
        }
    }

    @Override
    public void modifierNbPlaces(String id, long nbp) {
        Salle salle = em.find(Salle.class, id);
        if (salle != null) {
            salle.setNbplace(nbp);
            em.merge(salle);
        }
    }

	@Override
    public List<Salle> listSalles() {
        TypedQuery<Salle> query = em.createQuery("SELECT s FROM Salle s", Salle.class);
        return query.getResultList();
    }

    @Override
    public void supprimerSalle(String id) {
        Salle salle = em.find(Salle.class, id);
        if (salle != null) {
            em.remove(salle);
        }
    }
    
    @Override
    public boolean estDisponible(String salleId, Date dateDebut, Date dateFin) {
        TypedQuery<Creneau> query = em.createQuery(
            "SELECT c FROM Creneau c WHERE c.salle.id = :salleId AND " +
            "((c.dateDebut < :dateFin AND c.dateFin > :dateDebut))", Creneau.class);
        query.setParameter("salleId", salleId);
        query.setParameter("dateDebut", dateDebut);
        query.setParameter("dateFin", dateFin);
        return query.getResultList().isEmpty();
    }
}
