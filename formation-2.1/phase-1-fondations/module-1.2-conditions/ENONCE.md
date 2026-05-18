# Module 1.2 — Les Conditions (if / else)

## C'est quoi une condition ?

Une condition permet à ton programme de **prendre une décision**.
Si quelque chose est vrai → il fait une action.
Sinon → il fait une autre action.

```
SI le prix est supérieur à 300 000
    → afficher "Maison chère"
SINON
    → afficher "Maison abordable"
```

---

## La syntaxe dans les 3 langages

### Apex et Java (syntaxe identique)
```
if (condition) {
    // ce qu'on fait si c'est vrai
} else {
    // ce qu'on fait si c'est faux
}
```

### Python
```
if condition:
    # ce qu'on fait si c'est vrai
else:
    # ce qu'on fait si c'est faux
```

---

## Les opérateurs de comparaison

| Symbole | Signification | Exemple |
|---------|--------------|---------|
| `>` | supérieur à | `prix > 300000` |
| `<` | inférieur à | `prix < 300000` |
| `>=` | supérieur ou égal | `prix >= 300000` |
| `<=` | inférieur ou égal | `prix <= 300000` |
| `==` | égal à | `ville == 'Paris'` |
| `!=` | différent de | `ville != 'Paris'` |

---

## Exercice

Tu as une maison avec ces données :
- Prix : `450000`
- Nombre de chambres : `2`
- Ville : `'Paris'`

Tu dois écrire des conditions pour :

**Question 1** — Si le prix est supérieur à `300000`, afficher `"Maison chère"`, sinon afficher `"Maison abordable"`

**Question 2** — Si le nombre de chambres est supérieur ou égal à `3`, afficher `"Grand logement"`, sinon afficher `"Petit logement"`

**Question 3** — Si la ville est égale à `'Paris'`, afficher `"Maison à Paris"`, sinon afficher `"Maison en province"`

### Fichiers à compléter :
- `apex/Module1_2_Conditions.cls`
- `python/module1_2_conditions.py`
- `java/Module1_2_Conditions.java`
- `soql/module1_2.soql`

---

## Résultat attendu

```
Maison chère
Petit logement
Maison à Paris
```
