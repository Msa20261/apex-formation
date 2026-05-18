// MODULE 1.4 - LES METHODES (Java)
// Complète uniquement les lignes marquées TODO

public class Module1_4_Methodes {

    // --- QUESTION 1 ---
    // Méthode sans paramètre qui affiche un message de bienvenue
    // Complète le corps de la méthode

    public static void afficherBienvenue() {
        System.out.println("Bienvenue dans l'application Maisons !");
    }

    // --- QUESTION 2 ---
    // Méthode avec 2 paramètres : nom (String) et prix (double)
    // Elle affiche : "Maison : " + nom + " | Prix : " + prix
    // Complète les paramètres

    public static void afficherMaison(String nom, double prix) {
        System.out.println("Maison : " + nom + " | Prix : " + prix);
    }

    // --- QUESTION 3 ---
    // Méthode qui reçoit un prix et retourne "Chère" ou "Abordable"
    // Complète la condition

    public static String categoriserPrix(double prix) {
        if (prix > 300000) {
            return "Chère";
        } else {
            return "Abordable";
        }
    }

    // Point d'entrée — ne pas modifier
    public static void main(String[] args) {
        afficherBienvenue();
        afficherMaison("Villa Soleil", 250000);
        String categorie = categoriserPrix(450000);
        System.out.println(categorie);
    }
}
