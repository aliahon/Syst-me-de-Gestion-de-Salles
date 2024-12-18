package metier.entities;

public enum Horaire {
    HORAIRE_1("08:30 - 10:20"),
    HORAIRE_2("10:40 - 12:30"),
    HORAIRE_3("14:30 - 16:20"),
    HORAIRE_4("16:40 - 18:30");

    private final String horaire;

    // Constructeur pour initialiser la valeur de chaque horaire
    Horaire(String horaire) {
        this.horaire = horaire;
    }

    // Méthode pour obtenir la valeur de l'horaire
    public String getHoraire() {
        return horaire;
    }
}
