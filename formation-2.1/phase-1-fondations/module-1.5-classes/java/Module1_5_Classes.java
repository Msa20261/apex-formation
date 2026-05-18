// MODULE 1.5 - UTILISATION DE LA CLASSE (Java)
// Ce fichier crée des objets Maison et appelle leurs méthodes
// Complète uniquement les lignes marquées TODO

public class Module1_5_Classes {

    public static void main(String[] args) {

        // --- QUESTION 4 : Créer 2 objets Maison ---
        // Syntaxe : Maison m = new Maison(nom, prix, ville);

        // Crée la première maison : "Villa Soleil", 450000, "Paris"
        Maison maison1 = new Maison(TODO, TODO, TODO);

        // Crée la deuxième maison : "Maison Rose", 180000, "Lyon"
        Maison maison2 = new Maison(TODO, TODO, TODO);

        // Ne pas modifier les lignes ci-dessous
        maison1.afficher();
        System.out.println(maison1.categoriser());

        maison2.afficher();
        System.out.println(maison2.categoriser());
    }
}
