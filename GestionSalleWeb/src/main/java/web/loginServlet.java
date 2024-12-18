package web;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import metier.entities.Filiere;
import metier.entities.Role;
import metier.entities.Utilisateur;
import metier.filiere.FiliereLocal;
import metier.utilisateur.UtilisateurLocal;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet(name="loginServlet", urlPatterns="/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
    private UtilisateurLocal utilisateurService;
	@EJB
	private FiliereLocal filiereService;
	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate user credentials via EJB
        boolean isValid = utilisateurService.validerUtilisateur(email, password);

        if (isValid) {
            // Successful login: Redirect to dashboard or home page
        	Utilisateur u = utilisateurService.getUtilisateur(email);
        	request.setAttribute("name", u.getNom());
        	HttpSession session = request.getSession();
        	session.setAttribute("user", u);
        	List<Filiere> filieres = filiereService.listFilieres();
        	if(u.getRole().equals(Role.CF)) {
        		session.setAttribute("filieres",filieres);
        		request.getRequestDispatcher("coordinateur.jsp").forward(request, response);
        	}
        	else if (u.getRole().equals(Role.PROF)) {
        		request.getRequestDispatcher("professeur.jsp").forward(request, response);
        	}
        	else if (u.getRole().equals(Role.RS)) {
        		request.getRequestDispatcher("gestionnaire.jsp").forward(request, response);
        	}
            
        } else {
            // Failed login: Return to login page with an error message
            request.setAttribute("showModal", "true");
            request.setAttribute("errorMessage", "Adresse e-mail ou mot de passe invalide. Veuillez réessayer.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}