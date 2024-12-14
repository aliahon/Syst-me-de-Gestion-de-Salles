package metier.Reservation;

import java.util.List;

import metier.entities.Reservation;
import metier.entities.Utilisateur;

public interface ReservationRemote {
	public void ajouterReservation(Reservation R);
	public void confirmerReservation();//do we need a parameter ? 
    public Reservation getReservation(Long id);
    public void modifierReservation(Long id);
    public List<Reservation> listReservations();// toutes les reservation 
    public List<Reservation> listReservations(Utilisateur prof);// selectionner les reservation faites par un utilisateur 
    public void supprimerReservation(Long id);
}
