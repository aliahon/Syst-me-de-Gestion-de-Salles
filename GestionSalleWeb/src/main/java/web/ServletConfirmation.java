package web;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.creneau.CreneauLocal;
import metier.entities.Reservation;
import metier.filiere.FiliereLocal;
import metier.reservation.ReservationLocal;
import metier.salle.SalleLocal;
import metier.utilisateur.UtilisateurLocal;

/**
 * Servlet implementation class ServletConfirmation
 */
@WebServlet("/ServletConfirmation")
public class ServletConfirmation extends HttpServlet {
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
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletConfirmation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 List<Reservation> ReservationAttente = reservationService.listReservationsEnAttente();
		 request.setAttribute("reservationAttente", ReservationAttente);
		 request.getRequestDispatcher("gestiondemandes.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Récupérer l'ID de la réservation à confirmer
        Long reservationId = Long.parseLong(request.getParameter("reservationId"));

        // Récupérer la réservation
        Reservation reservation = reservationService.getReservation(reservationId);
        if (reservation != null) {
            // Mettre à jour le statut
            reservation.setStatut("confirmée");
            reservationService.modifierReservation(reservation);
        }

        // Rediriger vers la liste des demandes
        response.sendRedirect("ServletConfirmation");
    }
}
