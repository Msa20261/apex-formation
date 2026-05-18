# Exemple — Les Variables dans les 4 langages

Voici un exemple COMPLET avec une voiture.
Utilise-le comme modèle pour faire l'exercice avec la maison.

---

## Apex

```apex
public class Exemple_Variables {
    public static void run() {

        String  marqueVoiture  = 'Renault';
        Integer nbPortes       = 4;
        Decimal prix           = 15000.00;
        Boolean estNeuve       = true;

        System.debug('Marque : '   + marqueVoiture);
        System.debug('Portes : '   + nbPortes);
        System.debug('Prix : '     + prix);
        System.debug('Neuve : '    + estNeuve);
    }
}
```

**Résultat dans les logs :**
```
Marque : Renault
Portes : 4
Prix : 15000.0
Neuve : true
```

---

## Python

```python
marque_voiture  = "Renault"
nb_portes       = 4
prix            = 15000.00
est_neuve       = True

print("Marque :", marque_voiture)
print("Portes :", nb_portes)
print("Prix :",   prix)
print("Neuve :",  est_neuve)
```

**Résultat dans le terminal :**
```
Marque : Renault
Portes : 4
Prix : 15000.0
Neuve : True
```

---

## Java

```java
public class Exemple_Variables {
    public static void main(String[] args) {

        String  marqueVoiture  = "Renault";
        int     nbPortes       = 4;
        double  prix           = 15000.00;
        boolean estNeuve       = true;

        System.out.println("Marque : "  + marqueVoiture);
        System.out.println("Portes : "  + nbPortes);
        System.out.println("Prix : "    + prix);
        System.out.println("Neuve : "   + estNeuve);
    }
}
```

**Résultat dans le terminal :**
```
Marque : Renault
Portes : 4
Prix : 15000.0
Neuve : true
```

---

## SOQL

```sql
-- Lire des champs précis
SELECT Name, City__c
FROM House__c

-- Lire plusieurs champs avec une limite
SELECT Id, Name, Address__c, City__c
FROM House__c
LIMIT 10

-- Compter les enregistrements
SELECT COUNT()
FROM House__c
```

---

## Différences importantes entre les langages

| Point | Apex | Python | Java |
|-------|------|--------|------|
| Type obligatoire ? | Oui (`String`, `Integer`...) | Non | Oui (`String`, `int`...) |
| Texte entre guillemets | `'simple'` | `"doubles"` | `"doubles"` |
| Vrai/Faux | `true` / `false` | `True` / `False` | `true` / `false` |
| Afficher | `System.debug()` | `print()` | `System.out.println()` |
| Fin de ligne | `;` obligatoire | Rien | `;` obligatoire |
