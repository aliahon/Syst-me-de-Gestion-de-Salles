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
import metier.filiere.FiliereLocal;

@WebServlet(name="FiliereServlet", urlPatterns="/FiliereServlet")
public class FiliereServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @EJB
    private FiliereLocal filiereService;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Récupérer la liste des filières
        List<Filiere> filieres = filiereService.listFilieres();

        // Passer la liste des filières à la JSP
        request.setAttribute("filieres", filieres);

        // Rediriger vers la page JSP
        request.getRequestDispatcher("plannificationemploi.jsp").forward(request, response);
    }

}
