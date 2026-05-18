# Module 1.4 — Les Méthodes / Fonctions

## C'est quoi une méthode ?

Une méthode c'est un **bloc de code qui fait une tâche précise**.
Tu lui donnes un nom, et tu peux l'appeler autant de fois que tu veux.

Sans méthode :
```
afficher "Bonjour Villa Soleil, prix : 250000"
afficher "Bonjour Maison Rose, prix : 180000"
afficher "Bonjour Le Chalet, prix : 320000"
```

Avec une méthode :
```
def afficherMaison(nom, prix):
    afficher "Bonjour " + nom + ", prix : " + prix

afficherMaison("Villa Soleil", 250000)
afficherMaison("Maison Rose", 180000)
afficherMaison("Le Chalet", 320000)
```

---

## Les 2 types de méthodes

### 1. Méthode sans retour (void) — elle fait une action, ne renvoie rien
```
afficherMaison("Villa Soleil", 250000)
→ affiche quelque chose mais ne renvoie rien
```

### 2. Méthode avec retour — elle calcule et renvoie un résultat
```
categoriserPrix(250000)
→ renvoie "Abordable" ou "Chère"
```

---

## La syntaxe

### Apex
```apex
// Sans retour (void)
public static void nomMethode(Type parametre) {
    // action
}

// Avec retour
public static String nomMethode(Decimal prix) {
    return 'resultat';
}
```

### Python
```python
# Sans retour
def nom_methode(parametre):
    # action

# Avec retour
def nom_methode(prix):
    return 'resultat'
```

### Java
```java
// Sans retour (void)
public static void nomMethode(Type parametre) {
    // action
}

// Avec retour
public static String nomMethode(double prix) {
    return "resultat";
}
```

---

## Exercice

### Question 1 — Méthode sans paramètre
Crée une méthode `afficherBienvenue()` qui affiche :
```
Bienvenue dans l'application Maisons !
```

### Question 2 — Méthode avec paramètres
Crée une méthode `afficherMaison(nom, prix)` qui affiche :
```
Maison : Villa Soleil | Prix : 250000
```

### Question 3 — Méthode avec retour
Crée une méthode `categoriserPrix(prix)` qui :
- Retourne `"Chère"` si le prix est supérieur à 300000
- Retourne `"Abordable"` sinon

Puis appelle la méthode avec le prix `450000` et affiche le résultat.

### Fichiers à compléter :
- `apex/Module1_4_Methodes.cls`
- `python/module1_4_methodes.py`
- `java/Module1_4_Methodes.java`
