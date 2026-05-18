// MODULE 1.5 - LA CLASSE Maison (Apex)
// Complète uniquement les lignes marquées TODO

public class Maison {

    // --- QUESTION 1 : Les attributs ---
    // Déclare 3 attributs publics : nom (String), prix (Decimal), ville (String)
    public String nom;
    public Decimal prix;
    public String ville;

    // --- QUESTION 2 : Le constructeur ---
    // Stocke les valeurs reçues dans les attributs avec this.
    public Maison(String nom, Decimal prix, String ville) {
        this.nom   = nom;
        this.prix  = prix;
        this.ville = ville;
    }

    // --- QUESTION 3a : Méthode afficher ---
    // Affiche : 'Maison : ' + nom + ' | Prix : ' + prix + ' | Ville : ' + ville
    public void afficher() {
        System.debug('Maison : ' + nom + ' | Prix : ' + prix + ' | Ville : ' + ville);
    }

    // --- QUESTION 3b : Méthode categoriser ---
    // Retourne 'Chère' si prix > 300000, sinon 'Abordable'
    public String categoriser() {
        if (prix > 300000) {
            return 'Chère';
        } else {
            return 'Abordable';
        }
    }
}
