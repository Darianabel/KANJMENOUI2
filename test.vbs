' Declaration des constantes
CONST MAX_HEALTH = 100
CONST MAX_EXPERIENCE = 100

' Declaration des variables
Dim playerClass, playerHealth, playerExperience, enemyHealth

' Demande a l'utilisateur de choisir sa classe
playerClass = InputBox("Choisissez votre classe : 1) Guerrier 2) Mage 3) Voleur")

' Initialisation des points de vie et d'experience en fonction de la classe choisie
Select Case playerClass
	Case 1 ' Guerrier
		playerHealth = MAX_HEALTH
		playerExperience = 0
	Case 2 ' Mage
		playerHealth = MAX_HEALTH - 20
		playerExperience = 0
	Case 3 ' Voleur
		playerHealth = MAX_HEALTH - 10
		playerExperience = 10
End Select

' Initialisation des points de vie de l'ennemi
enemyHealth = MAX_HEALTH

' Boucle principale du jeu
Do
	' Affichage de l'etat du joueur et de l'ennemi
	WScript.Echo "Vous : " & playerHealth & " PV, " & playerExperience & " XP"
	WScript.Echo "Ennemi : " & enemyHealth & " PV"
	
	' Demande a l'utilisateur de choisir son action
	Dim action
	action = InputBox("Choisissez votre action : 1) Attaquer 2) Fuir")
	
	Select Case action
		Case 1 ' Attaquer
			' Calcul des degâts infliges
			Dim damage
			damage = Int(Rnd * 10) + 1 ' Nombre aleatoire entre 1 et 10
			
			' Application des degâts a l'ennemi
			enemyHealth = enemyHealth - damage
			
			' Affichage du resultat de l'attaque
			WScript.Echo "Vous infligez " & damage & " degâts a l'ennemi"
			
			' Si l'ennemi est vaincu
			If enemyHealth <= 0 Then
				WScript.Echo "Vous avez vaincu l'ennemi !"
				playerExperience = playerExperience + 10 ' Gain d'experience
				
				' Si le joueur atteint le niveau maximum d'experience
				If playerExperience >= MAX_EXPERIENCE Then
					WScript.Echo "Vous avez atteint le niveau maximum d'experience !"
					WScript.Echo "Vous avez gagne !"
					Exit Do ' Fin du jeu
				End If
				
				' Reinitialisation de l'ennemi
				enemyHealth = MAX_HEALTH
			Else
				' L'ennemi contre-attaque
				playerHealth = playerHealth - 5
				WScript.Echo "L'ennemi vous inflige 5 degâts"
			End If
		Case 2 ' Fuir
			' Calcul de la probabilite de fuite reussie
			Dim escapeChance
			escapeChance = Int(Rnd * 10) + 1 ' Nombre aleatoire entre 1 et 10
			
			' Si la fuite est reussie
			If escapeChance > 5 Then
				WScript.Echo "Vous avez reussi a fuir !"
				Exit Do ' Fin du jeu
			Else
				WScript.Echo "Vous n'avez pas reussi a fuir !"
			End If
	End Select
	
Loop