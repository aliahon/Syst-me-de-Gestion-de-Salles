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
	public void supprimerReservationsParCreneau(Long idReservation) {
	    // Récupérer la réservation avec l'ID fourni
	    Reservation reservation = em.find(Reservation.class, idReservation);
	    
	    if (reservation != null) {
	        // Récupérer l'ID du créneau associé à cette réservation
	        Long idCreneau = reservation.getCreneauReserve().getId();
	        
	        // Créer la requête JPQL pour récupérer toutes les réservations liées à ce créneau
	        TypedQuery<Reservation> query = em.createQuery(
	            "SELECT r FROM Reservation r WHERE r.creneauReserve.id = :idCreneau", Reservation.class);
	        query.setParameter("idCreneau", idCreneau);
	        
	        // Récupérer la liste des réservations associées au créneau
	        List<Reservation> reservations = query.getResultList();
	        
	        // Supprimer chaque réservation récupérée
	        for (Reservation r : reservations) {
	            em.remove(r);
	        }
	    }
	}

	
	@Override
	public List<Object[]> afficherReservationsConfirmees() {
	    // JPQL pour récupérer les informations nécessaires avec condition sur le statut
	    TypedQuery<Object[]> query = em.createQuery(
	        "SELECT r.id, " +                       // ID de la réservation
	               "r.creneauReserve.salle.id, " + // Nom de la salle
	               "r.creneauReserve.periode, " +   // Horaire
	               "r.creneauReserve.dateDebut, " +      // Date
	               "r.creneauReserve.salle.nature, " +      // Type
	               "r.filiere.nom " +               // Filière
	        "FROM Reservation r " +
	        "WHERE r.statut = :statut", Object[].class);

	    // Assigner la valeur du paramètre :statut
	    query.setParameter("statut", "confirmée");

	    // Retourner la liste des résultats
	    return query.getResultList();
	}
	@Override
	public List<Reservation> listReservationsEnAttente() {
	    return em.createQuery("SELECT r FROM Reservation r WHERE r.statut = :statut", Reservation.class)
	             .setParameter("statut", "En attente")
	             .getResultList();
	}

	@Override
	public void modifierReservation(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifierReservation(Reservation R) {
	    if (R != null) {
	        em.merge(R); // Synchronise l'entité avec la base de données
	    } else {
	        throw new IllegalArgumentException("La réservation fournie est null.");
	    }
	}



}
