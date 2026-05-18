// ============================================
// EXERCICE 01 - LES VARIABLES (Apex)
// ============================================
// Une variable = une boite qui stocke une valeur
// Syntaxe Apex : TypeDeDonnée nomVariable = valeur;
//
// Complète les lignes marquées TODO
// ============================================

public class Exercice01_Variables {

    public static void run() {

        // --- TODO 1 ---
        // Crée une variable de type String pour le nom de la maison
        // La valeur doit être : 'Villa Soleil'
        String nomMaison = ''; // <-- remplace '' par la valeur

        // --- TODO 2 ---
        // Crée une variable de type Integer pour le nombre de chambres
        // La valeur doit être : 3
        Integer nbChambres = 0; // <-- remplace 0 par la valeur

        // --- TODO 3 ---
        // Crée une variable de type Decimal pour le prix de la maison
        // La valeur doit être : 250000.00
        Decimal prix = 0; // <-- remplace 0 par la valeur

        // --- TODO 4 ---
        // Crée une variable de type Boolean pour savoir si la maison est disponible
        // La valeur doit être : true
        Boolean estDisponible = false; // <-- remplace false par la valeur

        // Ne modifie pas les lignes ci-dessous
        System.debug('Nom : ' + nomMaison);
        System.debug('Chambres : ' + nbChambres);
        System.debug('Prix : ' + prix);
        System.debug('Disponible : ' + estDisponible);
    }
}
