# Module 2.1 — SOQL : SELECT basique

## C'est quoi SOQL ?

SOQL = **Salesforce Object Query Language**
C'est le langage pour **lire des données** dans Salesforce.

C'est comme poser une question à ta base de données :
> "Donne-moi tous les noms et villes de mes maisons"

---

## Comment lancer une requête SOQL

1. Dans Salesforce, clique sur l'icône **engrenage** (roue crantée) en haut à droite
2. Clique sur **Developer Console**
3. En bas, clique sur l'onglet **Query Editor**
4. Tape ta requête et clique sur **Execute**

---

## La structure d'une requête SOQL

```sql
SELECT champ1, champ2
FROM ObjetSalesforce
```

- `SELECT` → les champs que tu veux lire (les colonnes)
- `FROM` → l'objet Salesforce où se trouvent les données (la table)

### Exemple
```sql
SELECT Name, City__c
FROM House__c
```
→ Lit le nom et la ville de toutes les maisons

---

## Les champs de l'objet House__c

| Champ | Type | Description |
|-------|------|-------------|
| `Id` | ID | Identifiant unique |
| `Name` | Texte | Nom de la maison |
| `Address__c` | Texte | Adresse |
| `City__c` | Texte | Ville |
| `State__c` | Texte | Région / Etat |
| `Zip__c` | Texte | Code postal |
| `Price__c` | Nombre | Prix |
| `Bedroom__c` | Nombre | Nombre de chambres |
| `Bathrooms__c` | Nombre | Nombre de salles de bain |

---

## Exercice

Lance chaque requête **une par une** dans le Query Editor.
**Attention :** copie seulement la ligne SELECT et FROM, pas les commentaires `--`

### Question 1
Récupère uniquement le **nom** de toutes les maisons.
```sql
SELECT ???
FROM House__c
```

### Question 2
Récupère le **nom** et la **ville** de toutes les maisons.
```sql
SELECT ???, ???
FROM House__c
```

### Question 3
Récupère **5 champs** : `Name`, `City__c`, `Price__c`, `Bedroom__c`, `Bathrooms__c`
```sql
SELECT ???
FROM House__c
```

### Question 4
Récupère **tous ces champs** et limite à **5 résultats** seulement.
```sql
SELECT Name, City__c, Price__c, Bedroom__c, Bathrooms__c
FROM House__c
LIMIT ???
```

### Fichier à compléter :
- `exercices/module2_1.soql`
