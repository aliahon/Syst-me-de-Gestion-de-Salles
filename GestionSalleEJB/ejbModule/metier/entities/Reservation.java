package metier.entities;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "reservation")
public class Reservation implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Identifiant unique pour la réservation

    @ManyToOne
    @JoinColumn(name = "filiere_id", nullable = false)
    private Filiere filiere; // Filière associée à la réservation

    @ManyToOne
    @JoinColumn(name = "creneau_reserve_id", nullable = false)
    private Creneau creneauReserve; // Creneau réservé (relation ManyToOne)

    @ManyToOne
    @JoinColumn(name = "prof_id", nullable = false)
    private Utilisateur prof; // Professeur ayant effectué la réservation

    private String statut; // Statut de la réservation (par exemple : "confirmée", "en attente", "annulée")

    // Constructeurs
    public Reservation() {}

    public Reservation(Filiere filiere, Creneau creneauReserve, Utilisateur prof, String statut) {
        this.filiere = filiere;
        this.creneauReserve = creneauReserve;
        this.prof = prof;
        this.statut = statut;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Filiere getFiliere() {
        return filiere;
    }

    public void setFiliere(Filiere filiere) {
        this.filiere = filiere;
    }

    public Creneau getCreneauReserve() {
        return creneauReserve;
    }

    public void setCreneauReserve(Creneau creneauReserve) {
        this.creneauReserve = creneauReserve;
    }

    public Utilisateur getProf() {
        return prof;
    }

    public void setProf(Utilisateur prof) {
        this.prof = prof;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }
}
