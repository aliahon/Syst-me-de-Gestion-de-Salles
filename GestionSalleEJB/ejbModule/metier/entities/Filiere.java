package metier.entities;

import java.io.Serializable;
import java.util.*;
import javax.persistence.*;

@Entity
@Table(name = "filiere") // Nom explicite pour la table
public class Filiere implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    private String id;

    private String nom;

    private long effectif;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(
        name = "filiere_matieres", // Nom de la table d'association
        joinColumns = @JoinColumn(name = "filiere_id") // Clé étrangère vers Filiere
    )
    @MapKeyColumn(name = "matiere_nom") // Clé pour la Map (nom de la matière)
    @Column(name = "charge_horaire") // Valeur de la Map (charge horaire)
    private Map<String, Integer> matieres = new HashMap<>();

    @OneToMany(mappedBy = "filiere", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.EAGER)
    private List<Creneau> emploiDuTemps = new ArrayList<>();

    // Constructeur par défaut
    public Filiere() {
    }

    // Getters et Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public long getEffectif() {
        return effectif;
    }

    public void setEffectif(long effectif) {
        this.effectif = effectif;
    }

    public Map<String, Integer> getMatieres() {
        return matieres;
    }

    public void setMatieres(Map<String, Integer> matieres) {
        this.matieres = matieres;
    }

    public List<Creneau> getEmploiDuTemps() {
        return emploiDuTemps;
    }

    public void setEmploiDuTemps(List<Creneau> emploiDuTemps) {
        this.emploiDuTemps = emploiDuTemps;
    }
 // Nouvelle méthode pour calculer la charge horaire totale
    public int getChargeHoraireTotale() {
        return matieres.values().stream().mapToInt(Integer::intValue).sum();
    }

    // Nouvelle méthode pour récupérer les noms des matières séparés par des virgules
    public String getNomsMatieres() {
        return String.join(", ", matieres.keySet());
    }
}
