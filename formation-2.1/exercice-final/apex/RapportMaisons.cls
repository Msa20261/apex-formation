// EXERCICE FINAL - RAPPORT DE MAISONS (Apex) - CORRECTION

public class RapportMaisons {

    public static void genererRapport() {

        // ETAPE 1 - SOQL
        // On demande à Salesforce toutes les maisons avec un prix > 0
        // triées du moins cher au plus cher
        List<House__c> maisons = [
            SELECT Name, Price__c, Bedroom__c, City__c
            FROM House__c
            WHERE Price__c > 0
            ORDER BY Price__c ASC
        ];

        // ETAPE 2 - Variables compteurs, toutes initialisées à 0
        Integer totalMaisons      = 0;
        Integer maisonCheres      = 0;
        Integer maisonsAbordables = 0;
        Decimal prixTotal         = 0;

        // ETAPE 3 - Boucle : on parcourt chaque maison de la liste
        System.debug('--- LISTE DES MAISONS ---');

        for (House__c maison : maisons) {

            // A chaque tour on ajoute 1 au total et on additionne le prix
            totalMaisons++;
            prixTotal += maison.Price__c;

            // ETAPE 4 - Condition : on classe chaque maison
            if (maison.Price__c > 300000) {
                maisonCheres++;
                System.debug('CHERE     : ' + maison.Name + ' - ' + maison.Price__c);
            } else {
                maisonsAbordables++;
                System.debug('ABORDABLE : ' + maison.Name + ' - ' + maison.Price__c);
            }
        }

        // ETAPE 5 - On calcule le prix moyen puis on appelle la méthode résumé
        Decimal prixMoyen = prixTotal / totalMaisons;
        afficherResume(totalMaisons, maisonCheres, maisonsAbordables, prixMoyen);
    }

    // Méthode appelée à la fin pour afficher le résumé
    public static void afficherResume(Integer total, Integer cheres, Integer abordables, Decimal prixMoyen) {
        System.debug('--- RÉSUMÉ ---');
        System.debug('Total maisons      : ' + total);
        System.debug('Maisons chères     : ' + cheres);
        System.debug('Maisons abordables : ' + abordables);
        System.debug('Prix moyen         : ' + prixMoyen);
    }
}
