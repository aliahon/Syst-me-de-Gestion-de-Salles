package metier.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Entity
@Table(name = "creneau")
public class Creneau implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Utilisation de Date pour inclure la date et l'heure
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateDebut; // Date et heure de début du créneau

    @Temporal(TemporalType.TIMESTAMP)
    private Date dateFin;   // Date et heure de fin du créneau

    private String matiere; // Matière liée à ce créneau

    @ManyToOne
    @JoinColumn(name = "salle_id", nullable = false)
    private Salle salle; // Salle associée à ce créneau

    @ManyToOne
    @JoinColumn(name = "prof_id", nullable = false)
    private Utilisateur prof; // Professeur associé à ce créneau

    @ManyToOne
    @JoinColumn(name = "filiere_id", nullable = false)
    private Filiere filiere; // Filière associée à ce créneau

    // Constructeurs
    public Creneau() {}

    public Creneau(Date dateDebut, Date dateFin, String matiere, Salle salle, Utilisateur prof, Filiere filiere) {
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.matiere = matiere;
        this.salle = salle;
        this.prof = prof;
        this.filiere = filiere;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public String getMatiere() {
        return matiere;
    }

    public void setMatiere(String matiere) {
        this.matiere = matiere;
    }

    public Salle getSalle() {
        return salle;
    }

    public void setSalle(Salle salle) {
        this.salle = salle;
    }

    public Utilisateur getProf() {
        return prof;
    }

    public void setProf(Utilisateur prof) {
        this.prof = prof;
    }

    public Filiere getFiliere() {
        return filiere;
    }

    public void setFiliere(Filiere filiere) {
        this.filiere = filiere;
    }
}
