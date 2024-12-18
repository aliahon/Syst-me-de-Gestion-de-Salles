package metier.reservation;

import java.util.List;

import javax.ejb.Remote;

import metier.entities.Reservation;
@Remote
public interface ReservationRemote {
	public void ajouterReservation(Reservation R);
	public void confirmerReservation();//do we need a parameter ? 
    public Reservation getReservation(Long id);
    public void modifierReservation(Long id);
    public List<Reservation> listReservations();// toutes les reservation 
    public List<Reservation> listReservations(Long idProf);// selectionner les reservation faites par un utilisateur 
    public void supprimerReservation(Long id);
}
