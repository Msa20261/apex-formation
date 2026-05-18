// EXERCICE FINAL - RAPPORT DE MAISONS (Apex)
// Combine : SOQL + Variables + Conditions + Boucles + Méthodes
// Complète uniquement les lignes marquées TODO

public class RapportMaisons {

    public static void genererRapport() {

        // =============================================
        // ETAPE 1 - SOQL : récupérer les maisons
        // (Phase 2 - SELECT + ORDER BY)
        // =============================================

        List<House__c> maisons = [
            SELECT Name, Price__c, Bedroom__c, City__c
            FROM House__c
            WHERE TODO           // récupère seulement les maisons avec un prix > 0
            ORDER BY TODO        // trie par prix croissant
        ];

        // =============================================
        // ETAPE 2 - Variables : compteurs
        // (Phase 1.1)
        // =============================================

        Integer totalMaisons    = TODO;   // commence à 0
        Integer maisonCheres    = TODO;   // commence à 0
        Integer maisonsAbordables = TODO; // commence à 0
        Decimal prixTotal       = TODO;   // commence à 0

        // =============================================
        // ETAPE 3 - Boucle : parcourir chaque maison
        // (Phase 1.3)
        // =============================================

        System.debug('--- LISTE DES MAISONS ---');

        for (House__c maison : TODO) {

            totalMaisons++;
            prixTotal += maison.Price__c;

            // =============================================
            // ETAPE 4 - Condition : classer la maison
            // (Phase 1.2)
            // =============================================

            if (TODO) {
                maisonCheres++;
                System.debug('CHERE     : ' + maison.Name + ' - ' + maison.Price__c);
            } else {
                maisonsAbordables++;
                System.debug('ABORDABLE : ' + maison.Name + ' - ' + maison.Price__c);
            }
        }

        // =============================================
        // ETAPE 5 - Méthode : afficher le résumé
        // (Phase 1.4)
        // =============================================

        Decimal prixMoyen = prixTotal / totalMaisons;
        afficherResume(totalMaisons, maisonCheres, maisonsAbordables, prixMoyen);
    }

    // Méthode qui affiche le résumé final
    public static void afficherResume(Integer total, Integer cheres, Integer abordables, Decimal prixMoyen) {
        System.debug('--- RÉSUMÉ ---');
        System.debug('Total maisons      : ' + TODO);
        System.debug('Maisons chères     : ' + TODO);
        System.debug('Maisons abordables : ' + TODO);
        System.debug('Prix moyen         : ' + TODO);
    }
}
