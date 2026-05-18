# Module 2.3 — SOQL : ORDER BY · LIMIT · OFFSET

## Les 3 mots-clés du module

---

### ORDER BY — trier les résultats

```sql
SELECT Name, Price__c
FROM House__c
ORDER BY Price__c ASC
```

- `ASC` = ordre croissant (du moins cher au plus cher) ← par défaut
- `DESC` = ordre décroissant (du plus cher au moins cher)

---

### LIMIT — limiter le nombre de résultats

```sql
SELECT Name
FROM House__c
LIMIT 3
```
→ Renvoie seulement les 3 premiers résultats.

---

### OFFSET — sauter des résultats (pagination)

```sql
SELECT Name
FROM House__c
LIMIT 3
OFFSET 3
```
→ Saute les 3 premiers et renvoie les 3 suivants.
C'est utile pour faire de la **pagination** (page 1, page 2, page 3...).

---

## Ordre des mots-clés dans une requête

```sql
SELECT  champs
FROM    objet
WHERE   condition        ← optionnel
ORDER BY champ ASC/DESC  ← optionnel
LIMIT   nombre           ← optionnel
OFFSET  nombre           ← optionnel
```

---

## Exercice

### Question 1
Récupère toutes les maisons triées par **prix croissant** (du moins cher au plus cher)
```sql
SELECT Name, Price__c
FROM House__c
ORDER BY ???
```

### Question 2
Récupère les maisons triées par **prix décroissant** (du plus cher au moins cher)
```sql
SELECT Name, Price__c
FROM House__c
ORDER BY ??? DESC
```

### Question 3
Récupère les **3 maisons les moins chères**
(combine ORDER BY et LIMIT)
```sql
SELECT Name, Price__c
FROM House__c
ORDER BY ???
LIMIT ???
```

### Question 4
Récupère les maisons **de la position 3 à 5** (saute les 2 premières)
```sql
SELECT Name, Price__c
FROM House__c
ORDER BY Price__c ASC
LIMIT ???
OFFSET ???
```

### Fichier à compléter :
- `exercices/module2_3.soql`
