package metier.entities;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "salle")
public class Salle implements Serializable {

    @Id
    private String id; // Utilisation d'un identifiant de type String

    private String localisation; // Localisation de la salle

    private long nbplace; // Nombre de places dans la salle

    @Enumerated(EnumType.STRING)
    private NatureSalle nature;


    private boolean disponibilite; // Disponibilité de la salle (true si disponible, false sinon)

    // Constructeurs
    public Salle() {}

    public Salle(String id, String localisation, long nbplace, NatureSalle nature, boolean disponibilite) {
        this.id = id;
        this.localisation = localisation;
        this.nbplace = nbplace;
        this.nature = nature;
        this.disponibilite = disponibilite;
    }

    // Getters et Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getLocalisation() {
        return localisation;
    }

    public void setLocalisation(String localisation) {
        this.localisation = localisation;
    }

    public long getNbplace() {
        return nbplace;
    }

    public void setNbplace(long nbplace) {
        this.nbplace = nbplace;
    }

    public NatureSalle getNature() {
        return nature;
    }

    public void setNature(NatureSalle nature) {
        this.nature = nature;
    }

    public boolean isDisponibilite() {
        return disponibilite;
    }

    public void setDisponibilite(boolean disponibilite) {
        this.disponibilite = disponibilite;
    }
}
