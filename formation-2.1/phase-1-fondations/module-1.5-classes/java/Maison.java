// MODULE 1.5 - LA CLASSE Maison (Java)
// Complète uniquement les lignes marquées TODO

public class Maison {

    // --- QUESTION 1 : Les attributs ---
    // Déclare 3 attributs : nom (String), prix (double), ville (String)
    TODO nom;
    TODO prix;
    TODO ville;

    // --- QUESTION 2 : Le constructeur ---
    // Stocke les valeurs reçues dans les attributs avec this.
    public Maison(String nom, double prix, String ville) {
        this.nom   = TODO;
        this.prix  = TODO;
        this.ville = TODO;
    }

    // --- QUESTION 3a : Méthode afficher ---
    // Affiche : "Maison : " + nom + " | Prix : " + prix + " | Ville : " + ville
    public void afficher() {
        System.out.println(TODO);
    }

    // --- QUESTION 3b : Méthode categoriser ---
    // Retourne "Chère" si prix > 300000, sinon "Abordable"
    public String categoriser() {
        if (TODO) {
            return "Chère";
        } else {
            return "Abordable";
        }
    }
}
