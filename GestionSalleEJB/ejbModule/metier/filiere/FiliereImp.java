package metier.filiere;
import java.util.List;
import java.util.Map;

import javax.ejb.Stateless;
import javax.persistence.*;
import metier.entities.*;

@Stateless(name="Filiere")
public class FiliereImp implements FiliereLocal , FiliereRemote {
	@PersistenceContext(unitName="GestionSalle")
	private EntityManager em;
	@Override
	public void ajouterFiliere(Filiere F) {
		 em.persist(F);
	}

	@Override
	public Filiere getFiliere(String id) {
		Filiere F = em.find(Filiere.class, id);
        if (F == null) throw new RuntimeException("Filiere introuvable");
        return F;
	}


	@SuppressWarnings("unchecked")
	@Override
	public List<Filiere> listFilieres() {
		 Query req = em.createQuery("select f from Filiere f");
	        return req.getResultList();
	}

	@Override
	public void supprimerFiliere(String id) {
		Filiere filiere = em.find(Filiere.class, id);
        if (filiere != null) {
            em.remove(filiere);
        }
		
	}

	@Override
	public void modifierNomFiliere(String id,String nom) {
		  Filiere filiere = em.find(Filiere.class, id);
	        if (filiere != null) {
	            filiere.setNom(nom);
	            em.merge(filiere);
	        }
	}

	@Override
	public void modifierEffectifFiliere(String id, long eff) {
		 Filiere filiere = em.find(Filiere.class, id);
	        if (filiere != null) {
	            filiere.setEffectif(eff); 
	            em.merge(filiere);
	        }
	}
	
	@Override
	public void ajouterMatiere(String id, String matiere, int chargeHoraire) {
	    Filiere filiere = em.find(Filiere.class, id);
	    
	    if (filiere != null) {
	        Map<String, Integer> matieres = filiere.getMatieres();
	        
	        // Mise à jour ou ajout de la matière avec la charge horaire spécifiée
	        matieres.put(matiere, chargeHoraire);
	        
	        // Synchronisation de la Map avec la base de données
	        filiere.setMatieres(matieres);
	        
	        // Mise à jour de la filière en base
	        em.merge(filiere);
	    } else {
	        System.out.println("La filière avec l'ID " + id + " n'existe pas.");
	    }
	}

	@Override
	public void modifierNomMatiere(String id, String ancienNom, String nouveauNom) {
		 // Recherche de la filière par son ID
	    Filiere filiere = em.find(Filiere.class, id);
	    
	    if (filiere != null) {
	        // Récupération de la Map des matières
	        Map<String, Integer> matieres = filiere.getMatieres();
	        
	        // Vérification si la matière existe avec l'ancien nom
	        if (matieres.containsKey(ancienNom)) {
	            // Récupérer la charge horaire associée à l'ancien nom
	            Integer chargeHoraire = matieres.get(ancienNom);
	            
	            // Supprimer l'entrée avec l'ancien nom
	            matieres.remove(ancienNom);
	            
	            // Ajouter une nouvelle entrée avec le nouveau nom et la même charge horaire
	            matieres.put(nouveauNom, chargeHoraire);
	            
	            // Synchronisation de la Map avec la base de données
	            filiere.setMatieres(matieres);
	            
	            // Mise à jour de la filière en base
	            em.merge(filiere);
	        } else {
	            // La matière avec l'ancien nom n'existe pas
	            System.out.println("La matière " + ancienNom + " n'existe pas pour la filière " + id + ".");
	        }
	    } else {
	        System.out.println("La filière avec l'ID " + id + " n'existe pas.");
	    }
	}

	@Override
	public void modifierChargeHoraire(String id, String matiere, int nouvelleChargeHoraire) {
		
	    Filiere filiere = em.find(Filiere.class, id);
	    
	    if (filiere != null) {
	        // Récupération de la Map des matières
	        Map<String, Integer> matieres = filiere.getMatieres();
	        
	        // Mise à jour ou ajout de la matière avec la charge horaire spécifiée
	        matieres.put(matiere, nouvelleChargeHoraire);
	        
	        filiere.setMatieres(matieres);
	        em.merge(filiere);
	    } else {
	        System.out.println("La filière avec l'ID " + id + " n'existe pas.");
	    }
		
	}

	@Override
	public void modifierFiliere(Filiere filiere) {
		em.merge(filiere);
	}

	@Override
    public boolean existeFiliere(String nomFiliere) {
        // Rechercher une filière avec le même nom
        TypedQuery<Filiere> query = em.createQuery("SELECT f FROM Filiere f WHERE f.nom = :nom", Filiere.class);
        query.setParameter("nom", nomFiliere);
        List<Filiere> result = query.getResultList();
        return !result.isEmpty(); // Retourne true si la filière existe, false sinon
    }

}
