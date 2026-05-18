# Correction Détaillée — Exercice Final

---

## ETAPE 1 — SOQL : récupérer les maisons

```apex
List<House__c> maisons = [
    SELECT Name, Price__c, Bedroom__c, City__c
    FROM House__c
    WHERE Price__c > 0
    ORDER BY Price__c ASC
];
```

**Explication ligne par ligne :**

| Ligne | Ce qu'elle fait |
|-------|----------------|
| `List<House__c> maisons` | On crée une liste qui va stocker toutes les maisons récupérées |
| `SELECT Name, Price__c, Bedroom__c, City__c` | On choisit les 4 champs qu'on veut lire |
| `FROM House__c` | On lit depuis l'objet House__c |
| `WHERE Price__c > 0` | On prend seulement les maisons qui ont un prix renseigné |
| `ORDER BY Price__c ASC` | On trie du moins cher au plus cher |

> `List<House__c>` = une boite qui contient plusieurs maisons (comme un tableau Excel avec plusieurs lignes)

---

## ETAPE 2 — Variables compteurs

```apex
Integer totalMaisons      = 0;
Integer maisonCheres      = 0;
Integer maisonsAbordables = 0;
Decimal prixTotal         = 0;
```

**Explication :**
- On crée 4 "boites" qui commencent toutes à **0**
- Elles vont s'incrémenter à chaque tour de boucle
- `Integer` = nombre entier (pour compter)
- `Decimal` = nombre décimal (pour les prix)

---

## ETAPE 3 — Boucle for

```apex
for (House__c maison : maisons) {
    totalMaisons++;
    prixTotal += maison.Price__c;
    ...
}
```

**Explication :**

| Ligne | Ce qu'elle fait |
|-------|----------------|
| `for (House__c maison : maisons)` | Pour chaque maison dans la liste `maisons` |
| `totalMaisons++` | Ajoute 1 au compteur (équivalent à `totalMaisons = totalMaisons + 1`) |
| `prixTotal += maison.Price__c` | Ajoute le prix de cette maison au total |

> `maison.Price__c` = on accède au champ `Price__c` de la maison en cours

---

## ETAPE 4 — Condition if/else

```apex
if (maison.Price__c > 300000) {
    maisonCheres++;
    System.debug('CHERE     : ' + maison.Name + ' - ' + maison.Price__c);
} else {
    maisonsAbordables++;
    System.debug('ABORDABLE : ' + maison.Name + ' - ' + maison.Price__c);
}
```

**Explication :**
- Si le prix de **cette maison** est supérieur à 300 000 → on ajoute 1 aux chères
- Sinon → on ajoute 1 aux abordables
- `System.debug(...)` affiche le résultat dans les logs

---

## ETAPE 5 — Calcul et méthode

```apex
Decimal prixMoyen = prixTotal / totalMaisons;
afficherResume(totalMaisons, maisonCheres, maisonsAbordables, prixMoyen);
```

**Explication :**
- Après la boucle, on calcule le prix moyen en divisant le total par le nombre de maisons
- On **appelle** la méthode `afficherResume` en lui passant les 4 valeurs calculées

---

## La méthode afficherResume

```apex
public static void afficherResume(Integer total, Integer cheres, Integer abordables, Decimal prixMoyen) {
    System.debug('Total maisons      : ' + total);
    System.debug('Maisons chères     : ' + cheres);
    System.debug('Maisons abordables : ' + abordables);
    System.debug('Prix moyen         : ' + prixMoyen);
}
```

**Explication :**
- Cette méthode reçoit les 4 valeurs calculées dans la boucle
- Elle les affiche dans les logs proprement
- `void` = la méthode ne retourne rien, elle affiche juste

---

## Pourquoi ce programme est important en Salesforce

Ce pattern (SOQL → boucle → condition → compteurs → résumé) est le **schéma le plus utilisé** en Apex dans les vraies applications Salesforce. Par exemple :
- Mettre à jour le statut de plusieurs enregistrements en masse
- Calculer des totaux sur des opportunités
- Générer des rapports automatiques

---

## Résultat attendu dans les logs

```
--- LISTE DES MAISONS ---
ABORDABLE : Studio Bleu - 95000
ABORDABLE : Maison Rose - 180000
CHERE     : Le Chalet - 320000
CHERE     : Villa Soleil - 450000
CHERE     : Villa Moderne - 610000

--- RÉSUMÉ ---
Total maisons      : 5
Maisons chères     : 3
Maisons abordables : 2
Prix moyen         : 331000
```
