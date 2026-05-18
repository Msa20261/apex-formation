// MODULE 1.4 - LES METHODES (Apex)
// Complète uniquement les lignes marquées TODO

public class Module1_4_Methodes {

    // --- QUESTION 1 ---
    // Méthode sans paramètre qui affiche un message de bienvenue
    // Complète le corps de la méthode (entre les accolades)

    public static void afficherBienvenue() {
        System.debug(TODO);
    }

    // --- QUESTION 2 ---
    // Méthode avec 2 paramètres : nom (String) et prix (Decimal)
    // Elle affiche : 'Maison : ' + nom + ' | Prix : ' + prix
    // Complète les paramètres et le corps

    public static void afficherMaison(TODO nom, TODO prix) {
        System.debug('Maison : ' + nom + ' | Prix : ' + prix);
    }

    // --- QUESTION 3 ---
    // Méthode qui reçoit un prix et retourne 'Chère' ou 'Abordable'
    // Complète la condition

    public static String categoriserPrix(Decimal prix) {
        if (TODO) {
            return 'Chère';
        } else {
            return 'Abordable';
        }
    }

    // Point d'entrée — ne pas modifier
    public static void run() {
        afficherBienvenue();
        afficherMaison('Villa Soleil', 250000);
        String categorie = categoriserPrix(450000);
        System.debug(categorie);
    }
}
