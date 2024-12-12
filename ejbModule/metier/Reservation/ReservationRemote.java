package metier.Reservation;

import java.util.List;

import metier.entities.Reservation;

public interface ReservationRemote {
	public void ajouterReservation(Reservation R);
	public void confirmerReservation();//do we need a parameter ? 
    public Reservation getReservation(Long id);
    public void modifierReservation(Long id);
    public List<Reservation> listReservations();
    public List<Reservation> listReservations(Long id);
    public void supprimerReservation(Long id);// ici lorsqu'on supprime il doit etre dans la libereation ou quoi 
}
