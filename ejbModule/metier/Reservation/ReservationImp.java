package metier.Reservation;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import metier.entities.Reservation;

@Stateless(name="Reservation")
public class ReservationImp implements ReservationLocal , ReservationRemote {
	@PersistenceContext(unitName="GestionSalle")
	private EntityManager em;
    @Override
    public void ajouterReservation(Reservation reservation) {
        em.persist(reservation);
    }

}
