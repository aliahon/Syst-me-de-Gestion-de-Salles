package metier.reservation;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void supprimerReservation(Long id) {
		// TODO Auto-generated method stub
		Reservation r = em.find(Reservation.class, id);
        if (r != null) {
            em.remove(r);
        }
		
	}

}
