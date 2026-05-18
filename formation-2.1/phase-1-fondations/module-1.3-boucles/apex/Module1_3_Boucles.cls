// MODULE 1.3 - LES BOUCLES (Apex)
// Complète uniquement les lignes marquées TODO

public class Module1_3_Boucles {

    public static void run() {

        // --- QUESTION 1 : Boucle for sur des nombres ---
        // Affiche les nombres de 1 à 5
        // Syntaxe : for (Integer i = 1; i <= 5; i++) { ... }

        for (Integer i = TODO; i <= TODO; i++) {
            System.debug(i);
        }

        // --- QUESTION 2 : Boucle for sur une liste ---
        // Parcours la liste et affiche chaque nom de maison
        // Syntaxe : for (String nom : maListe) { ... }

        List<String> maisons = new List<String>{'Villa Soleil', 'Maison Rose', 'Le Chalet'};

        for (String nom : TODO) {
            System.debug(nom);
        }

        // --- QUESTION 3 : Boucle while ---
        // Affiche le compte à rebours de 3 à 1, puis affiche 'Partis !'
        // Syntaxe : while (condition) { ... }

        Integer compteur = 3;

        while (compteur TODO) {
            System.debug(compteur);
            compteur--;
        }
        System.debug('Partis !');
    }
}
