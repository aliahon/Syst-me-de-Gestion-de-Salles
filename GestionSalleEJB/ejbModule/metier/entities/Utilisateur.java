package metier.entities;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@Table(name = "utilisateur")
public class Utilisateur implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;

    private String email;

    private String password;

    private String role; // Le rôle de l'utilisateur (par exemple : "professeur", "admin", "coordinateur")

    // Constructeurs
    public Utilisateur() {}

    public Utilisateur(String nom, String email, String password, String role) {
        this.nom = nom;
        this.email = email;
        this.password = password;
        this.role = role;
    }

    // Getters et Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
