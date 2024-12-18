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
import metier.entities.Creneau;
import metier.entities.Filiere;
import metier.entities.NatureSalle;
import metier.entities.Salle;
import metier.entities.Utilisateur;
import metier.filiere.FiliereLocal;
import metier.salle.SalleLocal;
import metier.utilisateur.UtilisateurLocal;

@WebServlet("/ServletEmploi")
public class ServletEmploi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  @EJB
	    private FiliereLocal filiereService;
	  @EJB
	    private UtilisateurLocal utilisateurService;
	  @EJB 
	    private SalleLocal salleService;
	  @EJB
	    private CreneauLocal creneauService;
	  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletEmploi() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nomFiliere");
        //String emailuser = request.getParameter("user");
        //Utilisateur user = utilisateurService.getUtilisateur(emailuser);
        //request.setAttribute("user", user);
        Filiere F =filiereService.getFiliere(nom);
        List<String> matieres =filiereService.getMatieres(F.getId());
        List<Salle> Salles = salleService.listSalles();
        List<Creneau> emploi = F.getEmploiDuTemps();
        List<Utilisateur> profs = utilisateurService.listProfesseurs();
        request.setAttribute("profs", profs);
        request.setAttribute("emploi", emploi);
        request.setAttribute("salles", Salles);
        request.setAttribute("Filiere", F);
        request.setAttribute("matieres", matieres);
        request.setAttribute("natureSalles", NatureSalle.values());
        request.getRequestDispatcher("emploitemps.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Récupérer les paramètres envoyés par le formulaire
	    String day = request.getParameter("day");         // Jour de la cellule
	    String time = request.getParameter("time");       // Heure de la cellule
	    String matiere = request.getParameter("matiere"); // Matière choisie
	    Long idProf = Long.parseLong(request.getParameter("idProf")); // Professeur
	    String room = request.getParameter("room");// Salle choisie
	    String idfiliere = request.getParameter("idFiliere");//la filiere qui a reserve 
	    
        Filiere F =filiereService.getFiliere(idfiliere);
        Salle S = salleService.getSalle(room);
        Utilisateur U = utilisateurService.getUtilisateurByid(idProf);
        
        creneauService.creationCreneauxEmploi(F,S,matiere,time,day,U);
        
	    // Redirection pour rafraîchir la page avec les nouvelles données
	    // response.sendRedirect("ServletEmploi");
	}
	
}