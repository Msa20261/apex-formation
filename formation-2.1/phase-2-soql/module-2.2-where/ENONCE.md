# Module 2.2 — SOQL : WHERE (filtrer les résultats)

## C'est quoi WHERE ?

`WHERE` permet de **filtrer** les résultats.
Au lieu de récupérer TOUTES les maisons, tu récupères seulement celles qui correspondent à un critère.

Sans WHERE → toutes les maisons
Avec WHERE → seulement les maisons chères, ou celles à Paris, etc.

---

## La structure

```sql
SELECT champ1, champ2
FROM ObjetSalesforce
WHERE condition
```

---

## Les opérateurs

| Symbole | Signification | Exemple |
|---------|--------------|---------|
| `=` | égal à | `City__c = 'Paris'` |
| `!=` | différent de | `City__c != 'Paris'` |
| `>` | supérieur à | `Price__c > 300000` |
| `<` | inférieur à | `Price__c < 300000` |
| `>=` | supérieur ou égal | `Bedroom__c >= 3` |
| `<=` | inférieur ou égal | `Price__c <= 500000` |
| `LIKE` | contient | `Name LIKE '%Villa%'` |
| `AND` | et (2 conditions) | `Price__c > 200000 AND Bedroom__c >= 3` |
| `OR` | ou (l'une ou l'autre) | `City__c = 'Paris' OR City__c = 'Lyon'` |

> **Attention :** En SOQL, le texte s'écrit avec des **apostrophes simples** : `'Paris'` pas `"Paris"`

---

## Exercice

Lance chaque requête dans **Developer Console > Query Editor**

### Question 1
Récupère les maisons dont le prix est supérieur à `200000`
```sql
SELECT Name, Price__c
FROM House__c
WHERE ???
```

### Question 2
Récupère les maisons qui ont exactement `3` chambres ou plus
```sql
SELECT Name, Bedroom__c
FROM House__c
WHERE ???
```

### Question 3
Récupère les maisons dont le nom **contient** le mot `House`
```sql
SELECT Name
FROM House__c
WHERE Name LIKE ???
```
> Indice : `LIKE '%House%'` → le `%` veut dire "n'importe quoi avant/après"

### Question 4
Récupère les maisons avec **2 conditions en même temps** :
prix supérieur à `200000` ET au moins `3` chambres
```sql
SELECT Name, Price__c, Bedroom__c
FROM House__c
WHERE ??? AND ???
```

### Fichier à compléter :
- `exercices/module2_2.soql`
