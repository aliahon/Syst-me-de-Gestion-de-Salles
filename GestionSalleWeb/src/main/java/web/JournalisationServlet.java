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

import metier.entities.Journalisation;
import metier.journalisation.JournalisationLocal;

/**
 * Servlet implementation class JournalisationServlet
 */
@WebServlet("/JournalisationServlet")
public class JournalisationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @EJB
    JournalisationLocal journalisationService;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String req = request.getParameter("req");
		if("1".equals(req)) {
			List<Journalisation> journalisationFilieres =  journalisationService.getJournalisationFiliere();
			// Inverser la liste
	        Collections.reverse(journalisationFilieres);
			request.setAttribute("journalisationFilieres", journalisationFilieres);
			
			request.getRequestDispatcher("journalisationfilieres.jsp").forward(request, response);
		}else if("2".equals(req)) {
			List<Journalisation> journalisationSalles =  journalisationService.getJournalisationSalle();
			// Inverser la liste
	        Collections.reverse(journalisationSalles);
			request.setAttribute("journalisationSalles", journalisationSalles);
			
			request.getRequestDispatcher("journalisationsalles.jsp").forward(request, response);
		}else {
            // Gérer le cas où le paramètre "req" est manquant ou invalide
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Requête invalide !");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
