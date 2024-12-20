package web;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.entities.Journalisation;
import metier.entities.Liberation;
import metier.entities.Utilisateur;
import metier.journalisation.JournalisationLocal;
import metier.liberation.LiberationLocal;

/**
 * Servlet implementation class JournalisationServlet
 */
@WebServlet("/JournalisationServlet")
public class JournalisationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @EJB
    JournalisationLocal journalisationService;
    @EJB
    LiberationLocal liberationService;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String req = request.getParameter("req");
		HttpSession session =request.getSession();
		Utilisateur Prof = (Utilisateur) session.getAttribute("user");
	
		if(req != null && !req.isEmpty()) {
			if("filiere".equals(req)) {
				List<Journalisation> journalisationFilieres =  journalisationService.getJournalisationFiliere();
				// Inverser la liste
		        Collections.reverse(journalisationFilieres);
				request.setAttribute("journalisationFilieres", journalisationFilieres);
				
				request.getRequestDispatcher("journalisationfilieres.jsp").forward(request, response);
			}else if("salle".equals(req)) {
				List<Journalisation> journalisationSalles =  journalisationService.getJournalisationSalle();
				// Inverser la liste
		        Collections.reverse(journalisationSalles);
				request.setAttribute("journalisationSalles", journalisationSalles);
				
				request.getRequestDispatcher("journalisationsalles.jsp").forward(request, response);
			}else{
				Long idprof = Prof.getId();
				List<Liberation> liberations = liberationService.listLiberations(idprof);
				// Inverser la liste
		        Collections.reverse(liberations);
				request.setAttribute("liberations", liberations);
				
				request.getRequestDispatcher("journalisationreservationprof.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
