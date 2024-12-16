package web;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.entities.NatureSalle;
import metier.entities.Salle;
import metier.salle.SalleLocal;

/**
 * Servlet implementation class SalleServlet
 */

@WebServlet(name="SalleServlet", urlPatterns="/SalleServlet")
public class SalleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @EJB
    private SalleLocal salleService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
    	if ("supprimer".equals(action)) {
            String idSalle = request.getParameter("idSalle");
            salleService.supprimerSalle(idSalle);
            response.sendRedirect("SalleServlet");
    	}
    	
    	// Retrieve form data
        String nomSalle = request.getParameter("nomSalle");

        String localisationSalle= request.getParameter("localisationSalle"); // Localisation de la salle

        long nombreplace = Long.parseLong(request.getParameter("nombreplace")); // Nombre de places dans la salle

        NatureSalle natureSalle = NatureSalle.valueOf(request.getParameter("natureSalle"));

      

        
        Salle salle = new Salle();
        salle.setId(nomSalle);
        salle.setLocalisation(localisationSalle);
        salle.setNature(natureSalle);
        salle.setNbplace(nombreplace);


        salleService.modifierSalle(salle);

        // Redirect to GET method to display the list
        response.sendRedirect("SalleServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

        // Si l'action est "modifier", récupérer l'id de la filière et la charger
        if ("modifier".equals(action)) {
            String idSalle = request.getParameter("idSalle");
            Salle salle = salleService.getSalle(idSalle);
            request.setAttribute("salle", salle);  // Passer l'objet 'filiere' à la JSP
        }
    	// Retrieve the list of filières from the database
        List<Salle> salles = salleService.listSalles();

        // Pass the list to the JSP
        request.setAttribute("salles", salles);

        // Forward to JSP
        request.getRequestDispatcher("salles.jsp").forward(request, response);
	}

}
