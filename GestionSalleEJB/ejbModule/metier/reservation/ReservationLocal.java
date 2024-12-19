package metier.reservation;

import java.util.List;

import javax.ejb.Local;

import metier.entities.Reservation;

@Local
public interface ReservationLocal {
	public void ajouterReservation(Reservation R);
	public void confirmerReservation();//do we need a parameter ? 
    public Reservation getReservation(Long id);
    public void modifierReservation(Long id);
    public List<Reservation> listReservations();// toutes les reservation 
    public List<Reservation> listReservationsEnAttente();//les demandes non confirmer
    public List<Reservation> listReservations(Long idProf);// selectionner les reservation faites par un utilisateur 
    
    public void supprimerReservation(Long id); //Libération Exeptionnelle
    void supprimerReservationsParCreneau(Long idReservation) ; //Liberation Definitive
    List<Object[]> afficherReservationsConfirmees();
}
