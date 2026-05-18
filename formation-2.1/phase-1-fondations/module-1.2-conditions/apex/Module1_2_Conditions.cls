// MODULE 1.2 - LES CONDITIONS (Apex)
// Syntaxe : if (condition) { ... } else { ... }
// Complète uniquement les lignes marquées TODO

public class Module1_2_Conditions {

    public static void run() {

        // Les données de la maison (ne pas modifier)
        Decimal prix = 450000;
        Integer nbChambres = 2;
        String ville = 'Paris';

        // --- QUESTION 1 ---
        // Si le prix est supérieur à 300000 → afficher 'Maison chère'
        // Sinon → afficher 'Maison abordable'

        if (TODO) {
            System.debug('Maison chère');
        } else {
            System.debug('Maison abordable');
        }

        // --- QUESTION 2 ---
        // Si nbChambres est supérieur ou égal à 3 → afficher 'Grand logement'
        // Sinon → afficher 'Petit logement'

        if (TODO) {
            System.debug('Grand logement');
        } else {
            System.debug('Petit logement');
        }

        // --- QUESTION 3 ---
        // Si la ville est égale à 'Paris' → afficher 'Maison à Paris'
        // Sinon → afficher 'Maison en province'

        if (TODO) {
            System.debug('Maison à Paris');
        } else {
            System.debug('Maison en province');
        }
    }
}
