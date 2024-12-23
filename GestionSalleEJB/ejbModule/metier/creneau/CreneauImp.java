package metier.creneau;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import metier.entities.Creneau;
import metier.entities.Filiere;
import metier.entities.Reservation;
import metier.entities.Salle;
import metier.entities.Utilisateur;
import metier.reservation.ReservationLocal;
@Stateless(name="Creneau")
public class CreneauImp implements CreneauLocal ,CreneauRemote{
	@PersistenceContext(unitName="GestionSalle")
	private EntityManager em;
	
	@EJB
	private ReservationLocal reservationService ;
	@Override
	public void ajouterCreneau(Creneau R) {
		em.persist(R);
		
	}

	@Override
	public Creneau getReservation(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifierCreneau(Long id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Creneau> listReservations() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void supprimerCreneau(Long id) {
		// TODO Auto-generated method stub
		
	}
	//fonctions supplimentaires pour la gestion des dates 
	public static Date getProchaineDate(String jourCible) {
        Calendar calendar = Calendar.getInstance(); // Obtient le calendrier actuel
        int today = calendar.get(Calendar.DAY_OF_WEEK); // Récupère le jour actuel (dimanche = 1, lundi = 2, ..., samedi = 7)
        int targetDay = convertToCalendarDay(jourCible); // Convertir le jour cible en numéro de jour de la semaine

        // Calcul des jours à ajouter pour arriver au jour cible
        int daysToAdd = (targetDay - today + 7) % 7;
        if (daysToAdd == 0) {
            daysToAdd = 7; // Si aujourd'hui est déjà le jour cible, on prend la semaine suivante
        }

        // Ajoute les jours nécessaires au calendrier
        calendar.add(Calendar.DAY_OF_MONTH, daysToAdd);

        // Retourne la nouvelle date
        return calendar.getTime();
    }

    // Convertir le jour en numéro de jour de la semaine pour Calendar (dimanche = 1, lundi = 2, ...)
    private static int convertToCalendarDay(String jour) {
        switch (jour.toLowerCase()) {
            case "sunday":
                return Calendar.SUNDAY;
            case "monday":
                return Calendar.MONDAY;
            case "tuesday":
                return Calendar.TUESDAY;
            case "wednesday":
                return Calendar.WEDNESDAY;
            case "thursday":
                return Calendar.THURSDAY;
            case "friday":
                return Calendar.FRIDAY;
            case "saturday":
                return Calendar.SATURDAY;
            default:
                throw new IllegalArgumentException("Jour invalide : " + jour);
        }
    }

    @Override
    public void creationCreneauxEmploi(Filiere F, Salle S, String matiere, String Horaire, String Day, Utilisateur U) {
        int charge = F.getMatieres().get(matiere); // Charge for the subject (how many times it should occur)
        Date PremierCreneau = getProchaineDate(Day); // Get the date for the first session
        System.out.println("Date Premier Creneau : " + PremierCreneau);
        
        // Create the Creneau only once (outside the loop)
        Creneau C = new Creneau(PremierCreneau, Horaire, matiere, S, U, F);
        ajouterCreneau(C); // Add the Creneau to the database (if required)
        
        // Create and add multiple Reservations for the same Creneau
        for (int i = 0; i < charge / 2; i++) {
            Reservation R = new Reservation(F, C, U, "confirmée"); // Create a Reservation for the Creneau
            reservationService.ajouterReservation(R); // Add the Reservation to the database

            // Log the creation of the Reservation
            System.out.println("Reservation " + (i + 1) + " created for Creneau: " + C.getId());
            
            // Move the date forward by 7 days for the next Reservation
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(PremierCreneau);
            calendar.add(Calendar.DAY_OF_MONTH, 7);
            PremierCreneau = calendar.getTime();
            System.out.println("Date future (+7 jours) : " + PremierCreneau);
        }
    }

}
