package metier.entities;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "liberation")
public class Liberation implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Identifiant unique pour la libération

    @Column(name = "nom_salle", nullable = false)
    private String nomSalle; // Nom de la salle

    @Column(name = "horaire", nullable = false)
    private String horaire; // Horaire de la réservation

    @Column(name = "date_reservation", nullable = false)
    private java.util.Date dateReservation; // Date de la réservation

    @Column(name = "type_salle", nullable = false)
    private String typeSalle; // Nature de la salle réservée

    @Column(name = "filiere", nullable = false)
    private String filiere; // Filière associée à la réservation

    @Column(name = "type_liberation", nullable = false)
    private String typeLiberation; // Type de la libération (Exceptionnelle ou Définitive)

    @Column(name = "id_prof", nullable = false)
    private Long idProf; // Identifiant du professeur qui a effectué la libération

    // Constructeurs
    public Liberation() {}

    public Liberation(String nomSalle, String horaire, java.util.Date dateReservation, String typeSalle, String filiere, String typeLiberation, Long idProf) {
        this.nomSalle = nomSalle;
        this.horaire = horaire;
        this.dateReservation = dateReservation;
        this.typeSalle = typeSalle;
        this.filiere = filiere;
        this.typeLiberation = typeLiberation;
        this.idProf = idProf;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNomSalle() {
        return nomSalle;
    }

    public void setNomSalle(String nomSalle) {
        this.nomSalle = nomSalle;
    }

    public String getHoraire() {
        return horaire;
    }

    public void setHoraire(String horaire) {
        this.horaire = horaire;
    }

    public java.util.Date getDateReservation() {
        return dateReservation;
    }

    public void setDateReservation(java.util.Date dateReservation) {
        this.dateReservation = dateReservation;
    }

    public String getTypeSalle() {
        return typeSalle;
    }

    public void setTypeSalle(String typeSalle) {
        this.typeSalle = typeSalle;
    }

    public String getFiliere() {
        return filiere;
    }

    public void setFiliere(String filiere) {
        this.filiere = filiere;
    }

    public String getTypeLiberation() {
        return typeLiberation;
    }

    public void setTypeLiberation(String typeLiberation) {
        this.typeLiberation = typeLiberation;
    }

    public Long getIdProf() {
        return idProf;
    }

    public void setIdProf(Long idProf) {
        this.idProf = idProf;
    }
}
