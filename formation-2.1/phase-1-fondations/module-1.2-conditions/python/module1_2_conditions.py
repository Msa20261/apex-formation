# MODULE 1.2 - LES CONDITIONS (Python)
# Syntaxe :
#   if condition:
#       action
#   else:
#       autre action
# Complète uniquement les lignes marquées TODO

# Les données de la maison (ne pas modifier)
prix = 450000
nb_chambres = 2
ville = "Paris"

# --- QUESTION 1 ---
# Si le prix est supérieur à 300000 → afficher "Maison chère"
# Sinon → afficher "Maison abordable"

if (prix > 300000 ):
    print("Maison chère")
else:
    print("Maison abordable")

# --- QUESTION 2 ---
# Si nb_chambres est supérieur ou égal à 3 → afficher "Grand logement"
# Sinon → afficher "Petit logement"

if nb_chambres >= 3:
    print("Grand logement")
else:
    print("Petit logement")

# --- QUESTION 3 ---
# Si la ville est égale à "Paris" → afficher "Maison à Paris"
# Sinon → afficher "Maison en province"

if ville == "Paris":
    print("Maison à Paris")
else:
    print("Maison en province")
