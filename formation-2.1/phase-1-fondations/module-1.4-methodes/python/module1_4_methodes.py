# MODULE 1.4 - LES METHODES (Python)
# En Python on appelle ça des "fonctions"
# Syntaxe : def nom_fonction(parametres):
# Complète uniquement les lignes marquées TODO

# --- QUESTION 1 ---
# Fonction sans paramètre qui affiche un message de bienvenue
# Complète le corps de la fonction

def afficher_bienvenue():
    print("Bienvenue dans l'application Maisons !")

# --- QUESTION 2 ---
# Fonction avec 2 paramètres : nom et prix
# Elle affiche : "Maison : " + nom + " | Prix : " + str(prix)
# Complète les paramètres

def afficher_maison(nom, prix):
    print("Maison : " + nom + " | Prix : " + str(prix))

# --- QUESTION 3 ---
# Fonction qui reçoit un prix et retourne "Chère" ou "Abordable"
# Complète la condition

def categoriser_prix(prix):
    if prix > 300000:
        return "Chère"
    else:
        return "Abordable"

# Appels des fonctions — ne pas modifier
afficher_bienvenue()
afficher_maison("Villa Soleil", 250000)
categorie = categoriser_prix(450000)
print(categorie)
