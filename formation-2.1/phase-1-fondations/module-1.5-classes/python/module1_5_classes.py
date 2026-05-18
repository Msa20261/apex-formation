# MODULE 1.5 - LES CLASSES (Python)
# Complète uniquement les lignes marquées TODO

class Maison:

    # --- QUESTION 2 : Le constructeur ---
    # En Python le constructeur s'appelle __init__
    # Stocke les valeurs avec self.
    def __init__(self, nom, prix, ville):
        self.nom   = nom
        self.prix  = prix
        self.ville = ville

    # --- QUESTION 3a : Méthode afficher ---
    # Affiche : "Maison : " + nom + " | Prix : " + prix + " | Ville : " + ville
    def afficher(self):
        print("Maison : " + self.nom + " | Prix : " + str(self.prix) + " | Ville : " + self.ville)

    # --- QUESTION 3b : Méthode categoriser ---
    # Retourne "Chère" si prix > 300000, sinon "Abordable"
    def categoriser(self):
        if self.prix > 300000:
            return "Chère"
        else:
            return "Abordable"


# --- QUESTION 4 : Créer 2 objets ---
# Syntaxe : maison = Maison(nom, prix, ville)

maison1 = Maison("Villa Soleil", 450000, "Paris")
maison2 = Maison("Maison Rose", 180000, "Lyon")

# Ne pas modifier les lignes ci-dessous
maison1.afficher()
print(maison1.categoriser())

maison2.afficher()
print(maison2.categoriser())
