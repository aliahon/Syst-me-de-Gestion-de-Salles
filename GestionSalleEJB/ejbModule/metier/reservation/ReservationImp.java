package metier.reservation;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import metier.entities.Creneau;
import metier.entities.Reservation;
@Stateless(name="Reservation")
public class ReservationImp implements ReservationLocal, ReservationRemote{
	@PersistenceContext(unitName="GestionSalle")
	private EntityManager em;
	@Override
    public void ajouterReservation(Reservation reservation) {
        em.persist(reservation);
    }

	@Override
	public void confirmerReservation() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Reservation getReservation(Long id) {
		// TODO Auto-generated method stub
		return em.find(Reservation.class, id);
	}

	@Override
	public void modifierReservation(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Reservation> listReservations() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reservation> listReservations(Long idProf) {
	    // Création de la requête JPQL pour récupérer les réservations d'un utilisateur spécifique
	    TypedQuery<Reservation> query = em.createQuery(
	        "SELECT r FROM Reservation r WHERE r.prof.id = :idProf", Reservation.class);
	    query.setParameter("idProf", idProf);

	    // Retourner la liste des réservations
	    return query.getResultList();
	}

	@Override
	public void supprimerReservation(Long id) {
	    Reservation r = em.find(Reservation.class, id);
	    
	    if (r != null) {
	        Creneau creneau = r.getCreneauReserve();
	        
	        // Dissocier le créneau avant de supprimer la réservation
	        //r.setCreneauReserve(null); // Désassociation du créneau
	        
	        // Supprimer la réservation
	        em.remove(r);
	        em.remove(creneau);
	       
	    }
	}


	@Override
	public List<Reservation> listReservationsEnAttente() {
		// TODO Auto-generated method stub
		return null;
	}

}
