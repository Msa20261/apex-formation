# EXERCICE FINAL - RAPPORT DE MAISONS (Python) - CORRECTION

# Données simulées (remplace le SOQL en Python)
maisons = [
    {"nom": "Villa Soleil",  "prix": 450000, "ville": "Paris"},
    {"nom": "Maison Rose",   "prix": 180000, "ville": "Lyon"},
    {"nom": "Le Chalet",     "prix": 320000, "ville": "Grenoble"},
    {"nom": "Studio Bleu",   "prix": 95000,  "ville": "Marseille"},
    {"nom": "Villa Moderne", "prix": 610000, "ville": "Paris"},
]

# ETAPE 2 - Variables compteurs initialisées à 0
total_maisons      = 0
maisons_cheres     = 0
maisons_abordables = 0
prix_total         = 0

# ETAPE 3 - Boucle : on parcourt chaque maison de la liste
print("--- LISTE DES MAISONS ---")

for maison in maisons:

    # A chaque tour on ajoute 1 au total et on additionne le prix
    total_maisons += 1
    prix_total    += maison["prix"]

    # ETAPE 4 - Condition : on classe chaque maison
    if maison["prix"] > 300000:
        maisons_cheres += 1
        print("CHERE     :", maison["nom"], "-", maison["prix"])
    else:
        maisons_abordables += 1
        print("ABORDABLE :", maison["nom"], "-", maison["prix"])

# ETAPE 5 - Méthode résumé
def afficher_resume(total, cheres, abordables, prix_moyen):
    print("--- RÉSUMÉ ---")
    print("Total maisons      :", total)
    print("Maisons chères     :", cheres)
    print("Maisons abordables :", abordables)
    print("Prix moyen         :", prix_moyen)

prix_moyen = prix_total / total_maisons
afficher_resume(total_maisons, maisons_cheres, maisons_abordables, prix_moyen)
