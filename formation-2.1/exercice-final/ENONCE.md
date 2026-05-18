# Exercice Final — Rapport de Maisons

## Objectif

Créer un programme complet qui **interroge Salesforce** et **analyse les maisons**.
Cet exercice combine tout ce que tu as appris en Phase 1 et Phase 2.

---

## Ce que le programme doit faire

1. **Récupérer** toutes les maisons depuis Salesforce (SOQL)
2. **Parcourir** chaque maison avec une boucle (for)
3. **Classer** chaque maison : "Chère" si prix > 300 000, sinon "Abordable" (if/else)
4. **Compter** le total de maisons, le nombre de chères et d'abordables (variables)
5. **Afficher** un résumé final via une méthode (méthode)

---

## Compétences utilisées

| Concept | Phase |
|---------|-------|
| Variables | Phase 1.1 |
| Conditions if/else | Phase 1.2 |
| Boucle for | Phase 1.3 |
| Méthodes | Phase 1.4 |
| SELECT + WHERE + ORDER BY | Phase 2.1 / 2.2 / 2.3 |
| COUNT | Phase 2.4 |

---

## Résultat attendu dans les logs

```
--- LISTE DES MAISONS ---
ABORDABLE : Maison A - 150000
ABORDABLE : Maison B - 220000
CHERE     : Maison C - 450000
CHERE     : Maison D - 520000
...

--- RÉSUMÉ ---
Total maisons    : 5
Maisons chères   : 2
Maisons abordables : 3
Prix moyen       : 276000
```

---

## Fichiers à compléter

- `apex/RapportMaisons.cls` — programme principal en Apex
- `python/rapport_maisons.py` — même logique en Python (données simulées)
- `soql/requetes_finales.soql` — 3 requêtes SOQL de synthèse
