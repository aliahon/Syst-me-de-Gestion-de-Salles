package web;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.entities.Filiere;
import metier.entities.NatureSalle;
import metier.filiere.FiliereLocal;
import metier.reservation.ReservationLocal;



@WebServlet("/DemandeServlet")
public class DemandeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
	private ReservationLocal reservationService;
	 @EJB
	    private FiliereLocal filiereService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Pass enum values to JSP
	    request.setAttribute("natureSalleList", NatureSalle.values());
	    
	    List<Filiere> filieres = filiereService.listFilieres();
	    request.setAttribute("filieres", filieres);
	    
	    request.getRequestDispatcher("reservationsalle.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
