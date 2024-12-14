package metier.utilisateur;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.*;
import metier.entities.Utilisateur;

@Stateless(name = "Utilisateur")
public class UtilisateurImp implements UtilisateurLocal, UtilisateurRemote {
    @PersistenceContext(unitName = "GestionSalle")
    private EntityManager em;

    
    @Override
    public void ajouterUtilisateur(Utilisateur u) {
        em.persist(u);
    }


    @Override
    public void modifierUtilisateur(Utilisateur u) {
        Utilisateur utilisateurExist = em.find(Utilisateur.class, u.getId());
        if (utilisateurExist == null) {
            throw new RuntimeException("Utilisateur introuvable pour modification");
        }
        utilisateurExist.setNom(u.getNom());
        utilisateurExist.setEmail(u.getEmail());
        utilisateurExist.setPassword(u.getPassword());
        utilisateurExist.setRole(u.getRole());
        em.merge(utilisateurExist);
    }

    @Override
    public void supprimerUtilisateur(Long id) {
        Utilisateur u = em.find(Utilisateur.class, id);
        if (u == null) throw new RuntimeException("Utilisateur introuvable avec l'ID : " + id);
        em.remove(u);
    }


    @Override
    public Utilisateur getUtilisateur(String email) {
        try {
            TypedQuery<Utilisateur> query = em.createQuery(
                "SELECT u FROM Utilisateur u WHERE u.email = :email", Utilisateur.class);
            query.setParameter("email", email);
            return query.getSingleResult();
        } catch (NoResultException e) {
            throw new RuntimeException("Utilisateur introuvable avec l'email: " + email);
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Utilisateur> listProfesseurs() {
        Query req = em.createQuery("SELECT u FROM Utilisateur u WHERE u.role = 'professeur'");
        return req.getResultList();
    }
}
