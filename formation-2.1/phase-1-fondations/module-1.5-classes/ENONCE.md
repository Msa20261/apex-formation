# Module 1.5 — Les Classes

## C'est quoi une classe ?

Une classe c'est un **modèle** pour créer des objets.
Pense à un moule à gâteau : le moule = la classe, le gâteau = l'objet.

Exemple : la classe `Maison` est le modèle.
Ensuite tu crées autant de maisons que tu veux à partir de ce modèle.

```
Classe Maison
  → attributs : nom, prix, ville
  → méthodes  : afficher(), categoriser()

maison1 = nouvelle Maison("Villa Soleil", 450000, "Paris")
maison2 = nouvelle Maison("Maison Rose",  180000, "Lyon")
```

---

## Les 3 parties d'une classe

### 1. Les attributs — les données de la classe
```
String nom
Decimal prix
String ville
```

### 2. Le constructeur — pour créer un objet
C'est une méthode spéciale appelée automatiquement quand tu crées un objet.
```
Maison(nom, prix, ville) {
    this.nom   = nom
    this.prix  = prix
    this.ville = ville
}
```
> `this` = "cette instance de la classe"

### 3. Les méthodes — les actions de la classe
```
afficher() → affiche les infos de la maison
categoriser() → retourne "Chère" ou "Abordable"
```

---

## La syntaxe

### Apex
```apex
public class Maison {
    public String  nom;
    public Decimal prix;
    public String  ville;

    public Maison(String nom, Decimal prix, String ville) {
        this.nom   = nom;
        this.prix  = prix;
        this.ville = ville;
    }

    public void afficher() {
        System.debug(nom + ' - ' + prix + ' - ' + ville);
    }
}
```

### Python
```python
class Maison:
    def __init__(self, nom, prix, ville):
        self.nom   = nom
        self.prix  = prix
        self.ville = ville

    def afficher(self):
        print(self.nom + " - " + str(self.prix) + " - " + self.ville)
```

### Java
```java
public class Maison {
    String nom;
    double prix;
    String ville;

    public Maison(String nom, double prix, String ville) {
        this.nom   = nom;
        this.prix  = prix;
        this.ville = ville;
    }

    public void afficher() {
        System.out.println(nom + " - " + prix + " - " + ville);
    }
}
```

---

## Exercice

### Question 1 — Créer la classe
Crée une classe `Maison` avec 3 attributs : `nom`, `prix`, `ville`

### Question 2 — Le constructeur
Ajoute un constructeur qui reçoit `nom`, `prix` et `ville` et les stocke avec `this`

### Question 3 — Les méthodes
Ajoute 2 méthodes :
- `afficher()` → affiche : `"Maison : nom | Prix : prix | Ville : ville"`
- `categoriser()` → retourne `"Chère"` si prix > 300000, sinon `"Abordable"`

### Question 4 — Créer des objets
Crée 2 maisons et appelle leurs méthodes :
- `"Villa Soleil"`, `450000`, `"Paris"`
- `"Maison Rose"`, `180000`, `"Lyon"`

### Fichiers à compléter :
- `apex/Maison.cls` + `apex/Module1_5_Classes.cls`
- `python/module1_5_classes.py`
- `java/Maison.java` + `java/Module1_5_Classes.java`

---

## Résultat attendu
```
Maison : Villa Soleil | Prix : 450000 | Ville : Paris
Chère
Maison : Maison Rose | Prix : 180000 | Ville : Lyon
Abordable
```
