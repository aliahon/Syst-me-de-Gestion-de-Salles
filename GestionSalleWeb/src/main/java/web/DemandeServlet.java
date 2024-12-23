package web;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.creneau.CreneauLocal;
import metier.entities.Creneau;
import metier.entities.Filiere;
import metier.entities.NatureSalle;
import metier.entities.Reservation;
import metier.entities.Salle;
import metier.entities.Utilisateur;
import metier.filiere.FiliereLocal;
import metier.reservation.ReservationLocal;
import metier.salle.SalleLocal;
import metier.utilisateur.UtilisateurLocal;



@WebServlet("/DemandeServlet")
public class DemandeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 @EJB
	    private ReservationLocal reservationService;
	 @EJB
	    private FiliereLocal filiereService;
	 @EJB
	    private UtilisateurLocal utilisateurService;
	 @EJB
	    private CreneauLocal creneauService;
	 @EJB
	    private SalleLocal salleService;

	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("natureSalles", NatureSalle.values());
		String action = request.getParameter("action");
        if ("modifier".equals(action)) {
            Long idReservation = Long.parseLong(request.getParameter("idReservation"));
            Reservation demande = reservationService.getReservation(idReservation);
            Salle salle = demande.getCreneauReserve().getSalle();
            Date date = demande.getCreneauReserve().getDateDebut();
            String horaire = demande.getCreneauReserve().getPeriode();
            Filiere filiere = demande.getFiliere();
            request.setAttribute("salle", salle);
            request.setAttribute("date", date);
            request.setAttribute("horaire", horaire);
            request.setAttribute("filiere", filiere);
        }
	    
		 // Récupérer la liste des filières
        List<Filiere> filieres = filiereService.listFilieres();
        // Passer la liste des filières à la JSP
        request.setAttribute("filieres", filieres);
	    
	    HttpSession session = request.getSession();
		Utilisateur user =(Utilisateur) session.getAttribute("user");
		
		List<Reservation> ReservationsProf =  reservationService.listReservations(user.getId());
		request.setAttribute("demandes", ReservationsProf);
		
	    request.getRequestDispatcher("reservationsalle.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
    	if ("supprimer".equals(action)) {
            Long idReservation = Long.parseLong(request.getParameter("idReservation"));
            reservationService.supprimerReservation(idReservation);
            response.sendRedirect("DemandeServlet");
    	}
    	
		String horaire = request.getParameter("horaire");
		String date = request.getParameter("date");
		String idFiliere = request.getParameter("idFiliere");
		String typeSalle = request.getParameter("natureSalle");
		
		NatureSalle natureSalle = null;

		try {
		    natureSalle = NatureSalle.valueOf(typeSalle);
		    System.out.println("Nature de salle convertie : " + natureSalle);
		} catch (IllegalArgumentException e) {
		    System.err.println("Valeur incorrecte pour NatureSalle : " + typeSalle);
		    response.sendRedirect("DemandeServlet?error=invalid_nature_salle");
		    return;
		}
		
		Filiere F = filiereService.getFiliere(idFiliere);
		HttpSession session = request.getSession();
		Utilisateur user =(Utilisateur) session.getAttribute("user");
		
		Creneau C = new Creneau();	
		C.setFiliere(F);
		C.setProf(user);
		C.setPeriode(horaire);
		
		Date datecreneau=null;
		try {
		    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); // Format correspondant à la chaîne
		    datecreneau = formatter.parse(date); // Convertir en java.util.Date
		    System.out.println("Date convertie : " + date);
		    C.setDateDebut(datecreneau);
		   
		} catch (ParseException e) {
		    e.printStackTrace(); // Gestion des erreurs si la chaîne n'est pas au bon format
		}
		 Salle premiereSalle = null;
		//List<Salle> SallesConvenable = SalleConvenable(natureSalle,F.getEffectif(), datecreneau, String horaire);
		 List<Salle> SallesConvenables = salleService.SalleConvenable(natureSalle,F.getEffectif(), datecreneau ,horaire);
		    if (!SallesConvenables.isEmpty()) {
			    premiereSalle = SallesConvenables.get(0);
			    System.out.println("Première salle disponible : " + premiereSalle.getId());
			  } else {
			    System.out.println("Aucune salle disponible pour les critères donnés.");
			    response.sendRedirect("DemandeServlet?errorMessage=Les%20crit%C3%A8res%20de%20r%C3%A9servation%20ne%20sont%20pas%20disponibles.%20Veuillez%20choisir%20d'autres%20crit%C3%A8res.");
			    return; 
			  }
		    
		C.setSalle(premiereSalle);
		creneauService.ajouterCreneau(C);
		
		//Reservation creation et ajout 
		Reservation demande = new Reservation();
		demande.setFiliere(F);
		demande.setProf(user);
		demande.setCreneauReserve(C);
		demande.setStatut("En attente");
		reservationService.ajouterReservation(demande);
		
		
		response.sendRedirect("DemandeServlet");
		
	}

}
