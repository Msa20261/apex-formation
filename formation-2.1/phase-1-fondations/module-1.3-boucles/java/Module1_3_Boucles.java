// MODULE 1.3 - LES BOUCLES (Java)
// Complète uniquement les lignes marquées TODO

import java.util.Arrays;
import java.util.List;

public class Module1_3_Boucles {

    public static void main(String[] args) {

        // --- QUESTION 1 : Boucle for sur des nombres ---
        // Affiche les nombres de 1 à 5
        // Syntaxe : for (int i = 1; i <= 5; i++) { ... }

        for (int i = TODO; i <= TODO; i++) {
            System.out.println(i);
        }

        // --- QUESTION 2 : Boucle for sur une liste ---
        // Parcours la liste et affiche chaque nom de maison
        // Syntaxe : for (String nom : maListe) { ... }

        List<String> maisons = Arrays.asList("Villa Soleil", "Maison Rose", "Le Chalet");

        for (String nom : TODO) {
            System.out.println(nom);
        }

        // --- QUESTION 3 : Boucle while ---
        // Affiche le compte à rebours de 3 à 1, puis affiche "Partis !"
        // Syntaxe : while (condition) { ... }

        int compteur = 3;

        while (compteur TODO) {
            System.out.println(compteur);
            compteur--;
        }
        System.out.println("Partis !");
    }
}
