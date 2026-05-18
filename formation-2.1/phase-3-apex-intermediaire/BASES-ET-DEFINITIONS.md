# Phase 3 — Apex Intermédiaire : Bases et Définitions

---

## Module 3.1 — Les Collections (List, Set, Map)

### C'est quoi une collection ?

Une collection c'est une **variable qui peut stocker plusieurs valeurs** à la fois.

Jusqu'ici tu as appris :
```apex
String nomMaison = 'Villa Soleil';  // 1 seule valeur
```

Avec une collection tu peux stocker **plusieurs valeurs dans une seule variable** :
```apex
List<String> nomsMailsons = new List<String>{'Villa Soleil', 'Maison Rose', 'Le Chalet'};
```

---

### Les 3 types de collections en Apex

---

#### LIST — une liste ordonnée (comme un tableau)

> Imagine une liste de courses : chaque élément a un numéro de position (0, 1, 2...)

```apex
List<String> maisons = new List<String>{'Villa Soleil', 'Maison Rose', 'Le Chalet'};

// Accéder à un élément par sa position (commence à 0)
System.debug(maisons[0]);  // → Villa Soleil
System.debug(maisons[1]);  // → Maison Rose

// Ajouter un élément
maisons.add('Studio Bleu');

// Compter les éléments
System.debug(maisons.size());  // → 4
```

**Quand l'utiliser ?** Toujours — c'est la collection la plus utilisée en Apex, notamment pour stocker les résultats d'une requête SOQL.

---

#### SET — une liste sans doublons

> Imagine un sac de billes : tu ne peux pas avoir 2 billes identiques

```apex
Set<String> villes = new Set<String>{'Paris', 'Lyon', 'Paris'};
// Salesforce ignore automatiquement le doublon
// → le Set contient : {Paris, Lyon}

// Vérifier si une valeur existe
System.debug(villes.contains('Paris'));  // → true
System.debug(villes.contains('Nice'));   // → false
```

**Quand l'utiliser ?** Quand tu veux éviter les doublons, ou vérifier rapidement si une valeur existe dans une liste.

---

#### MAP — une liste clé → valeur (comme un dictionnaire)

> Imagine un annuaire : tu cherches un nom (la clé) et tu trouves son numéro (la valeur)

```apex
Map<String, Decimal> prixMaisons = new Map<String, Decimal>();
prixMaisons.put('Villa Soleil', 450000);
prixMaisons.put('Maison Rose',  180000);

// Récupérer une valeur par sa clé
Decimal prix = prixMaisons.get('Villa Soleil');
System.debug(prix);  // → 450000

// Vérifier si une clé existe
System.debug(prixMaisons.containsKey('Maison Rose'));  // → true
```

**Quand l'utiliser ?** Quand tu veux associer 2 informations ensemble (Id → Enregistrement, Nom → Prix, etc.)

---

### Tableau comparatif

| Collection | Doublons | Ordre | Accès par |
|------------|----------|-------|-----------|
| `List` | Oui | Oui (position) | Index : `[0]`, `[1]`... |
| `Set` | Non | Non | `contains()` |
| `Map` | Non (clés) | Non | Clé : `get('nom')` |

---

## Module 3.2 — Les Triggers

### C'est quoi un Trigger ?

Un Trigger c'est un **programme qui se déclenche automatiquement** quand quelque chose se passe dans Salesforce.

> Imagine une alarme : quand quelqu'un ouvre la porte (événement) → l'alarme sonne (action automatique)

Exemples concrets :
- Quand une maison est créée → envoyer un email automatiquement
- Quand le prix d'une maison est modifié → mettre à jour un champ de catégorie
- Quand une maison est supprimée → archiver les données

---

### Les événements d'un Trigger

| Événement | Quand ça se déclenche |
|-----------|----------------------|
| `before insert` | Avant qu'un enregistrement soit créé |
| `after insert` | Après qu'un enregistrement soit créé |
| `before update` | Avant qu'un enregistrement soit modifié |
| `after update` | Après qu'un enregistrement soit modifié |
| `before delete` | Avant qu'un enregistrement soit supprimé |
| `after delete` | Après qu'un enregistrement soit supprimé |

---

### La structure d'un Trigger

```apex
trigger NomDuTrigger on ObjetSalesforce (événement) {
    // code qui s'exécute automatiquement
}
```

Exemple simple :
```apex
trigger HouseTrigger on House__c (before insert) {
    // Ce code s'exécute AVANT chaque création de maison
    for (House__c maison : Trigger.new) {
        if (maison.Price__c == null) {
            maison.Price__c = 0;  // Prix à 0 si non renseigné
        }
    }
}
```

---

### Trigger.new et Trigger.old

| Variable | Contient |
|----------|---------|
| `Trigger.new` | Les enregistrements avec leurs **nouvelles** valeurs |
| `Trigger.old` | Les enregistrements avec leurs **anciennes** valeurs (update/delete) |

---

## Module 3.3 — La Bulkification

### C'est quoi la Bulkification ?

En Salesforce, quand tu importes 500 maisons en une fois, le Trigger se déclenche **une seule fois** pour les 500 maisons — pas 500 fois.

La **bulkification** c'est écrire du code qui sait traiter **plusieurs enregistrements à la fois** (et pas un par un).

---

### Mauvais code (non-bulkifié) ❌

```apex
trigger HouseTrigger on House__c (after insert) {
    for (House__c maison : Trigger.new) {
        // ERREUR : une requête SOQL dans une boucle = danger !
        List<House__c> autres = [SELECT Id FROM House__c WHERE City__c = :maison.City__c];
    }
}
```
> Si tu insères 200 maisons → 200 requêtes SOQL → Salesforce bloque (Governor Limit !)

---

### Bon code (bulkifié) ✅

```apex
trigger HouseTrigger on House__c (after insert) {
    // On fait UNE SEULE requête SOQL en dehors de la boucle
    Set<String> villes = new Set<String>();
    for (House__c maison : Trigger.new) {
        villes.add(maison.City__c);
    }
    List<House__c> autres = [SELECT Id FROM House__c WHERE City__c IN :villes];
}
```
> 1 seule requête SOQL peu importe le nombre de maisons = parfait !

**Règle d'or : jamais de requête SOQL dans une boucle.**

---

## Module 3.4 — La Gestion des Erreurs (try / catch)

### C'est quoi ?

Le `try/catch` permet de **gérer les erreurs** sans que le programme plante.

> Imagine que tu essaies d'ouvrir une porte. Si elle est fermée (erreur) → tu cherches la clé (solution) au lieu de rester bloqué.

```apex
try {
    // Code qui pourrait provoquer une erreur
    Decimal resultat = 100 / 0;  // Division par zéro = erreur !

} catch (Exception e) {
    // Ce code s'exécute si une erreur se produit
    System.debug('Erreur : ' + e.getMessage());
}
```

---

### Les types d'erreurs (Exceptions)

| Type | Quand ça arrive |
|------|----------------|
| `DmlException` | Erreur lors d'une insertion/modification Salesforce |
| `QueryException` | Requête SOQL qui retourne trop de résultats |
| `NullPointerException` | Tu utilises une variable qui est null (vide) |
| `Exception` | Attrape toutes les erreurs (à utiliser en dernier recours) |

---

## Module 3.5 — Les Governor Limits

### C'est quoi ?

Salesforce est un service partagé par des millions d'entreprises. Pour que personne ne monopolise les ressources, Salesforce impose des **limites strictes** appelées Governor Limits.

---

### Les limites les plus importantes

| Limite | Maximum autorisé |
|--------|-----------------|
| Requêtes SOQL par transaction | **100 requêtes** |
| Enregistrements retournés par SOQL | **50 000 lignes** |
| Instructions DML (insert/update) | **150 opérations** |
| Mémoire utilisée | **6 MB** |
| Temps d'exécution CPU | **10 secondes** |

---

### Comment éviter de dépasser les limites

| Mauvaise pratique ❌ | Bonne pratique ✅ |
|---------------------|-----------------|
| SOQL dans une boucle | SOQL avant la boucle |
| Insérer enregistrement par enregistrement | Insérer une liste entière |
| SELECT * sans LIMIT | Toujours préciser les champs et LIMIT |

---

### Vérifier les limites dans le code

```apex
// Combien de requêtes SOQL reste-t-il ?
System.debug('SOQL restant : ' + Limits.getLimitQueries() - Limits.getQueries());
```

---

## Résumé des 5 concepts

| Concept | En une phrase |
|---------|--------------|
| **List** | Une liste ordonnée qui accepte les doublons |
| **Set** | Une liste sans doublons |
| **Map** | Un dictionnaire clé → valeur |
| **Trigger** | Code qui se déclenche automatiquement sur un événement Salesforce |
| **Bulkification** | Écrire du code qui traite 200 enregistrements aussi bien qu'un seul |
| **Try/Catch** | Gérer les erreurs sans planter le programme |
| **Governor Limits** | Les limites imposées par Salesforce à respecter obligatoirement |
