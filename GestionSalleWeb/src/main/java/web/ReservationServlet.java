package web;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.reservation.ReservationLocal;

/**
 * Servlet implementation class ReservationServlet
 */
@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @EJB
    ReservationLocal reservationService;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Object[]> reservationsConfirmees = reservationService.afficherReservationsConfirmees();
		request.setAttribute("reservationsConfirmees", reservationsConfirmees);
		
		
		request.getRequestDispatcher("liberationsalle.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idParam = request.getParameter("id");
        String action = request.getParameter("action");

        if (idParam != null && action != null) {
            Long id = Long.parseLong(idParam);

            // Vérifier l'action et appeler le service approprié
            if ("definitive".equals(action)) {
            	reservationService.handleAfterReservationDelete(id, "Définitive");
                reservationService.supprimerReservationsParCreneau(id);
            } else if ("exceptionnelle".equals(action)) {
            	reservationService.handleAfterReservationDelete(id, "Exceptionnelle");
                reservationService.supprimerReservation(id);
            }
        }

        // Redirection vers la page principale après traitement
        response.sendRedirect("ReservationServlet");
	}

}
