package web;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.entities.Utilisateur;
import metier.utilisateur.UtilisateurLocal;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet(name="loginServlet", urlPatterns="/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@EJB
    private UtilisateurLocal utilisateurService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate user credentials via EJB
        boolean isValid = utilisateurService.validerUtilisateur(email, password);

        if (isValid) {
            // Successful login: Redirect to dashboard or home page
        	Utilisateur u = utilisateurService.getUtilisateur(email);
        	request.setAttribute("name", u.getNom());
            request.getRequestDispatcher("coordinateur.jsp").forward(request, response);
        } else {
            // Failed login: Return to login page with an error message
            request.setAttribute("showModal", "true");
            request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
}