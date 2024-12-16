package web;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import metier.entities.Filiere;
import metier.filiere.FiliereLocal;


@WebServlet(name="ServletAjoutFiliere", urlPatterns="/ServletAjoutFiliere")
public class ServletAjoutFiliere extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @EJB
    private FiliereLocal filiereService;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	String action = request.getParameter("action");
    	if ("supprimer".equals(action)) {
            String idFiliere = request.getParameter("idFiliere");
            //Filiere supfiliere = filiereService.getFiliere(idFiliere);
            filiereService.supprimerFiliere(idFiliere);
            response.sendRedirect("ServletAjoutFiliere");
    	}
    	
    	// Retrieve form data
        String nomFiliere = request.getParameter("nomFiliere");
        int effectif = Integer.parseInt(request.getParameter("effectif"));

        // Retrieve matieres and charges horaires
        Map<String, Integer> matieres = new HashMap<>();
        String[] matieresList = request.getParameterValues("matiere[]");
        String[] chargesHorairesList = request.getParameterValues("charge[]");

        if (matieresList != null && chargesHorairesList != null) {
            for (int i = 0; i < matieresList.length; i++) {
                matieres.put(matieresList[i], Integer.parseInt(chargesHorairesList[i]));
            }
        }

        // Create a new Filiere and add it
        Filiere filiere = new Filiere();
        filiere.setId(nomFiliere);
        filiere.setNom(nomFiliere);
        filiere.setEffectif(effectif);
        filiere.setMatieres(matieres);

        filiereService.modifierFiliere(filiere);

        // Redirect to GET method to display the list
        response.sendRedirect("ServletAjoutFiliere");

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String action = request.getParameter("action");

        // Si l'action est "modifier", récupérer l'id de la filière et la charger
        if ("modifier".equals(action)) {
            String idFiliere = request.getParameter("idFiliere");
            Filiere filiere = filiereService.getFiliere(idFiliere);
            request.setAttribute("filiere", filiere);  // Passer l'objet 'filiere' à la JSP
        }
    	
    	// Retrieve the list of filières from the database
        List<Filiere> filieres = filiereService.listFilieres();

        // Pass the list to the JSP
        request.setAttribute("filieres", filieres);

        // Forward to JSP
        request.getRequestDispatcher("gestionfiliere.jsp").forward(request, response);

    }
}