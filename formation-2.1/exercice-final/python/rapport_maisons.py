# EXERCICE FINAL - RAPPORT DE MAISONS (Python)
# Combine : Variables + Conditions + Boucles + Méthodes + Classes
# Les données sont simulées (pas de connexion Salesforce en Python ici)
# Complète uniquement les lignes marquées TODO

# Données simulées (remplace le SOQL)
maisons = [
    {"nom": "Villa Soleil",  "prix": 450000, "ville": "Paris"},
    {"nom": "Maison Rose",   "prix": 180000, "ville": "Lyon"},
    {"nom": "Le Chalet",     "prix": 320000, "ville": "Grenoble"},
    {"nom": "Studio Bleu",   "prix": 95000,  "ville": "Marseille"},
    {"nom": "Villa Moderne", "prix": 610000, "ville": "Paris"},
]

# =============================================
# ETAPE 2 - Variables : compteurs
# =============================================

total_maisons      = TODO   # commence à 0
maisons_cheres     = TODO   # commence à 0
maisons_abordables = TODO   # commence à 0
prix_total         = TODO   # commence à 0

# =============================================
# ETAPE 3 - Boucle : parcourir chaque maison
# =============================================

print("--- LISTE DES MAISONS ---")

for maison in TODO:

    total_maisons += 1
    prix_total    += maison["prix"]

    # =============================================
    # ETAPE 4 - Condition : classer la maison
    # =============================================

    if TODO:
        maisons_cheres += 1
        print("CHERE     :", maison["nom"], "-", maison["prix"])
    else:
        maisons_abordables += 1
        print("ABORDABLE :", maison["nom"], "-", maison["prix"])

# =============================================
# ETAPE 5 - Méthode : afficher le résumé
# =============================================

def afficher_resume(total, cheres, abordables, prix_moyen):
    print("--- RÉSUMÉ ---")
    print("Total maisons      :", TODO)
    print("Maisons chères     :", TODO)
    print("Maisons abordables :", TODO)
    print("Prix moyen         :", TODO)

prix_moyen = prix_total / total_maisons
afficher_resume(total_maisons, maisons_cheres, maisons_abordables, prix_moyen)
