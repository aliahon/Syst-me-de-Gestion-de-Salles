package metier.salle;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import metier.entities.Creneau;
import metier.entities.NatureSalle;
import metier.entities.Salle;

@Stateless(name="Salle")
public class SalleImp implements SalleLocal,SalleRemote{
	@PersistenceContext(unitName="GestionSalle")
    private EntityManager em;

	@Override
    public void modifierSalle(Salle salle) {
        em.merge(salle);
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
    public boolean estDisponible(String salleId, Date dateDebut, String horaire) {
        TypedQuery<Creneau> query = em.createQuery(
            "SELECT c FROM Creneau c WHERE c.salle.id = :salleId " +
            "AND c.dateDebut = :dateDebut AND c.periode = :horaire", Creneau.class);
        query.setParameter("salleId", salleId);
        query.setParameter("dateDebut", dateDebut);
        query.setParameter("horaire", horaire);

        return query.getResultList().isEmpty(); // Retourne true si aucune réservation ne correspond
    }

    @Override
    public List<Salle> SalleConvenable(NatureSalle nature, long eff, Date dateDebut, String horaire) {// eff recupere de la filiere choisie
        // Requête pour récupérer les salles qui correspondent aux critères
        TypedQuery<Salle> query = em.createQuery(
            "SELECT s FROM Salle s WHERE s.nature = :nature AND s.nbplace >= :eff " +
            "ORDER BY ABS(s.nbplace - :eff)", Salle.class);
        query.setParameter("nature", nature);
        query.setParameter("eff", eff);

        List<Salle> sallesPotentielles = query.getResultList();

        // Filtrer les salles disponibles uniquement
        List<Salle> sallesDisponibles = new ArrayList<>();
        for (Salle salle : sallesPotentielles) {
            if (estDisponible(salle.getId(), dateDebut, horaire)) {
                sallesDisponibles.add(salle);
            }
        }

        return sallesDisponibles;
    }


}