# Phase 3 — Théorie Approfondie

---

# MODULE 3.1 — LES COLLECTIONS

## Pourquoi les collections existent-elles ?

Imagine que tu dois stocker le nom de 100 maisons.
Sans collection tu écrirais :
```apex
String maison1 = 'Villa Soleil';
String maison2 = 'Maison Rose';
String maison3 = 'Le Chalet';
// ... 97 autres lignes
```
C'est impossible. Avec une collection :
```apex
List<String> maisons = new List<String>{'Villa Soleil', 'Maison Rose', 'Le Chalet'};
// Une seule variable pour 100 maisons
```

---

## LA LIST

### Analogie
Pense à une **liste de courses** écrite sur un papier.
- Chaque élément est numéroté (position 0, 1, 2...)
- Tu peux avoir le même article deux fois
- L'ordre est important

```
Position 0 → Lait
Position 1 → Pain
Position 2 → Lait  (doublon accepté)
```

### En Apex
```apex
// Créer une List vide
List<String> maisons = new List<String>();

// Créer une List avec des valeurs
List<String> maisons = new List<String>{'Villa Soleil', 'Maison Rose', 'Le Chalet'};

// Ajouter un élément à la fin
maisons.add('Studio Bleu');

// Accéder à un élément (ATTENTION : commence à 0, pas à 1 !)
System.debug(maisons[0]);  // → Villa Soleil  (1ère position)
System.debug(maisons[1]);  // → Maison Rose   (2ème position)
System.debug(maisons[3]);  // → Studio Bleu   (4ème position)

// Modifier un élément
maisons[0] = 'Villa Jaune';

// Supprimer un élément
maisons.remove(0);  // supprime le 1er élément

// Savoir combien d'éléments il y a
Integer nombre = maisons.size();  // → 3

// Vérifier si la liste est vide
Boolean estVide = maisons.isEmpty();  // → false
```

### Cas d'usage réel en Salesforce
```apex
// Récupérer toutes les maisons depuis Salesforce dans une List
List<House__c> toutesLesMaisons = [SELECT Name, Price__c FROM House__c];

// Parcourir la liste
for (House__c maison : toutesLesMaisons) {
    System.debug(maison.Name);
}
```
> C'est le cas le plus fréquent : chaque requête SOQL retourne une List !

---

## LE SET

### Analogie
Pense à un **sac de billes uniques**.
- Chaque bille est différente
- Si tu essaies d'ajouter une bille identique → elle est automatiquement ignorée
- L'ordre n'a pas d'importance

```
Sac contient : {Rouge, Bleu, Vert}
Tu ajoutes Rouge → refusé, Rouge existe déjà
Sac contient toujours : {Rouge, Bleu, Vert}
```

### En Apex
```apex
// Créer un Set
Set<String> villes = new Set<String>{'Paris', 'Lyon', 'Paris'};
// Salesforce ignore le 2ème 'Paris' automatiquement
// Set contient : {Paris, Lyon}

// Ajouter un élément
villes.add('Marseille');  // → {Paris, Lyon, Marseille}
villes.add('Paris');      // → ignoré, Paris existe déjà

// Vérifier si une valeur existe (très rapide !)
Boolean existe = villes.contains('Paris');    // → true
Boolean existe2 = villes.contains('Nice');   // → false

// Supprimer un élément
villes.remove('Lyon');

// Compter
Integer nombre = villes.size();
```

### Cas d'usage réel en Salesforce
```apex
// Collecter tous les IDs uniques de comptes depuis des contacts
Set<Id> idsComptes = new Set<Id>();
for (Contact c : Trigger.new) {
    idsComptes.add(c.AccountId);
}
// Ensuite faire UNE SEULE requête pour tous ces comptes
List<Account> comptes = [SELECT Id, Name FROM Account WHERE Id IN :idsComptes];
```
> Le Set évite de charger le même compte 50 fois si 50 contacts appartiennent au même compte.

---

## LA MAP

### Analogie
Pense à un **annuaire téléphonique**.
- Tu cherches un NOM (c'est la CLÉ)
- Tu obtiens un NUMÉRO (c'est la VALEUR)
- Chaque nom est unique dans l'annuaire

```
"Martin" → 06 12 34 56 78
"Dupont" → 07 98 76 54 32
"Garcia" → 06 11 22 33 44
```

### En Apex
```apex
// Créer une Map vide
Map<String, Decimal> prixMaisons = new Map<String, Decimal>();

// Ajouter des entrées clé → valeur
prixMaisons.put('Villa Soleil', 450000);
prixMaisons.put('Maison Rose',  180000);
prixMaisons.put('Le Chalet',    320000);

// Lire une valeur par sa clé
Decimal prix = prixMaisons.get('Villa Soleil');
System.debug(prix);  // → 450000

// Vérifier si une clé existe
Boolean existe = prixMaisons.containsKey('Maison Rose');  // → true

// Récupérer toutes les clés
Set<String> toutesLesClés = prixMaisons.keySet();

// Récupérer toutes les valeurs
List<Decimal> tousLesPrix = prixMaisons.values();

// Modifier une valeur
prixMaisons.put('Villa Soleil', 500000);  // écrase l'ancienne valeur

// Supprimer une entrée
prixMaisons.remove('Maison Rose');
```

### Cas d'usage réel en Salesforce
```apex
// Créer une Map Id → Enregistrement pour accès rapide
List<House__c> maisons = [SELECT Id, Name, Price__c FROM House__c];
Map<Id, House__c> maisonsParId = new Map<Id, House__c>(maisons);

// Accéder directement à une maison par son Id
Id unId = '...';
House__c maMaison = maisonsParId.get(unId);
```
> Au lieu de parcourir toute la liste pour trouver un enregistrement, la Map te donne la réponse instantanément.

---

# MODULE 3.2 — LES TRIGGERS

## Pourquoi les Triggers existent-ils ?

En tant qu'admin Salesforce, tu connais les **Process Builder** et **Flows** — ce sont des automatisations sans code.
Un **Trigger** c'est la même chose mais en code Apex, ce qui permet :
- Des logiques plus complexes
- Un meilleur contrôle des performances
- Des traitements sur des volumes importants

---

## Comment fonctionne un Trigger ?

```
Utilisateur clique "Sauvegarder"
        ↓
Salesforce déclenche le Trigger BEFORE (avant sauvegarde)
        → Tu peux modifier les données avant qu'elles soient sauvegardées
        ↓
Salesforce sauvegarde les données en base
        ↓
Salesforce déclenche le Trigger AFTER (après sauvegarde)
        → Tu peux lire l'Id généré, mettre à jour d'autres objets
```

---

## BEFORE vs AFTER — quelle différence ?

| | BEFORE | AFTER |
|--|--------|-------|
| **Quand** | Avant la sauvegarde | Après la sauvegarde |
| **Utilisation** | Modifier les champs de l'enregistrement en cours | Mettre à jour d'autres objets liés |
| **Id disponible** | Non (pas encore créé) | Oui |
| **Exemple** | Forcer un format de texte | Créer une tâche liée |

---

## Les variables spéciales dans un Trigger

```apex
trigger HouseTrigger on House__c (before insert, before update) {

    Trigger.new        // Liste des nouveaux enregistrements
    Trigger.old        // Liste des anciens enregistrements (avant modification)
    Trigger.newMap     // Map Id → nouveau enregistrement
    Trigger.oldMap     // Map Id → ancien enregistrement

    Trigger.isInsert   // true si c'est une création
    Trigger.isUpdate   // true si c'est une modification
    Trigger.isDelete   // true si c'est une suppression
    Trigger.isBefore   // true si c'est un before
    Trigger.isAfter    // true si c'est un after
}
```

---

## Exemple complet commenté

```apex
trigger HouseTrigger on House__c (before insert, before update) {

    // Ce trigger se déclenche avant chaque création ET modification de maison

    for (House__c maison : Trigger.new) {

        // RÈGLE 1 : Si le prix n'est pas renseigné → mettre 0
        if (maison.Price__c == null) {
            maison.Price__c = 0;
        }

        // RÈGLE 2 : Si modification → vérifier si le prix a changé
        if (Trigger.isUpdate) {
            House__c ancienneValeur = Trigger.oldMap.get(maison.Id);
            if (maison.Price__c != ancienneValeur.Price__c) {
                System.debug('Le prix a changé pour : ' + maison.Name);
            }
        }
    }
}
```

---

## Bonne pratique : Trigger + Classe Handler

En production, on ne met jamais la logique directement dans le Trigger.
On crée une classe séparée appelée **Handler** :

```apex
// Le Trigger reste simple
trigger HouseTrigger on House__c (before insert) {
    HouseTriggerHandler.beforeInsert(Trigger.new);
}

// La logique est dans la classe Handler
public class HouseTriggerHandler {
    public static void beforeInsert(List<House__c> maisons) {
        for (House__c maison : maisons) {
            if (maison.Price__c == null) {
                maison.Price__c = 0;
            }
        }
    }
}
```

> Pourquoi ? Parce que les classes sont plus faciles à tester, réutiliser et maintenir.

---

# MODULE 3.3 — LA BULKIFICATION

## Le problème sans bulkification

Salesforce traite les enregistrements par **lots de 200 maximum**.
Quand tu importes 500 maisons :
- Salesforce découpe en 3 lots : 200 + 200 + 100
- Le Trigger se déclenche **3 fois** (une par lot)
- Chaque déclenchement doit traiter jusqu'à 200 enregistrements

---

## La règle absolue : JAMAIS de SOQL dans une boucle

```apex
// ❌ MAUVAIS : 200 requêtes SOQL si 200 maisons !
for (House__c maison : Trigger.new) {
    List<Contact> contacts = [SELECT Id FROM Contact WHERE ...];
    // Governor Limit atteinte → ERREUR Salesforce
}

// ✅ BON : 1 seule requête SOQL peu importe le nombre de maisons
List<Contact> contacts = [SELECT Id FROM Contact WHERE ...];
for (House__c maison : Trigger.new) {
    // utiliser contacts ici
}
```

---

## Exemple de bulkification avec Map

```apex
// Scénario : quand une maison est créée, trouver son compte propriétaire

// ❌ MAUVAIS
for (House__c maison : Trigger.new) {
    Account compte = [SELECT Name FROM Account WHERE Id = :maison.OwnerId];
    // 1 requête par maison = trop !
}

// ✅ BON
// Etape 1 : collecter tous les IDs en une passe
Set<Id> ownerIds = new Set<Id>();
for (House__c maison : Trigger.new) {
    ownerIds.add(maison.OwnerId);
}

// Etape 2 : UNE SEULE requête pour tous les comptes
Map<Id, Account> comptesMap = new Map<Id, Account>(
    [SELECT Id, Name FROM Account WHERE Id IN :ownerIds]
);

// Etape 3 : utiliser la Map dans la boucle
for (House__c maison : Trigger.new) {
    Account compte = comptesMap.get(maison.OwnerId);
    System.debug('Propriétaire : ' + compte.Name);
}
```

---

## Résumé des règles de bulkification

| Règle | Explication |
|-------|------------|
| Jamais de SOQL dans une boucle | Maximum 100 SOQL par transaction |
| Jamais de DML dans une boucle | Maximum 150 DML par transaction |
| Collecter les IDs d'abord | Utilise un Set pour collecter, puis une seule requête |
| Utiliser des Maps | Pour accéder rapidement aux données sans requête |

---

# MODULE 3.4 — TRY / CATCH

## Pourquoi gérer les erreurs ?

Sans gestion d'erreur, si ton code plante :
- L'utilisateur voit une page d'erreur rouge horrible
- Toutes les modifications sont annulées
- Tu ne sais pas ce qui s'est passé

Avec `try/catch` :
- Tu contrôles ce qui se passe en cas d'erreur
- Tu peux afficher un message clair à l'utilisateur
- Tu peux logger l'erreur pour analyse

---

## Structure complète

```apex
try {
    // Code qui pourrait provoquer une erreur
    // Si une erreur se produit ici → on saute directement au catch

} catch (DmlException e) {
    // Erreur spécifique : problème lors d'une opération Salesforce (insert, update...)
    System.debug('Erreur DML : ' + e.getMessage());

} catch (QueryException e) {
    // Erreur spécifique : problème avec une requête SOQL
    System.debug('Erreur SOQL : ' + e.getMessage());

} catch (Exception e) {
    // Attrape TOUTES les autres erreurs non gérées ci-dessus
    System.debug('Erreur inattendue : ' + e.getMessage());

} finally {
    // Ce bloc s'exécute TOUJOURS, qu'il y ait une erreur ou non
    System.debug('Fin du traitement');
}
```

---

## Les informations disponibles sur une erreur

```apex
catch (Exception e) {
    e.getMessage()     // Le message d'erreur
    e.getTypeName()    // Le type d'erreur
    e.getStackTrace()  // Où dans le code l'erreur s'est produite
    e.getCause()       // La cause originelle de l'erreur
}
```

---

## Exemple réel : insertion sécurisée

```apex
public static void creerMaison(String nom, Decimal prix) {
    try {
        House__c nouvelleMaison = new House__c();
        nouvelleMaison.Name     = nom;
        nouvelleMaison.Price__c = prix;

        insert nouvelleMaison;
        System.debug('Maison créée avec succès : ' + nouvelleMaison.Id);

    } catch (DmlException e) {
        System.debug('Impossible de créer la maison : ' + e.getMessage());
        // On peut aussi afficher un message à l'utilisateur
    }
}
```

---

# MODULE 3.5 — LES GOVERNOR LIMITS

## Pourquoi Salesforce impose des limites ?

Salesforce est une plateforme **multi-locataires** : des millions d'entreprises partagent la même infrastructure.
Si une entreprise monopolise les ressources → les autres sont ralenties.
Les Governor Limits sont là pour **protéger tout le monde**.

---

## Les limites principales (par transaction)

| Ressource | Limite | Ce que ça veut dire |
|-----------|--------|---------------------|
| Requêtes SOQL | **100** | Tu ne peux pas faire plus de 100 SELECT dans une même action |
| Lignes retournées par SOQL | **50 000** | Une requête ne peut pas retourner plus de 50 000 enregistrements |
| Opérations DML | **150** | Insert, update, delete comptabilisés ensemble |
| Enregistrements par DML | **10 000** | Une seule opération insert peut insérer max 10 000 lignes |
| CPU Time | **10 secondes** | Ton code ne peut pas tourner plus de 10 secondes |
| Mémoire | **6 MB** | Ton code ne peut pas utiliser plus de 6 MB de mémoire |
| Appels externes (Callouts) | **100** | Appels vers des API externes |

---

## Visualiser les limites dans le code

```apex
// Voir combien de requêtes SOQL ont été utilisées
System.debug('SOQL utilisés : ' + Limits.getQueries());
System.debug('SOQL restants : ' + (Limits.getLimitQueries() - Limits.getQueries()));

// Voir les DML utilisés
System.debug('DML utilisés : ' + Limits.getDmlStatements());
```

---

## Les erreurs courantes qui dépassent les limites

### Erreur 1 : SOQL dans une boucle
```apex
// ❌ Si 150 enregistrements → 150 requêtes SOQL → LIMIT DÉPASSÉE
for (House__c h : Trigger.new) {
    List<Contact> c = [SELECT Id FROM Contact LIMIT 10]; // ERREUR !
}
```

### Erreur 2 : DML dans une boucle
```apex
// ❌ Si 200 enregistrements → 200 opérations DML → LIMIT DÉPASSÉE
for (House__c h : maisons) {
    update h; // ERREUR !
}

// ✅ BON : un seul DML pour toute la liste
update maisons;
```

### Erreur 3 : Requête sans LIMIT sur un gros volume
```apex
// ❌ Si ta table a 60 000 enregistrements → LIMIT DÉPASSÉE
List<House__c> toutes = [SELECT Id FROM House__c]; // ERREUR si > 50 000 !

// ✅ BON
List<House__c> toutes = [SELECT Id FROM House__c LIMIT 1000];
```

---

## Comment vérifier tes limites avant de dépasser

```apex
// Vérification défensive avant une requête
if (Limits.getQueries() < 90) {  // On garde une marge de sécurité
    List<House__c> maisons = [SELECT Id FROM House__c];
}
```

---

# RÉSUMÉ VISUEL — Les 5 concepts

```
┌─────────────────────────────────────────────────────┐
│                    COLLECTIONS                       │
│                                                     │
│  LIST        SET           MAP                      │
│  [A,B,A]   {A,B}       {clé → valeur}              │
│  Ordonné   Sans doublon  Dictionnaire               │
└─────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────┐
│                     TRIGGER                          │
│                                                     │
│  Événement → BEFORE → Sauvegarde → AFTER            │
│  insert / update / delete                           │
│  Trigger.new / Trigger.old                          │
└─────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────┐
│                  BULKIFICATION                       │
│                                                     │
│  Règle d'or : JAMAIS de SOQL dans une boucle        │
│  → Collecter les IDs → 1 requête → Map → Boucle    │
└─────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────┐
│                   TRY / CATCH                        │
│                                                     │
│  try { code risqué }                                │
│  catch (Exception e) { gérer l'erreur }             │
│  finally { toujours exécuté }                       │
└─────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────┐
│                GOVERNOR LIMITS                       │
│                                                     │
│  100 SOQL max · 150 DML max · 10s CPU max           │
│  → Bulkifier · Éviter SOQL/DML dans les boucles    │
└─────────────────────────────────────────────────────┘
```
