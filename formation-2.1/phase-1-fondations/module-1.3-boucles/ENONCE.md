# Module 1.3 — Les Boucles (for / while)

## C'est quoi une boucle ?

Une boucle permet de **répéter une action** plusieurs fois sans réécrire le code.

Sans boucle :
```
afficher "Maison 1"
afficher "Maison 2"
afficher "Maison 3"
```

Avec une boucle :
```
Pour chaque maison dans la liste
    → afficher le nom
```

---

## 2 types de boucles

### La boucle FOR — quand tu sais combien de fois répéter

**Apex / Java :**
```
for (Integer i = 1; i <= 5; i++) {
    // action répétée 5 fois
}
```
- `i = 1` → on commence à 1
- `i <= 5` → on continue tant que i est inférieur ou égal à 5
- `i++` → on ajoute 1 à chaque tour

**Python :**
```
for i in range(1, 6):
    # action répétée 5 fois
```
- `range(1, 6)` → de 1 à 5 (le 6 est exclu)

---

### La boucle WHILE — quand tu répètes tant qu'une condition est vraie

```
while (condition) {
    // action répétée tant que condition est vraie
}
```

---

## Exercice

### Question 1 — Boucle for sur des nombres
Affiche les nombres de 1 à 5 avec une boucle for.

Résultat attendu :
```
1
2
3
4
5
```

### Question 2 — Boucle for sur une liste
Tu as une liste de 3 noms de maisons. Parcours-la et affiche chaque nom.

Liste : `["Villa Soleil", "Maison Rose", "Le Chalet"]`

Résultat attendu :
```
Villa Soleil
Maison Rose
Le Chalet
```

### Question 3 — Boucle while
Affiche un compte à rebours de 3 à 1, puis affiche "Partis !"

Résultat attendu :
```
3
2
1
Partis !
```

### Fichiers à compléter :
- `apex/Module1_3_Boucles.cls`
- `python/module1_3_boucles.py`
- `java/Module1_3_Boucles.java`
- `soql/module1_3.soql`
