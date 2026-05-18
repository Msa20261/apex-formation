// MODULE 1.2 - LES CONDITIONS (Java)
// Syntaxe : if (condition) { ... } else { ... }
// Complète uniquement les lignes marquées TODO

public class Module1_2_Conditions {

    public static void main(String[] args) {

        // Les données de la maison (ne pas modifier)
        double prix = 450000;
        int nbChambres = 2;
        String ville = "Paris";

        // --- QUESTION 1 ---
        // Si le prix est supérieur à 300000 → afficher "Maison chère"
        // Sinon → afficher "Maison abordable"

        if (prix > 300000) {
            System.out.println("Maison chère");
        } else {
            System.out.println("Maison abordable");
        }

        // --- QUESTION 2 ---
        // Si nbChambres est supérieur ou égal à 3 → afficher "Grand logement"
        // Sinon → afficher "Petit logement"

        if (nbChambres >= 3) {
            System.out.println("Grand logement");
        } else {
            System.out.println("Petit logement");
        }

        // --- QUESTION 3 ---
        // Si la ville est égale à "Paris" → afficher "Maison à Paris"
        // Sinon → afficher "Maison en province"
        // Attention en Java : pour comparer du texte, utilise .equals() et non ==
        // Exemple : ville.equals("Paris")

        if (ville.equals("Paris")) {
            System.out.println("Maison à Paris");
        } else {
            System.out.println("Maison en province");
        }
    }
}
