"En Garde" by Tana Ostrova

The story headline is "A voyager forever mindless".
The story genre is "horror".
The release number is 1.
The story creation year is 2017.
The story description is "The one thing you don't miss is memory."

Include French by Eric Forgeot. 
Include Basic Screen Effects by Emily Short.
Include Glimmr Canvas-Based Drawing by Erik Temple.
Include Glimmr Graphic Hyperlinks by Erik Temple.
Include Glimmr Bitmap Font by Erik Temple.
Include Glulx Input Loops by Erik Temple.

Use French Language. 

Use full-length room descriptions.
Use no scoring.

Release along with cover art.

Chapter Globals

BlockChatterFlag is a truth state that varies. BlockChatterFlag is false.

Chapter The Player

The player has a number called consciousness. The consciousness of the player is 0. The curedFlag of the player is a truth state that varies. The curedFlag of the player is false. The player has a number called conversations. The conversations of the player is 0.

[Niveau					après avoir mangé….
0					rien
1					une souris
2					un chien
3					un morceau de cerveau d'un garde
4					le cerveau d'un scientifique
]

The player has a number called knownCommands. The knownCommands of the player is 0.

[Niveau					Action
1					East
2					West
3					Eating
4					Opening
5					North
6					South
7					Push Button
8					Unlock
9					Talk
10					Repair]

Chapter Exit Lister

To decide whether unicodage is enabled:
	(-  glk_gestalt(gestalt_Unicode, 0) -)

Rule for constructing the status line:
	center "[exitList]" at row 1;
	rule succeeds.

To say exitList:
	let L be {up, west, north, south, east, down};
	repeat with way running through L:
		if the room the way from the location is not nothing:
			if the way is:
				-- west:
					say "[if unicodage is enabled][unicode 8592][otherwise]<[end if] ";
				-- north:
					say "[if unicodage is enabled][unicode 8593][otherwise]^[end if] ";
				-- south:
					say "[if unicodage is enabled][unicode 8595][otherwise]v[end if] ";
				-- east:
					say "[if unicodage is enabled][unicode 8594][otherwise]>[end if] ";

Chapter Disable Keyboard

[TODO: re-enable to kill keyboard. ]
The focal event type of main input is hyperlink-event.

When play begins:
	Now the command prompt is "".
	
The print text to the input prompt rule is not listed in the command-showing rules.
	
A command-showing rule (this is the prompt injection rule):
	say input-style-for-glulx;
	say ">";
	say Glulx replacement command;
	say roman type.

Chapter Suppress Mention of Doors

For printing a locale paragraph about a door (called the item)
	(this is the don't mention doors in room descriptions rule):
	set the locale priority of the item to 0;
	continue the activity.
	
[The room description paragraphs about objects rule is not listed in any rulebook.]

Chapter Button Setup

The graphics-window is a graphlink g-window spawned by the main-window. The position is g-placebelow. The scale method is g-fixed-size. The measurement is 70. The back-colour is g-Black.

The graphics-canvas is a g-canvas. The canvas-width is 350. The canvas-height is 70.
The associated canvas of the graphics-window is the graphics-canvas.
The associated canvas of a g-element is the graphics-canvas.

The back-colour of the main-window is g-White.

Table of Common Color Values (continued)
glulx color value	assigned number
g-MidGray	12829635
g-tiffany	10223608
g-peptobismol	16554446

Palette is a list of glulx color values that varies. Palette is {g-red, g-white, g-MidGray, g-lime, g-indigo,  g-tiffany, g-blue, g-yellow, g-green, g-peptobismol}.

A button is a kind of stroked rectangle primitive. The associated canvas of a button is the graphics-canvas. The tint of a button is g-black. The background tint of a button is g-MidGray. 

Some buttons are defined by the Table of Glimmr Buttons.

Table of Glimmr Buttons
button	origin	endpoint	linked replacement-command
Button_1	{ 10, 7 }	{ 60, 28 }	""
Button_2	{ 65, 7 }	{ 115, 28 }	""
Button_3	{ 120, 7 }	{ 170, 28 }	""
Button_4	{ 175, 7 }	{ 225, 28 }	""
Button_5	{ 230, 7 }	{ 280, 28 }	""	
Button_6	{ 10, 42 }	{ 60, 63 }	""
Button_7	{ 65, 42 }	{ 115, 63 }	""
Button_8	{ 120, 42 }	{ 170, 63 }	""
Button_9	{ 175, 42 }	{ 225, 63 }	""
Button_10	{ 230, 42 }	{ 280, 63 }	""
	
Chapter Start of Play

When play begins:
	open up the graphics-window;
	sort Palette in random order; 
	increment the knownCommands of the player.

After printing the banner text:
	say "[line break][italic type]Où suis-je ? D'ailleurs… qui suis-je ?[roman type][paragraph break]Vous vous réveillez tout seul dans une pièce plutôt banale et bleuâtre.[paragraph break][italic type]Pourquoi je ne me souviens de rien ?[paragraph break]Je dois me concentrer ! Qu'est-ce qui s'est passé ?[paragraph break]En tout cas, la solution n'est pas ici -- il faut explorer un peu.".
	
Chapter Geography

Section Location Generalities

The printed name of a room is usually "Ici".

Doors are usually closed. Doors are usually not locked.

Section Doors

A thing can be buttoned. Things are usually not buttoned.
A thing can be broken. Things are usually not broken.

Instead of going through a closed door (called la porte):
	if the consciousness of the player is less than 3:
		say "[bougePas].";
		try looking;
	otherwise:
		if la porte is locked:
			say "Cette porte est sous le contrôle d'une serrure électronique.";
		otherwise:
			if la porte is buttoned:
				say "D'abord, ";
				if the player is in an elevator:
					say "il faut sélectionner l[apostrophe]étage.";
				otherwise:
					say "il faut appeler l'ascenseur.";
			otherwise:
				say "La porte est fermée."
			
To say bougePas:
	say "Le mur ne bouge pas"
			
Section Bloc Opératoire

Bloc Opératoire is a room. The description of Bloc Opératoire is "[descBlocOperatoire]." Couloir 2 is east from Bloc Opératoire. The player is in Bloc Opératoire. The printed name of the Bloc Opératoire is "[pnBlocOpératoire]".

To say descBlocOperatoire:
	if the consciousness of the player is:
		-- 0:
			say "Une pièce sombre[one of]. Rien d'intéressant ici[or][stopping]";
		-- 1:
			say "Il y a peu de sang ici -- une grande pièce bleue avec les murs métalliques";
		-- 2:
			say "La salle bleue où les humains coupent les animaux et enlèvent leurs tripes";
		-- 3:
			say "La table d'opération trône au centre de la pièce bleue, entourée d[apostrophe]équipements chirurgicaux. La sortie à l'est mène au couloir";
		-- 4:
			say "La table d'opération couverte de draps chirurgicaux trône au centre de la salle en bleue, avec ses accessoires pour retenir les animaux pendant la chirurgie expérimentale. Juste à côté, il y a une machine d'anesthésie, des moniteurs de signes vitaux et une unité de radiographie portable. Le couloir central de niveau deux se trouve à l'est"
			
To say pnBlocOpératoire:
	if the consciousness of the player is:
		-- 0:
			say "L'endroit bleuâtre";
		-- 1:
			say "L'endroit affreux";
		-- 2:
			say "La chambre de torture";
		-- 3:
			say "Salle d'opérations";
		-- 4:
			say "Bloc Opératoire".

Section Couloir 2

Couloir 2 is a room. The description of Couloir 2 is "[descCouloir2]." The labZooDoor is a door. It is north of Couloir 2 and south of Laboratoire Zoologique. The printed name of Couloir 2 is "[pnCouloir2]".

To say descCouloir2:
	if the consciousness of the player is:
		-- 0:
			say "Un couloir blanc et sans meuble";
		-- 1:
			say "Un grand couloir blanc qui relie l'endroit affreux à l'ouest à la tanière du loup féroce au nord" ;
		-- 2:
			say "Le couloir qui mène de mon coin confortable au nord à la chambre de torture à l'ouest";
			say "[liftDoorDogStatus]";
		-- 3:
			say "Le couloir central du deuxième niveau. La salle d'opérations se trouve à l'ouest, le chenil au nord, la laboratoire au sud et l'ascenseur à l'est";
		-- 4:
			say "Le couloir central du deuxième niveau. La salle d'opération se trouve à l'ouest, la laboratoire zoologique au nord, la laboratoire biochimique au sud et l'ascenseur à l'est".
			
To say liftDoorDogStatus:
	if the door east from the location is closed:
		say ". Au milieu du mur à l[apostrophe]est, un bouton brille avec une lueur rouge";
	otherwise:
		say ". Le mur à l'est a disparu".
			
To say pnCouloir2:
	if the consciousness of the player is:
		-- 0:
			say "Couloir";
		-- 1:
			say "Grand couloir";
		-- 2:
			say "Couloir dangereux";
		-- 3:
			say "Couloir, niveau 2";
		-- 4:
			say "Niveau 2: Expériences Physiologiques".
	
		
After going east from Couloir 2 when the ascenseur2door is open for the first time:
	now the BlockChatterFlag is true;
	try looking;
	say "« [italic type]Lucky, comment as-tu su ouvrir la boîte magique ?[line break]-- J'ai vu un bouton ; je l'ai appuyé. C'est ce que je fais. Alors, raconte-moi cette histoire de [quotation mark]boîte magique[quotation mark].[line break]-- Les géants… [line break]-- Ça veut dire les humains ?[line break]-- Oui, probablement. Ben, les humains, ils entrent dans la boîte et ils disparaissent. Plus tard, d'autres apparaissent à leur place. C'est magique.[line break]-- On verra.[roman type] »[paragraph break]".
			

Section Laboratoire Zoologique

Laboratoire Zoologique is a room. The description of Laboratoire Zoologique is "[descLabZoo]." The printed name of Laboratoire Zoologique is "[pnLabZoo]".

To say descLabZoo:
	if the consciousness of the player is:
		-- 1:
			say "De sa cage le loup méchant vous dévisage constamment";
		-- 2:
			say "La pièce dans laquelle ils vous avaient appris à appuyer sur le bouton rouge du distributeur de friandises";
		-- 3:
			say "Une cage occupe la moitié de la pièce et le reste de l'espace est dédié au dressage des animaux";
		-- 4:
			say "Les animaux sont maintenus dans une cage d'une superficie de 15 mètres carrés, ce qui leur permet de rester actifs pendant des expériences qui peuvent durer des semaines. Un des dispositifs utilisés pour leur entraînement se trouve du côté de la cage[one of]. Vous constatez que la cage contient un placard : [quotation mark]Sujet 205-Alpha[quotation mark][or][stopping]"
			

To say pnLabZoo:
	if the consciousness of the player is:
		-- 1:
			say "La tanière du loup";
		-- 2:
			say "Chez moi";
		-- 3:
			say "Le chenil";
		-- 4:
			say "Laboratoire Zoologique".
	
To say openNord:
		say "Le mur au nord s'ouvre, révélant la pièce voisine".

	
The cage is an openable closed female container in the Laboratoire Zoologique. 

The chien is an edible male thing. It is in the cage. The printed name of the chien is "[if the consciousness of the player is 1]loup[otherwise]chien[end if]". The chien can be dead. The chien is not dead.

The corps de chien is a male thing. It is in the void.

The distributeur de nourriture is in the Laboratoire Zoologique. It is buttoned and male. 

Instead of pushing the distributeur de nourriture:
	say "Vous appuyez sur le bouton rouge. ";
	if the consciousness of the player is:
		-- 2:
			say "En récompense, quelques croquettes tombent au sol. Vous les mangez, mais le repas ne satisfait pas votre faim.";
		-- 3:
			say "Vous n'avez la moindre envie de manger les croquettes de nourriture pour chien qui tombent à vos pieds.";
			move the tas de nourriture de chien to the Laboratoire Zoologique;
		-- 4:
			say "Le dispositif de conditionnement actif produit des cubes de nourriture pour chien qui s'accumulent sur le sol.";
			move the tas de nourriture de chien to the Laboratoire Zoologique.
			
The tas de nourriture de chien is in the void.

Every turn when the chien is in the cage and the player is in the Laboratoire Zoologique:
	if a random chance of 3 in 8 succeeds:
		say "Le loup [one of]aboie bruyamment[or]mord les barres de sa cage[or]se gratte les oreilles[or]fait les cent pas dans sa boîte métallique[or]hurle à pleins poumons[or]renifle l'air[or]renifle sa cage[or]se renifle lui-même[or]se lèche les pattes[or]vous montre les dents[or]grogne de manière menaçante[or]vous ignore[or]court de long en large dans sa cage, vous dévisageant[in random order]."		
	
		 
Section Ascenseur 2

An elevator is a kind of room. The description of an elevator is "[descAscenseur1]." The printed name of an elevator is "[pnAsc]".

An elevatorDoor is a kind of door. ElevatorDoors are buttoned. 

To say pnAsc:
	if the consciousness of the player is 2:
		say "La petite pièce";
		if Ascenseur 2 is visited:
			say " qui vibre";
	otherwise:
		say "L'ascenseur".

Ascenseur 2 is an elevator. The Ascenseur2door is an elevatorDoor. It is east of Couloir 2 and west of Ascenseur 2. 

Instead of pushing an elevatorDoor:
	say "Vous appuyez sur le bouton";
	if the player is in an elevator:
		if the consciousness of the player is:
			-- 2:
				say " avec votre museau[one of] (qui est devenu plus court que dans vos souvenirs)[or][stopping] et remarquez que la pièce vibre subtilement. Un instant plus tard, le mur s[apostrophe]ouvre donnant sur un couloir à l[apostrophe]ouest.";
			-- otherwise:
				say ", l'ascenseur [if the location is Ascenseur 2]descend au premier niveau[otherwise]monte au deuxième niveau[end if] et les portes à l'ouest s[']ouvrent."; 
		if the player is in Ascenseur 2:
			move the player to Ascenseur 1, without printing a room description;
			now Ascenseur1door is open;
		otherwise:
			move the player to Ascenseur 2, without printing a room description;
			now Ascenseur2door is open;
	otherwise:
		if the consciousness of the player is:
			-- 2:
				say " et le mur s[apostrophe]ouvre vous permettant d'aller à l[apostrophe]est.";
			-- otherwise:
				say " et la porte de l[apostrophe]ascenseur à l[apostrophe]est s[apostrophe]ouvre.";
		if the player is in Couloir 2:
			now Ascenseur2door is open;
		otherwise:
			now Ascenseur1door is open.
		
After going east from Couloir 2:
		say "[portesReferment].";
		try looking;
		now the Ascenseur2door is closed.
		
To say portesReferment:
	say "Vous ";
	if the player is in an elevator:
		say "entrez";
	otherwise:
		say "sortez";
	say " et ";
	if the consciousness of the player is less than 3:
		say "le mur se referme";
	otherwise:
		say "les portes se referment";
	say " silencieusement derrière vous".
	
After going west from an Ascenseur 2:
	say "[portesReferment].";
	try looking;
	now Ascenseur2door is closed.
	

Section Laboratoire Biochimique

Laboratoire Biochimique is a room. The description of Laboratoire Biochimique is "[descLabBio]." The printed name of the Laboratoire Biochimique is "[pnLabBio]". 

The labBioDoor is a female locked door. It is south of Couloir 2 and north of Laboratoire Biochimique. The printed name of the labBioDoor is "[pnLabBioDoor]".

To say descLabBio:
	if the consciousness of the player is:
		-- 3:
			say "Normalement, la pièce déborde d[apostrophe]équipements high-techs avec des lumières clignotantes et le bruit continuel des moteurs robotiques. Pourtant, en ce moment tous les équipements sont éteints et il n'y a le moindre son";
		-- 4:
			if the disjoncteurs are not broken:
				say "L'alimentation électrique rétablie, la pièce est bien illuminée, les ordinateurs sont allumés et les équipements semblent en mesure de réaliser les synthèses biochimiques les plus complexes";
			otherwise:
				say "Rien ne fonctionne dans ce pièce sombre, ni les ordinateurs, ni le système robotique de synthèse moléculaire. Il est évident que c'est à cause d'un coupure d'alimentation électrique quelque part"
					
To say pnLabBio:
	if the consciousness of the player is:
		-- 3:
			say "Laboratoire Biochimique";
		-- 4:
			say "Laboratoire De Synthèse Moléculaire".
			
To say pnLabBioDoor:
	say "porte de la laboratoire".
	

Section Couloir 1

Couloir 1 is a room. The description of Couloir 1  is "[descCouloir1]." The printed name of Couloir 1 is "[pnCouloir1]".

To say descCouloir1:
	if the consciousness of the player is:
		-- 2:
			say "Un couloir qui ressemble au « couloir dangereux » près de chez vous. Vous voyez [if labPathDoor is closed]une sortie au sud et un mur coulissant au nord[otherwise]des sorties au nord et au sud[end if]";
			say "[liftDoorDogStatus]"; 
		-- 3:
			say "Le couloir central du premier niveau donne vers les toilettes au sud, les douches à l'ouest, un labo au nord et l'ascenseur à l'est";
		-- 4:
			say "Le couloir central du premier niveau donne vers les toilettes au sud, l'installation de décontamination à l'ouest, le laboratoire de pathologie au nord et l'ascenseur à l'est".
		
To say pnCouloir1:
	if the consciousness of the player is:
		-- 2:
			say "Nouveau couloir";
		-- 3:
			say "Couloir, niveau 1";
		-- 4:
			say "Niveau 1: Bioconfinement".
			
After going east from Couloir 1:
		say "[portesReferment].";
		try looking;
		now the Ascenseur1door is closed.

Section Ascenseur 1

Ascenseur 1 is an elevator. The Ascenseur1door is an elevatorDoor. It is east of Couloir 1 and west of Ascenseur 1. 

To say descAscenseur1:
	say "Un bouton vert brille sur un panneau".
	
After going west from an Ascenseur 1:
	say "[portesReferment].";
	try looking;
	now Ascenseur1door is closed.

Section Laboratoire De Pathologie

Laboratoire de Pathologie is a room. The description of Laboratoire de Pathologie is "[descLabPath]." The labPathDoor is a door. It is north of Couloir 1 and south of Laboratoire de Pathologie. The printed name of Laboratoire de Pathologie is "[pnLabPath]".

To say pnLabPath:
	if the consciousness of the player is:
		-- 2:
			say "La cuisine";
		-- 3: 
			say "Le labo préparatoire";
		-- 4:
			say "Le laboratoire de pathologie".

To say descLabPath:
	If the consciousness of the player is:
		-- 2:
			say "[one of]Cette pièce vous évoque les temps joyeux que vous avez passé en famille -- avant d[apostrophe]être enlevé. D'après les comptoirs, les étagères remplies de denrées, les éviers et les grands appareils, il s'agit sans aucun doute de la pièce la plus importante de la maison: la cuisine[or]Une cuisine ordinaire, meublé en noir[stopping]";
		-- 3:
			say "C'est ici où les scientifiques préparent les lames de microscope.[paragraph break]Vous reconnaissez une trancheuse à viande et un four à micro-ondes, mais la plupart de l[apostrophe]équipement sur le comptoir n'est pas familier";
		-- 4:
			say "Vous avez vous-même sélectionnée les équipements dernier cri trouvés dans ce laboratoire ultramoderne qui s'occupe de la préparation et de l'analyse des échantillons de tissus".
	
The frigo is a closed openable container in the Laboratoire de Pathologie. The frigo is closed. The printed name of the frigo is "[pnFrigo]".

To say pnFrigo:
	if the consciousness of the player is:
		-- 2:
			say "frigo";
		-- 3:
			say "congélo";
		-- 4:
			say "congélateur pour spécimens de pathologie".

The boîte en plastique is a female closed openable container in the frigo. The boîte en plastique is closed.

The morceau de cerveau is a male edible thing in the boîte en plastique.

After opening the labPathDoor:
	say "[openNord]."
	
After going north from Couloir 1 when the labPathDoor is open for the first time:
	now the BlockChatterFlag is true;
	say "« [italic type]Oh là là ! dit Lucky avec joie.[line break]-- Pourquoi es-tu si content ?[line break]-- Vois-tu cette boîte-là ? Voilà la vraie boîte magique : le frigo ![line break]-- Est-ce qu'on fait des voyages dans un frigo ?[line break]-- Non, on mange ce qu'on trouve là-dedans ![roman type] »[paragraph break]";
	try looking.


Section Les Toilettes

Les Toilettes is a room. The description of Les Toilettes is "[descToilettes]." Les Toilettes are south of Couloir 1. The printed name of Les Toilettes is "[pnToilettes]". 

To say descToilettes:
	if the consciousness of the player is less than 3:
		say "L'odeur d'urine est forte ici[one of]. Beaucoup ont marqué leur territoire. Ce doit être un endroit très convoité[or][stopping]";
	otherwise:
		say "Un sol carrelé en noir et blanc, des cabinets, urinoirs et lavabos"
	
To say pnToilettes:
	if the consciousness of the player is less than 3:
		say "La pièce carrelée";
	otherwise:
		say "Les toilettes".
		
Instead of simplePushing when the player is in les Toilettes:
	if the consciousness of the player is less than 3:
		say "Vous appuyez sur un bouton métallique et entendez un grand bruit.";
	otherwise:
		say "Vous tirez la chasse d'eau."
		
Instead of simpleOpening when the player is in Les Toilettes:
	if the consciousness of the player is less than 3:
		say "[if the potty is in Les Toilettes]Le bol d'eau est déjà ouvert[otherwise]En soulevant la couverture d'un meuble, vous révélez un bol plein d'eau[end if].";
	otherwise:
		say "[if the potty is in Les Toilettes]Vous avez déjà soulevé[otherwise]Vous soulevez[end if] le couvercle des toilettes.";
	now the potty is in Les Toilettes.
	
The potty is a female thing in the void. The printed name of the potty is "[pnPotty]".

To say pnPotty:
	if the consciousness of the player is less than 3:
		say "bol plein d[apostrophe]eau";
	otherwise:
		say "toilettes (dont le couvercle est soulevé)". 
		
Instead of simpleEating when the player is in Les Toilettes:
	if the potty is in the void:
		continue the action;
	otherwise:
		if the consciousness of the player is:
			-- 2:
				say "Vous [one of]lapez l'eau dans le bol. C'est rafraîchissante[or]n'avez pas vraiment soif, mais vous avalez un peu plus d'eau[or]n'avez plus soif ayant déjà avalé quelques litres d'eau[stopping].";
			-- 3:
				say "Non, ça serait dégoûtant[one of] (même pour quelqu'un qui mange les cerveaux)[or][stopping]."; 
			-- 4:
				say "Vous rendez-vous compte combien d'espèces de bactéries pathogènes se trouvent dans cette eau ? Pas de la question."
				
After going south from Couloir 1 when the consciousness of the player is 3 for the first time:
		now the BlockChatterFlag is true;
		say "Quand vous entrez dans les toilettes, un mouvement attire votre attention.[paragraph break][italic type]Y a-t-il quelqu'un d'autre ici ?[roman type][paragraph break]Un costaud vêtu d'un uniforme en lambeaux vous dévisage sans sourciller. Son teint blafard, ses yeux cernés et ses joues creuses rappellent un cadavre.[paragraph break]Cette rencontre maladroite continue pendant plusieurs minutes, jusqu'au moment où vous vous rendez compte que vous regardez votre propre reflet dans un miroir.";
		try looking.
	
After going south from Couloir 1 when the consciousness of the player is 4 for the first time:
	now the BlockChatterFlag is true;
	say "Vous voyez votre reflet dans le miroir et vous le regardez un long moment. Vous reconnaissez immédiatement Julien, vêtu de son uniforme bleu de garde et contre toute attente portant toujours son chapeau officiel.";
	try looking.

Section Salle de Décontamination

Salle de Décontamination is a room. The description of Salle de Décontamination is "[descDecon]." The printed name of the Salle de Décontamination is "[pnDecon]".

The deconDoor is a female locked door. It is west of Couloir 1 and east of Salle de Décontamination. The printed name of the deconDoor is "[pnDeconDoor]".

To say descDecon:
	if the consciousness of the player is:
		-- 3:
			say "Des pommeaux de douche visent le centre de la pièce qui baigne continuellement dans une lumière violette";
		-- 4: 
			say "Des jets à haute pression entourent la pièce afin d'arroser le personnel d'une solution antiseptique lorsqu'ils entrent et sortent des zones potentiellement contaminées. La pièce est continuellement éclairée par des lumières germicides";
	say ". La porte à l'est mène au couloir et celle au nord à l'escalier"

To say pnDecon:
	if the consciousness of the player is:
		-- 3:
			say "Les Douches";
		-- 4:
			say "Salle de Décontamination".
			
To say pnDeconDoor:
	if the consciousness of the player is:
		-- 3:
			say "porte de la salle de bain";
		-- 4:
			say "porte de la salle de décontamination".

Section Escalier 1

Escalier 1 is a room. The description of Escalier 1  is "[descEscalier1]." The printed name of Escalier 1 is "Escalier (premier niveau)".

The esc1door is a female locked door. It is north of Salle de Décontamination and south of Escalier 1.

The printed name of esc1door is "porte entre la salle de [if the consciousness of the player is 3]bain[otherwise]décontamination[end if] et l'escalier".

To say descEscalier1:
	say "L'escalier remonte vers le nord et relie [if the consciousness of the player is 3]la salle de bain[otherwise]la salle de décontamination[end if] au sud avec les niveaux plus hauts de l'installation".
	
After going north from Salle de Décontamination:
	say "[upNorth].";
	try looking.
	
After going south from Escalier 2:
	say "[downSouth].";
	try looking.
	
To say upNorth:
	say "Vous montez l'escalier au nord".
	
To say downSouth:
	say "Vous descendez l'escalier au sud".

Section Escalier 2

Escalier 2 is a room. The description of Escalier 2  is "[descEscalier2]." Escalier 2 is north from Escalier 1. The printed name of Escalier 2 is "Escalier (deuxième niveau)".

To say descEscalier2:
	say "L'escalier remonte vers le nord et relie l[apostrophe]escalier au sud avec le sas au nord".
	
After going north from Escalier 1:
	say "[upNorth].";
	try looking.
	
After going south from Sas:
	say "[downSouth].";
	try looking.

Section Sas

Sas is a room. The description of Sas is "[descSas]." The printed name of the sas is "Sas".

The sasDoor is a female locked door. It is north of Escalier 2 and south of Sas. The printed name of the sasDoor is "porte blindée du sas".

The scientifique is an edible female thing in the sas. The scientifique has a truth state called introducedFlag. The introducedFlag of scientifique is false. The scientifique has a number called conversations. The conversations of the scientifique is 0.

The indefinite article of the scientifique is "[if the introducedFlag of scientifique is true]le[otherwise]une[end if]". 

To say descSas:
	if the consciousness of the player is:
		-- 3:
			say "Une longue pièce tubulaire baignée de lumière rouge";
		-- 4:
			say "Les lourdes portes blindées, le manque de fenêtres et la forme tubulaire de la pièce vous rappellent un sous marin. La lumière au-dessus de la porte à l'autre extrémité de la pièce signifie qu'elle est verrouillée".
			
Instead of going north when the player is in the sas:
	if scientifique is in the sas:
		say "Vous auriez besoin de dépasser la scientifique, et elle n'a pas l'air coopérative. De plus, vous ne connaissez pas le code pour ouvrir la porte extérieure, il serait donc inutile d'essayer.";
	otherwise:
		say "Futile. La porte est hermétiquement fermée et ne peut être ouverte que par ceux qui se trouvent dans la salle de contrôle."
			
Before eating scientifique when the conversations of scientifique are less than 5:
	now the BlockChatterFlag is true;
	say "[one of]La scientifique vous repousse avec son pied-de-biche. Une fois hors de portée de votre bouche menaçante, elle appuie sur un bouton de l[apostrophe]interphone et dit : « Attention : salle de contrôle. Ici docteur Rambaud, dans le sas. Julien est ici avec moi. Malheureusement, je dois vous signaler que l'expérience a raté.  Ne déverrouillez en aucun cas la porte extérieure. »[paragraph break][or]Le docteur Rambaud ne bouge pas de sa position derrière le bureau, mais lorsque vous l'approchez, elle lance une série de coups avec son pied-de-biche qui vous fait reconsidérer votre action.[or]La scientifique vous confie : « Je vous fais crédit de votre persévérance, néanmoins… » et elle vous frappe carrément au nez. Ébranlé, vous trébuchez un peu et vous hâtez de reculer.[or]Le docteur Rambaud vous bat avec le pied-de-biche à plusieurs reprises.[stopping]";
	stop the action.
	

Chapter Verbs

Section simpleUnlocking

simpleUnlocking is an action applying to nothing. Understand "déverrouiller" as simpleUnlocking.

Carry out simpleUnlocking:
	repeat with way running through directions:
		if the door the way of the location is locked:
			now the door the way from the location is unlocked;
			say "Vous entrez le code sur le pavé numérique et entendez se déverrouiller la porte ";
			if the way is east or the way is west:
				say "à l[apostrophe]";
			otherwise:
				say "au ";
			say "[way].[no line break][one of][firstUnlocked][or][stopping][paragraph break]";
			stop the action;
	say "Vous ne voyez aucune porte verrouillée."
	
To say firstUnlocked:
	now the BlockChatterFlag is true;[hate to side effect this way, but here it seems expedient]
	say "[paragraph break]« [italic type]Attends, dit le chien. Quel est ce nouveau truc ?[line break]-- Il faut introduire un code pour ouvrir les portes avec des serrures électroniques.[line break]-- Et tu te souviens de ce code ? demande la souris.[line break]-- Apparemment[roman type]. »[paragraph break]".
	
Section simpleOpening

Definition: A door is simpleOpenable if it is closed and it is not locked and it is not buttoned.
	
simpleOpening is an action applying to nothing. Understand "ouvrir" as simpleOpening.

Carry out simpleOpening:
	repeat with the way running through directions:
		if the door the way of the location is simpleOpenable:
			try opening the door the way from the location;
			stop the action;
	repeat with the item running through visible containers:
		if the item is closed:
			try opening the item;
			stop the action;
	say "Rien à ouvrir ici." 

Section simpleEating

simpleEating is an action applying to nothing. Understand "manger" as simpleEating.

Carry out simpleEating:
	repeat with the item running through visible edible things:
		try eating the item;
		stop the action;
	say "Il n[apostrophe]y a rien à manger";
	if the tas de nourriture de chien is in the location:
		say " (du moins, rien dont vous avez envie de manger)";
	say "."
	
Section simplePushing

simplePushing is an action applying to nothing. Understand "pousser" as simplePushing.

Carry out simplePushing:
	repeat with the item running through visible buttoned things:
		try pushing the item;
		stop the action;
	say "Rien à appuyer ici."
	
Section simpleTalking

simpleTalking is an action applying to nothing. Understand "parler" as simpleTalking.

Check simpleTalking:
	if the player is not in the sas:
		say "Personne n'est présent. À qui parlez-vous[one of] ?[paragraph break]Voulez-vous que tout le monde pense que vous êtes débile[or][stopping] ?";
		stop the action;
	otherwise:
		if the dépouille saignante du Docteur Rambaud is in the sas:
			if the interphone is not live:
				say "Pour parler avec la salle de contrôle, il faut d'abord allumer l'interphone.";
				stop the action.
				
Carry out simpleTalking:
	if the dépouille saignante du Docteur Rambaud is in the sas:
		now the BlockChatterFlag is true;
		if the curedFlag of the player is not true:
			say "[one of]Vous expliquez votre plan. Le directeur de l'installation prend le micro et vous souhaite bon chance. Par ailleurs, il vous demande de rappeler quand vous avez réussi. À part ça, il ne faut pas utiliser l'interphone[or]La salle de contrôle refuse de vous parler jusqu[apostrophe]à ce que vous ayez en main un remède efficace[stopping]. Il raccroche et l'interphone s[apostrophe]éteint.";
			now the interphone is not live;
		otherwise:
			increase the conversations of the player by 1;
			if the conversations of the player is:
				-- 1:
					say "« Salle de contrôle, Professeur Drummond à l'appareil.[line break]-- C'est ton chien, Lucky ! Je suis ici dans le sas ! Je suis tellement heureux de t'entendre ![line break]-- Euh… est-ce que vous vous moquez de moi ? L'interphone n'est que pour les communications officielles. Qui est-ce ?[paragraph break][italic type]-- C'est lui ! C'est le père de ma famille, dit Lucky.[line break]-- Calme toi, Lucky, insiste la scientifique. Laisse Julien prendre le micro.[roman type][paragraph break]-- Excusez-moi, dit Julien. Je peux tout expliquer. Je suis Julien Truffaut.[line break]-- Le garde ?[line break]-- Oui.[line break]-- Impossible. Le docteur Rambaud a dit qu'il était devenu un zombie. Les zombies ne peuvent pas parler. Je n'ai pas de temps pour ces conneries. »[paragraph break]";
				-- 2:
					say "« Je ne plaisante pas, dit Julien. Le docteur Rambaud m'a guéri.[line break]-- Assez, répond le professeur. Si elle est là, donnez-lui la parole.[line break]-- Elle est… occupée… en ce moment ». Pendant que vous parlez, vous traînez le corps inerte de la scientifique vers l'escalier.[paragraph break]« Dites donc, continuez-vous, si vous méfiez de moi, activez la caméra de surveillance dans le sas. Vous me verrez.[line break]-- Attendez. »[paragraph break]";
				-- 3:
					say "« Me voyez-vous ? vous demandez.[line break]-- Oui. Mais comment se fait-il que vous êtes toujours en vie ? J'ai pensé que vous étiez infecté par le virus.[line break]-- Oui, vous avez raison, comme je vous l[apostrophe]ai dit…[paragraph break][italic type]-- Laisse-moi expliquer, dit le scientifique.[roman type][paragraph break]-- Le docteur Rambaud a préparé un remède efficace utilisant le système microfluidique de biosynthèse suivant le protocol [quotation mark]M13[quotation mark] dont elle a discuté avec vous auparavant. Mes voies neuronales étaient restaurées et je suis guéri de l'infection.[line break]-- Ouah. C[apostrophe]est peut-être la fin de la pandémie.[line break]-- Oui. Certainement ! »[paragraph break]";
				-- 4: 
					say "Vous demandez à parler avec le responsable de l'installation, le colonel Greillier et vous expliquez en détail votre histoire.[paragraph break]Après quelques heures de discussion, il est convaincu et la porte extérieure du sas est déverrouillée vous permettant de sortir.";
					terminate the game;
	otherwise:
		now the BlockChatterFlag is true;
		increase the conversations of scientifique by 1;
		if the conversations of scientifique is:
			-- 1:
				say "Vous commencez à balbutier et la scientifique vous dévisage d'un regard inquisiteur.[paragraph break]« C'est possible ? demande-t-elle. Es-tu toujours capable de parler ?[line break]-- Oui, vous grognez au prix d'un grand effort. Moi... parle.[line break]-- Incroyable ! C'est un miracle, Julien. De quoi tu te souviens ?[paragraph break][italic type]-- Julien ? Qui est-ce ? demande Lucky.[line break]-- C'est pas moi, répond la voix minuscule de la souris. Peut-être que le nom appartient à notre ami, la tranche de cerveau ?[line break]-- Je ne m'en souviens pas, mais bon, je pourrais aussi bien être ce Julien.[roman type][paragraph break]-- Rien. Rien de tout. Julien… C'est moi ?[line break]-- Oui, Julien, c'est toi. Et moi, je suis ton Isabelle. Isabelle Rambaud, répond-elle d'un ton déçu. »[paragraph break]";
			-- 2:
				say "« [italic type]Elle a de jolies yeux (pour un géant), remarque la souris.[line break]-- Tais-toi, disent Lucky et la tranche de cerveau à l'unisson. »[roman type][paragraph break]Vous vous efforcez de former les mots les uns après les autres.[paragraph break]« Que faisons-nous ici ?[line break]-- Écoute, Julien. Je n'ai pas beaucoup de temps. Je suis chercheur médical et tu es garde. Nous travaillions dans une installation consacrée à trouver un remède contre le virus Zombie777 qui a désolé le monde entier.[line break]-- Un garde ?[line break]-- Oui. Fais attention, Julien, c'est important. Un foule d'individus infectés ont encerclé le laboratoire et tu me protégeais quand tu as été griffé. Pour éviter que tu ne deviennes un zombie, je t'ai administré le traitement expérimental.[line break]-- Alors, je suis guéri ?[line break]-- Loin de là, je dirais. »[paragraph break]";
			-- 3:
				say "« Le traitement n'a pas marché ? demandez-vous.[line break]-- Pas entièrement, il me semble. J'ai eu un problème avec le système microfluidique de synthèse biomoléculaire qui a produit le traitement. Je crois qu'un composant a été omis dans la formule. J[apostrophe]étais en train de faire des réparations sur l'unité de synthèse quand tu m'a pris au dépourvu. Tu m'as attaqué, mais j'ai réussi à m'enfuir vers le sas. Et voilà où nous en sommes.[line break]-- Désolé.[line break]-- Ce n[apostrophe]était pas toi. Tu étais complètement transformé en zombie. Mais… comment se fait-il que tu puisse parler maintenant ? Les zombies n'en sont pas capables. »[paragraph break]";
			-- 4:
				say "« Nous avons beaucoup de mal à parler.[line break]-- Naturellement, vos neurones sont en état de… attends… nous ?[paragraph break][italic type]-- Raconte-lui de moi, implore la souris toute excitée.[line break]-- Et de moi ! ajoute Lucky.[roman type][paragraph break]-- Ouais, je dis [quotation mark]nous[quotation mark] parce qu'il y a trois esprits dans ma tête : la souris, le chien qui s'appelle Lucky et la tranche de cerveau. Nous travaillons ensemble pour nous déplacer et parler.[line break]-- Ben, elle marque un pause, ça explique tout. Votre cerveau était réinitialisé, c'est-à-dire effacé, par le virus, mais tu as réussi à le recharger d'une certaine façon avec des cerveaux normaux. La tranche dont tu parles est une biopsie que j'ai pris de Julien avant que le virus avait atteint cet portion de son cerveau. »[paragraph break]";
			-- 5:
				say "« Alors, nous sommes bel et bien foutus ? dites-vous.[paragraph break][italic type]-- Tout à fait, grommelle la souris[line break]-- Oui, il me semble, accorde Lucky.[roman type][paragraph break]-- Peut-être que non… [line break]-- As-tu un plan ?[line break]-- Oui, je crois. Fais exactement ce que je te dis : Je suis en train de mourir, déjà je ne peux même pas bouger les jambes. Pourtant... Si tu manges mon cerveau -- attends, pas encore, laisse-moi arriver à la fin de mon discours -- si tu manges mon cerveau ma personnalité fusionnera avec les tiennes. Le virus est encore présent en toi et il va détruire ton cerveau, mais il a été ralenti par la première dose du traitement. S'il reste assez de temps, on peut réparer l'unité de synthèse et cette fois produire un traitement curatif. Je vivrai en toi, avec tes pensées.[line break]-- Alors, je dois manger ton cerveau maintenant ?[line break]-- Vas-y ! »[paragraph break]";
			-- otherwise:
				say "Il ne reste rien à dire."
				
												
Section simpleRepairing

simpleRepairing is an action applying to nothing. Understand "réparer" as simpleRepairing.

Carry out simpleRepairing:
	repeat with the item running through visible broken things:
		try touching the item;
		stop the action;
	say "Vous ne voyez rien à réparer."
	
Instead of touching something (called the item):
	now the item is not broken;
	say "Vous réparez[the item]."
	[override touch with specific repair actions.]
	
Chapter Consciousness

To increment the consciousness of the player:
	increase the consciousness of the player by 1;
	try looking.

Chapter Known Commands

actionList is a list of text that varies. actionList is {"est", "ouest","manger","ouvrir","nord","sud","pousser","déverrouiller","parler","réparer"}

The commandList is a list of numbers that varies. The commandList is {}.

To increment the knownCommands of the player:
	increase the knownCommands of the player by 1;
	add the knownCommands of the player to commandList;
	sort commandList in random order;
	let R be the number of entries in commandList;
	repeat with N running from 1 to R:
		let E be entry N of commandList;
		now the tint of the button in row N of the Table of Glimmr Buttons is entry E of Palette;
		now the linked replacement-command of the button in row N of the Table of Glimmr Buttons is entry E of actionList;
	now the graphlink status of the button in row R of the Table of Glimmr Buttons is g-active;
	follow the refresh windows rule.
				
Chapter Milestones

After going east for the first time:
	try looking;
	say "Une petite créature arrive de nulle part, se faufile entre vos pieds, et s'enfuit vers l'ouest.";
	increment the knownCommands of the player.
	
After going west from Couloir 2 for the first time:
	move the petite créature grise to the Bloc Opératoire;
	try looking;
	say "Un petit animal gris se cache dans les ombres, tremblant.";
	increment the knownCommands of the player.
	
After eating the petite créature grise:
	say "[line break]De votre main, vous balayez aveuglément les recoins à la base du mur. Malgré votre manque de vitesse et dextérité, par miracle vous réussissez à coincer le petit rongeur contre le mur. Vous vous empressez de le saisir fermement et sentez quelque chose de chaud, poilu, et maintenant, mouillé au fond de votre main. Sans y penser plus, vous le mangez précipitamment.[paragraph break]Après un petit moment, de nouvelles pensées vous frappent. Pris au dépourvu, vous frissonnez.[paragraph break][italic type]Au secours ! Un énorme monstre me poursuit ! Il va me manger ! il faut me dissimuler.[paragraph break]Je… euh.  Suis-je mort ou quoi ? Je ne comprends pas.[roman type].";
	increment the consciousness of the player.
	
After going east when the consciousness of the player is 1 for the first time:
	try looking;
	now the BlockChatterFlag is true;
	say "[italic type]Ah, le grand couloir blanc.[paragraph break]Combien de fois est-ce que j'ai vu les géants marcher à travers les murs lisses pour entrer dans les pièces secrètes ? Comment le font-ils ?[roman type][paragraph break]";
	increment the knownCommands of the player.
	
After opening the labZooDoor:
	say "[openNord].";
	increment the knownCommands of the player.
	
After going north from Couloir 2 for the first time:
	say "Vous pénétrez dans la tanière du loup, un endroit bien connu mais toujours effrayant. Comme d'habitude le loup est emprisonné dans sa cage et vous êtes libre d'explorer, hors de portée de ses mâchoires baveuses.";
	try looking;
	increment the knownCommands of the Player.
	
After opening the cage:
	say "Vous ouvrez la cage mais le loup reste prudemment à l'intérieur."
	
After eating the chien:
	now the chien is dead;
	now the corps de chien is in the cage;
	say "D'instinct, vous dévorez son cerveau et jetez le corps dans la cage. Encore une fois, de nouvelles pensées envahissent votre esprit.[paragraph break][italic type]Je vous préviens : si vous approchez de ma cage, je vous mordrai. Arrêtez ! Sans blague… [paragraph break]Mais, qu'est-ce qui se passe ? Qui est ce chien mort dans ma cage… dont le sang coule sur mon coussin préféré ?[paragraph break]Et pourquoi est-ce que je me tiens debout sur deux jambes à la façon des êtres humains ? C'est en fait plus facile que j'aurais pensé.";
	increment the consciousness of the player;
	increment the knownCommands of the player.
	
After eating the morceau de cerveau:
	say "En mâchant la tranche de cerveau, vous sentez un saveur désagréable, mais ça s'estompe presque immédiatement.[paragraph break]Pendant quelques moments rien ne se passe et vous vous demandez si vous pouvez maintenant manger n'importe quoi en toute impunité.[paragraph break]Soudain, le monde passe du monochrome à la couleur vive. Une vague électrique parcourt votre esprit et vous vous effondrez, désorienté. Lorsque vous vous mettez debout, des nouvelles idées se mêlent à vos pensées et vous voyez tout sous un nouveau jour.";
	increment the consciousness of the player;
	increment the knownCommands of the player.
	
After going north from Escalier 2 when the sasDoor is not locked for the first time:
	now the BlockChatterFlag is true;
	say "Une femme d'une quarantaine d'années vêtue d'une blouse blanche est assise derrière un bureau en métal. Elle est à mi-chemin entre vous et la porte à l'autre bout de la pièce. Elle semble gravement blessée et saigne d'une blessure au bras qu'elle a bandé de gaze stérile. Dans son autre main, elle brandit un pied-de-biche.";
	try looking;
	increment the knownCommands of the player.
	
After eating scientifique:
	now the BlockChatterFlag is true;
	say "Vous dévorez le cerveau de la scientifique. Immédiatement vous voyez le monde d'un point de vue plus raffiné et érudit.[paragraph break]« [italic type]C'est fait ? demande la voix d'Isabelle avec hésitation.[line break]-- Oui, tu étais délicieuse, enthousiasme le souris.[line break]-- Le meilleur jusqu'ici, ajoute Lucky.[line break]-- Excuse mes co-esprits, ils manquent cruellement de tact, intervient la tranche de cerveau.[line break]-- Hé ! gémissent la souris et le chien.[line break]-- Sois la bienvenue, Isabelle, continue la tranche de cerveau. Laisse-moi te présenter notre petite troupe : voilà Lucky, le chien, et ici figure Le Marquis Des Souris (ou juste simplement [quotation mark]Souris[quotation mark] parce qu'il est plutôt modeste), et moi, je suis le nommé [quotation mark]tranche de cerveau[quotation mark]. On est à ta disposition.[line break]-- Bonjour, les gars, dit Isabelle avec chaleur.  »[paragraph break]";
	move the dépouille saignante du Docteur Rambaud to the sas;
	move the interphone to the sas;
	move the panneau électrique to escalier 1;
	move the unité de synthèse microfluidique to the Laboratoire Biochimique;
	increment the knownCommands of the player;
	increment the consciousness of the player.
		
Chapter Dialogue

Section Generate Dialogue

Every turn:
	if the curedFlag of the player is not true:
		if the disjoncteurs are not broken and the servomoteur is not broken and the player is in the Laboratoire Biochimique:
			now the BlockChatterFlag is true;
			say "L'appareil robotique émit un bip et remplit un flacon du fluide fluo vert. Vous le prenez anxieusement, portez un toast à votre propre santé, et buvez le remède à grandes gorgées.[paragraph break]« Je ne ressens rien, s'inquiète la tranche de cerveau.[line break]-- Attendez, rassure Isabelle.[line break]-- Moi non plus, opine la souris.[line break]-- Attendez, insiste la scientifique.[line break]-- Houlà ! s'exclame Lucky. Quelque chose commence à…[line break]-- C'est parti ! hurle le docteur.  »[paragraph break]Vous tremblez violentement et vous vous évanouissez. Lorsque vous vous levez, vous observez que votre peau a repris son teint naturel et que vous pouvez vous déplacer sans trébucher. Bref, vous êtes guéri.[paragraph break]";
			now the curedFlag of the player is true;
	if the BlockChatterFlag is false:
		if the consciousness of the player is:
			-- 1:
				if the number of entries in mouseDialogue is greater than zero:
					say "[italic type][entry 1 of mouseDialogue][roman type][paragraph break]";
					remove entry 1 from mouseDialogue;
			-- 2:
				if the number of entries in mouseDogDialogue is greater than zero:
					say "[italic type]« [entry 1 of mouseDogDialogue] »[roman type][paragraph break]";
					remove entry 1 from mouseDogDialogue;
			-- 3:
				if the number of entries in mouseDogGuardDialogue is greater than zero:
					say "[italic type]« [entry 1 of mouseDogGuardDialogue] »[roman type][paragraph break]";
					remove entry 1 from mouseDogGuardDialogue;
			-- 4:
				if the curedFlag of the player is true:
					if the number of entries in CuredDialogue is greater than zero:
						say "[italic type]« [entry 1 of CuredDialogue] »[roman type][paragraph break]";
						remove entry 1 from CuredDialogue;
				otherwise:
					if the number of entries in EverybodyDialogue is greater than zero:
						say "[italic type]« [entry 1 of EverybodyDialogue] »[roman type][paragraph break]";
						remove entry 1 from EverybodyDialogue;
	now the BlockChatterFlag is false.
	
Section Mouse Dialogue

mouseDialogue is a list of text that varies. 
	
mouseDialogue is {
"Quoi qu'il en soit, il me semble que j'ai beaucoup grandi, hein.",
"Je désire quelque chose fortement, mais j'ai du mal à dire quoi.",
"Voyons, quel sont mes envies habituelles ?",
"Dormir ? Non. Boire ? Non. Faire l'amour ? Non.[paragraph break]Mon dieu ! Non ? Est-ce que je suis malade ?",
"Eh bien, j'ai faim.",
"De quoi est-ce que j'ai envie de manger ? Cela m[apostrophe]échappe pour le moment.",
"Du fromage ? Non, pas vraiment.",
"Je cherche quelque chose fr plus moelleux, plus juteux.",
"Je le saurai quand je le verrai, je suppose."
}.

Section MouseDog Dialogue	
		
mouseDogDialogue is a list of text that varies. 

mouseDogDialogue is {
"Désolé[line break]-- Quoi, désolé ?[line break]-- Moi, je suis désolé de t'avoir mangé[line break]-- De m'avoir mangé ? Dis donc, qui es-tu ?[line break]-- La souris.",
"La souris ? Quelle souris ?[line break]-- La souris qui habite ici.[line break]-- La maudite souris qui vole toujours les bribes autour de mon distributeur ?[line break]-- Ouais, la même. Une fois de plus, je suis désolé de t'avoir dérangé.",
"Pas du tout. J'aurais fait pareil.[line break]-- Bon, merci.[line break]-- Dis, souris, as-tu un nom ?[line break]-- Non. Nous les souris n'ont pas les noms. Tu peux m'appeler simplement [quotation mark]Souris[quotation mark]. Et toi ? Comment tu t'appelles ?[line break]-- [quotation mark]Lucky[quotation mark]. C'est le nom que ma famille m'a donné avant que je sois arrivé ici. Les bourreaux me désignent [quotation mark]Sujet 205-Alpha[quotation mark], mais je préfère [quotation mark]Lucky[quotation mark].[line break]-- D'accord, Lucky.",
"Souris, peux-tu m'expliquer quelque chose ? Je suis toujours perplexe. Comment se fait-il que toi, un souris, un animal tout petit, puisse manger un chien comme moi, plusieurs fois ta taille ?[line break]-- Je me suis demandé la même chose. Tiens -- t'es un chien ? Je pensais que tu étais un loup ![line break]-- Non, un chien.[line break]-- Ah bon ?[line break]-- Oui. J'en suis certain.",
"Je n'arrive pas à comprendre exactement comment j'ai réussi à vous manger.[line break]-- Est-ce que tu te rappelles de l[apostrophe]événement ?[line break]-- J[apostrophe]étais pris d'une folle envie de cerveaux.[line break]-- Quel cerveau ?[line break]-- Dans ce cas, le tien.[line break]-- Ah, je vois… euh, non, pas vraiment.",
"As-tu toujours vécu ici, Souris ?[line break]-- Plusieurs générations de ma famille ont vécu ici, c'est notre propriété héréditaire. On le défend contre les envahisseurs, les souris des campagnes qui ne sont que des abruties et des voleuses.[line break]-- As-tu jamais vu le monde en dehors d'ici ?[line break]-- Je n'en ai envie. J'ai entendu des contes, bien sûr : le ciel, les nuages, les champs, mais rien de tout cela ne m'intéresse.",
"Et toi, Lucky ? Tu as mentionné une famille ? As-tu une femme (nous les souris ne croyons pas au mariage, mais j'ai entendu que les chiens sont plus traditionnels).[line break]-- Une famille, oui, mais pas de femme (bien qu'il y avait un caniche à côté… euh, mais c'est une autre histoire). Non, lorsque je parle de famille, il s'agit d'une famille humaine.",
"Tu étais leur esclave ? demande la souris.[line break]-- Non, ce n[apostrophe]était pas comme ça. J'ai joué avec les enfants, ils m'ont donné de la nourriture, ils m'ont caressé toute la journée, et j'avais même mon propre lit.[line break]-- Tu rêves. Je n'ai jamais rien vu de pareil. Les humains n'aiment pas les animaux. Ils essaient toujours de nous écraser sous leurs semelles !",
"Bah, tu ne connais que peu d'humains, réfute Lucky.[line break]-- Je n'ai aucune envie de les connaître de plus près.[line break]-- Tu aurais aimé ma famille.[line break]-- Alors, pourquoi as-tu quitté cette famille si remarquable ?[line break]-- Pas par choix. Nous étions dans un forêt, j'ai vu un écureuil, et je me suis perdu.[line break]-- Ne me parles pas d[apostrophe]écureuils. Ils sont pire que les souris sauvages !",
"Lucky, penses-tu que tu retrouveras un jour ta famille ?[line break]-- Je l'espère.[line break]-- Moi aussi. Je veux chasser les écureuils avec toi.[line break]-- Ça serait génial."
}


Section MouseDogGuard Dialogue

mouseDogGuardDialogue is a list of text that varies. 

mouseDogGuardDialogue is { 
"Il faut patrouiller ! ordonne une nouvelle voix[line break]-- Patrouiller ? Qu'est que ça veut dire ? demande la souris.[line break]-- Cela signifie marcher partout, pour sécuriser l'installation répond la voix.[line break]-- J'aime bien faire des promenades ! dit Lucky tout excité.",
"Si je puis poser une question, demande la souris, qui es-tu ?[line break]-- Mon nom est… euh… voyons… un instant… bonne question. En effet, je ne me souviens pas. Le nom m[apostrophe]échappe pour l'instant. Que proposerais-tu ?[line break]-- Appelons-le [quotation mark]La petite tranche de cerveau que nous avons trouvée dans le frigo et dont la saveur était un peu avariée[quotation mark], conseille le chien.[line break]-- Non, c'est vraiment trop long. Disons plutôt simplement [quotation mark]la tranche de cerveau[quotation mark]. Est-ce que ça te convient ?[line break]-- Oui, dit la tranche de cerveau, de toute manière, j'ai un préférence pour les noms courts.", 
"Avez-vous aussi des noms ? questionne la tranche de cerveau.[line break]-- Oui, répond le chien. Pardonne notre manque de politesse. Je m'appelle Lucky et mon amie la souris est tout simplement appelée [quotation mark]Souris[quotation mark].[line break]-- C'est exact, confirme la souris.[line break]-- C'est un plaisir de faire votre connaissance, mes nouveaux amis.", 
"Alors, tranche de cerveau, je me demande quelle sorte d'animal tu étais avant d'arriver ici. J[apostrophe]étais un chien et la souris a toujours été une souris.[line break]-- J[apostrophe]étais quelque chose d'autre qu'une tranche de cerveau auparavant ?[line break]-- Il me semble que tu étais un frigo, suggère la souris. J'ai mangé le cerveau d'un chien est Lucky est apparu. Puis nous avons ouvert et mangé un frigo et tu es apparu.[line break]-- Je ne crois pas que ça fonctionne comme ça, murmure Lucky.", 
"Quand tu es arrivé, tu as dit qu'il fallait [quotation mark]sécuriser l'installation[quotation mark]. Qu'est-ce que ça veut dire ? demande Lucky. [line break]-- Cela signifie que nous devons regarder autour de l'installation pour la protéger contre tout menace. [line break] -- OK, dit la souris en essayant de suivre la conversation, mais c'est quoi une installation ? [line break] -- C'est le complexe des ... euh ... c'est un endroit où ... tout le monde travaille pour ... euh. Voilà où nous en sommes, conclut la tranche de cerveau.", 
"De quelle menace parles-tu ? demande la souris[line break]-- Franchement, je ne sais pas, répond la tranche de cerveau. Encore, je ne me souviens pas. Mais il y en a beaucoup, j'en suis certain.[line break]-- Tu as l'air parano, dit le chien.[line break]-- Peut-être que si j'avais mes souvenirs, je pourrais… non. Ils sont perdus.", 
"Peut-être qu'il y a un moyen de récupérer vos souvenirs, suggère Lucky.[line break]-- Comment ? J'ai beaucoup essayé et rien ne me vient à l'esprit.[line break]-- Probablement parce tu n'es qu'une petite tranche de cerveau, suppose la souris.  Si nous pouvons trouver le reste du cerveau, qui doit être ici quelque part, nous pourrions le manger pour obtenir les souvenirs manquants, non ?[line break]-- Hein ? Tu penses ? questionne la tranche de cerveau.[line break]-- Oui, certainement, rassure le chien.", 
"Et si le reste du cerveau nous trouve avant que nous le trouvions ? demande la souris.[line break]-- Et alors ? dit Lucky.[line break]-- Le reste de cerveau peut nous manger plutôt que nous le mangions, répond la souris.[line break]-- Ça changera quoi, exactement ? demande la tranche de cerveau. Nous serons tous ensemble en tout cas.[line break]-- Oui. Mais. D'habitude je préfère manger les autres avant qu'ils me mangent.", 
"Savez-vous ce dont nous avons besoin ? interroge Lucky. Un plan.[line break]-- Oui, je suis d'accord avec toi, dit la souris. Que proposes-tu ?[line break] --Numéro un, explique le chien, il faut explorer un peu plus, comme la tranche de cerveau a dit, pour sécuriser l'installation. Numéro deux : Chercher le cerveau manquant. Et numéro… euh, le numéro qui suit numéro deux : nous devons nous échapper d'ici.[line break]-- Génial ! Tu es un génie, Lucky, dit la tranche de cerveau.",
"Dehors ? demande la souris. Je suis tout à fait confortable ici. Qu'offre le monde extérieur ? Rien que des ennuis. J'ai hérités des terres ici et même un titre -- vous rendez-vous compte que je suis un marquis ? Oui, je ne plaisante pas. Je suis le dix-huitième marquis de ma ligne. Tu veux que je sacrifie tout ça ?[line break]-- Il y a un monde entier ! plaide le chien[line break]-- J'ai vécu là, ajoute la tranche de cerveau. Je crois que je vivais non loin d'ici avec ma copine… comment s'appelait-elle ?", 
"Une petite amie, hein ? demande Lucky, intéressé.[line break]-- Raconte nous les détails ! encourage la souris.[line break]-- À vraiment dire, je ne me souviens pas beaucoup, pas même son nom. Cependant je me rappelle qu'elle était bigrement intelligente… elle avait un bon sens de l'humour et un rire plein d'entrain… et des yeux en amande d'un violet profond… et elle avait des grandes… euh… Zut. J'ai oublié le mot.",
"Penses-tu que tu peux trouver votre maison si nous parvenons à sortir de l'installation ? demande Lucky.[line break]-- Ah oui, assurément. Il n'y a qu'une dizaine de pièces de négocier et nous serons dehors. La maison est toute proche. On a juste à suivre la rue… je ne me souviens pas du nom de la rue, cependant je la reconnaîtrai.[line break]-- Ton amnésie ne m'inspire pas confiance, plaisante la souris.[line break]-- Si nous trouvons le reste du cerveau au cours de notre évasion tout sera réglé.", 
"Si nous quittons l'installation, pourrais-tu aider Lucky à retrouver sa famille ? demande la souris.[line break]-- As-tu aussi une maison près d'ici ? continue la tranche de cerveau.[line break]-- Probablement, répond le chien, ma famille vit dans une jolie maison blanche entourée de grandes arbres.[line break]-- Y-a-t-il des chats ? interrompt la souris.[line break]-- Aucune, dit fièrement le chien.",
"J'avais une pensée troublante, dit la souris.[line break]-- Quoi ? interroge la tranche de cerveau.[line break]-- Qu'allons-nous faire si nous rencontrons un chat ?[line break]-- Nous lui mangerons le cerveau, non ? répond la tranche de cerveau. Où en est le problème ?[line break]Oh, je vois, dis le chien. On aura les pensées d'un chat avec nous. Ça serait plutôt insupportable.[line break]-- Carrément, dit la souris. Je suis d'accord de le manger, mais je refuse d'entendre les pensées d'un chat. C'est trop.", 
"Quand nous serons dehors, que ferons-nous pour retrouver la maison de Lucky, demande la souris.[line break]-- D'abord mettons le cap vers chez moi, répond la tranche de cerveau. J'ai une voiture et cela aidera beaucoup à chercher rapidement.[line break]-- Tu ne te souviens pas de ton nom, mais tu sais conduire ? demande la souris.[line break]-- Sinon, je le peux, dit Lucky. J'ai vu les humains le faire de nombreuses fois. Conduire ne me semble trop compliqué.",
"Mes amis, dit le tranche de cerveau, j'ai de plus en plus de peine à mettre de l'ordre dans mes pensées ; puis-je vous proposer une petite pause dans notre conversation pour ramasser mes forces ?[line break]-- Oui, moi aussi, dit la souris. J'aime beaucoup causer avec vous, mais j'ai un sacré mal de tête. Un repos me ferait du bien.[line break]-- Je suis d'accord, dit Lucky. J'aime bien courir avec la meute, mais un peu de temps mort me conviendrait.[line break]-- Bonne nuit, tous, dit la souris."
}

Section Everybody Dialogue

EverybodyDialogue is a list of text that varies. 

EverybodyDialogue is { "Quelle sensation incroyable ! délire la scientifique.[line break]-- On s'y habitue après un temps, dit la souris laconiquement.[line break]-- Dis-lui le plan, Lucky, demande la tranche de cerveau. Je ne me rappelle pas de toutes les étapes.[line break]-- D'accord, dit le chien, numéro un : pour commencer nous avons besoin de trouver le reste du cerveau de Julien, numéro deux : quitterons l'installation, enfin, numéro plus que deux : nous chercherons ma famille.",
"Euh.  D'accord, dit Isabelle. Mais en premier lieu il faut sortir de la pièce où vous m'avez trouvé, et pour ce faire, il faut synthétiser le remède, propose la scientifique.[line break]-- Impossible, dit la souris d'un ton définitif.[line break]-- Pourquoi ? demande Isabelle bouleversée.[line break]-- C'est une question de mathématiques, répond la souris d'un air pointilleux. Le plan de Lucky commence déjà avec numéro un. Il n'y a rien avant le numéro un.[line break]-- Numéro zéro ? suggère Isabelle.[paragraph break][roman type]Silence radio.[paragraph break][italic type]-- OK, dit Isabelle, renumérotons… un : faire le remède, deux : sortir de l'installation, trois : chercher la famille de Lucky. Ça vous convient ?[line break]-- Oui, accorde Lucky, ça l'air raisonnable.[line break]-- Et mathématiquement correct, ajoute la souris.",
"Attends, dit Lucky, toujours comptant les étapes du plan proposé par Isabelle. Que ferons-nous en ce qui concerne le cerveau manquant ? Si j'ai bien compris, nous en aurons besoin pour reconstituer Julien.[line break]-- Malheureusement, répond Isabelle, la tranche de cerveau est maintenant tout qui reste de Julien. Nous utilisons en ce moment les voies neurales du reste de son cerveau, mais à l'exception de la tranche récupérée rien ne reste de sa personnalité. C'est une perte grave, particulièrement pour moi.[line break]-- Pourquoi pour toi ? demande la souris.[line break]-- Parce que nous étions fiancés, Julien et moi.[line break]-- Désolé, dit la tranche de cerveau. Si je pouvais me souvenir de toi, je suis sûr que je t'aurais aimé.",
"Isabelle, penses-tu que nous allons un jour trouver ma famille ? demande Lucky.[line break]-- Oui, j'en suis certain.[line break]-- Comment peux-tu être si sûr ? demande la tranche de cerveau.[line break]-- Parce que je connais la famille : Jean-Paul et Alexandra Drummond et leurs filles, Léa et Camille. Ils ne vivent qu[apostrophe]à une centaine de mètres de moi et Julien.[line break]-- Oui, j'ai entendu ces noms souvent à la maison. Tu as assurément raison, mais comment peux-tu connaître de qui je parlais ? demande Lucky.[line break]-- Je les ai vus dans vos pensées, dit la scientifique.",
"Tu dis que tu as vu dans les pensées de Lucky ? demande la souris. Comment est-ce possible ?[line break]-- Nous faisons tous partie d'un seul cerveau maintenant. Nos esprits sont d'une manière ou d'une autre mélangés. Je peux accéder à ses pensées et il peut également accéder aux miennes.[line break]-- Cool ! dit le souris. Nous avons des superpouvoirs !",
"Je trouve cela un peu improbable, dit le chien. Si tu peux voir dans mes pensées, à quel numéro est-ce que je pense en ce moment ?[line break]-- La scientifique réfléchit un moment et elle dit, au numéro un.[line break]-- Oui, c'est exact, admet le chien, mais peut-être que tu y es arrivé par hasard. Essaie encore une fois…[line break]-- Tu penses au numéro deux, dit la scientifique avec conviction.[line break]-- Oui encore, dit le chien satisfait.[line break]-- Mais, objecte le souris, Lucky ne connait que deux numéros… qu'est-ce que ça prouve ?",
"D'accord, dit la scientifique patiemment, prenons un autre exemple. Souris, je pense en ce moment à mon petit déjeuner. Je m'efforce de le visualiser avec le plus de détails possibles… tente de le voir.[line break]-- Ou ? demande la souris. Je ne sens rien.[line break]-- Ah, dit Isabelle. Voilà le problème. Je pensais en termes visuels. Laisse-moi imaginer son odeur, sa saveur… [line break]-- Oh ! Oui, oui. Je commence à l'apercevoir, dit la souris. Mon dieu, c[apostrophe]était un énorme repas ! C'est merveilleux ! Puis-je vivre de nouveau chaque repas de votre vie ? Pince-moi, je rêve.",
"Même si je trouve le souvenir de votre repas délicieux, en ce moment je ne veux rien d'autre que des cerveaux. C'est drôle, non ? remarque la souris.[line break]-- Moi aussi, dit la tranche de cerveau.[line break]-- En fait, c'est tout à fait normal pour ceux comme nous qui fonctionnent en mode zombie, répond la scientifique.[line break]-- Nous sommes des zombies ? interroge Lucky.[line break]-- Non, précise la scientifique, ensemble nous constituons un seul zombie, partageant le corps de Julien.[line break]-- Au moins je suis dans mon propre corps, dit la tranche de cerveau.", 
"D'autres zombies sont-ils aussi agréable que nous ? demande Lucky.[line break]-- Non, répond Isabelle, ce sont des monstres. Nous sommes quelque chose à part.  Je dirais que nous sommes un demi-zombie, ayant reçu une dose d'un remède partiellement efficace. Quant aux autres zombies, ils ne sont pas capable de parler, de penser, en somme, de faire autrement que manger des cerveaux.[line break]-- Et ça pose un problème ? demande la souris.[line break]-- C'est rien de le dire, répond la scientifique. Les zombies ont presque détruit la civilisation !", 
"Comment est-ce possible ? dit la tranche de cerveau.[line break]-- Le virus a une virulence sans précédent, répond la scientifique. Le moindre griffure et c'est la contamination assurée. Les premiers cas ont été rapportés au Cambodge et vingt-quatre heures après des milliers des cas sont apparus tout autour du monde grâce aux transports aériens. La semaine suivante, c[apostrophe]était un capharnaüm à l[apostrophe]échelle mondiale. Sans électricité, eau et nourriture les grandes cités se sont effondrées presque immédiatement. Des feux ont balayé la campagnes. Il ne reste que quelques poches d'humanité.",
"Et quant aux animaux ? demande la souris. Étaient-ils touchés ?[line break]-- En fait, répond Isabelle, nous pensons que la maladie est d'origin canine. Avant la perte de communications avec l'Institut Pasteur à Hô-Chi-Minh-Ville, ils ont isolé une souche mutante de la rage qui a déclenché la pandémie.[line break]-- La rage ! dit Lucky, frappé de terreur. Il n'y a rien de plus terrifiant ![line break]-- Jusqu[apostrophe]à présent, précise la tranche de cerveau.",
"Si le zombisme s'est propagé si vite, s'inquiète Lucky, penses-tu que ma famille est survécu ?[line break]-- Oui, je le sais, rassure la scientifique. Les Drummonds travaillent ici, dans l'installation et tous les travailleurs sont hébergés dans l'enceinte. Tu n'es pas loin d'eux. [line break]-- Génial ! dit le chien.", 
"Isabelle, dit la souris, si le remède fonctionne comme prévu, que deviendrons-nous ?[line break]-- Dans quel sens ?[line break]-- Est-ce que nous restons les individus avec nos propres pensées, ou crois-tu que nous allons fusionner dans une seul esprit ?[line break]-- Impossible à prédire. Jusqu[apostrophe]à maintenant, nous avons mené des vies individuelles. Tu as tes souvenirs et j'ai les miens, mais à l'avenir nous allons vivre les mêmes événements du même point de vue. Nous partagerons un seul corps et c'est possible que nous devenions un seul esprit après un certain temps.", 
"Je n'ai jamais souhaité être autre chose qu'une souris. Je trouve cela terrifiant, que mon esprit puisse être dilué.[line break]-- Mais vois les avantages, dit Lucky. Regarde dans mes pensés -- voici comment je me sens en chassant un écureuil. Et voici la sensation d[apostrophe]être gratté entre les oreilles.[line break]-- Oui, je suppose.[line break]-- Et ici, dit la scientifique, je te montre la Terre vue depuis l'espace -- quelque chose qu'aucune souris n'a jamais vu.[line break]-- Heu. C'est impressionnant. Et je suppose que de mon coté j'ai quelque souvenirs à partager aussi : le chaleur de dormir avec les autres souris, la joie de voler les bribes du distributeur de Lucky…[line break]-- Hé ! hurle le chien.", 
"Quand j'ai vu le corps de Julien entrer dans le sas, j'ai remarqué qu'il se déplaçait avec difficulté, marchant lentement et trébuchant, dit la scientifique.[line break]-- Oui, je sais comment marcher, dit la tranche de cerveau, mais je le trouve désespérément difficile de le mettre en pratique.[line break]-- La souris n'aide pas, commente Lucky. Il bouge toujours les jambes.[line break]-- Moi ? dit le souris avec indignation. C'est toi qui veut toujours aller à quatre pattes.[line break]-- OK, dit la scientifique, puis-je vous convaincre qu'une seule personne doit pilote le corps à la fois ?[line break]-- Oui, certainement, acquiesce la tranche de cerveau. Le volant est à toi.", 
"D'accord, dit la scientifique. Je m'empresse de faire ce qu'il faut pour obtenir le remède.[line break]-- Bon. Assez de papotage mes amis, laissez-la se concentrer, conseille la tranche de cerveau.[line break]-- Oui, d'accord, disent le chien et la souris."
}

Section Cured Dialogue

CuredDialogue is a list of text that varies. 
	
CuredDialogue is { 
"C'est fait, dit la scientifique. Je ferai l'appel : Lucky ?[line break]-- Présent.[line break]-- Le Marquis de Souris ?[line break]-- Oui. Ici.[line break]-- Et la tranche de cerveau de Julien ?[line break]-- Présent.[line break]-- Bon, dit Isabelle, il me semble que nous sommes tous arrivés sauf et sain.",
"Et maintenant on quitte l'installation ? suggère le chien.[line break]-- Oui, dit Isabelle[line break]-- Mais la porte extérieure est verrouillée. Personne ne peut l'ouvrir à part le colonel Greillier dans la salle de contrôle, dit la tranche de cerveau.[line break]-- Oui, nous devons le convaincre de l'ouvrir, acquiesce la scientifique.",
"Dis, ça me surprend un peu que tu te souviennes du colonel Greillier. J'ai pensé que tu avait oublié les noms.[line break]-- Du colonel ? demande la tranche de cerveau. Comment puis-je oublier le nom de ton boss ? C[apostrophe]était juste la dernière semaine qu'il est tombé dans la piscine pendant sa fête d'anniversaire. Je suppose que nous étions tous un tantinet bourrés ![line break]-- C'est quoi bourré ? demande la souris. Oh, je vois dans vos pensées. Ça a l'air amusant.[line break]-- Patientez un instant, Souris, dit Isabelle. Julien, c[apostrophe]était un souvenir compliqué. Penses-tu que ta mémoire est de retour ?[line break]-- Hein ? Comment pourrais-je savoir ?",
"Julien, dit la scientifique, qu'est-ce que tu m'a donné en cadeau pour notre premier Noël ?[line break]-- Des gants ?[line break]-- Et ils était…[line break]-- Bien trop grands ! Oui, je les avais achetés pour mon frère, mais quand tu m'as donné un cadeau et je n'avais rien pour toi… oui… euh, es-tu toujours vexée ?[line break]-- Non, pas vraiment. Je testais juste ta mémoire.",
"Donne-moi un autre essai ![line break]-- D'accord. Comme est-ce que tu m'appelles quand nous sommes seuls ?[line break]-- Isabelle ?[line break]-- Non, réfléchis ! Quand c'est juste nous…[line break]-- Je préfère de ne pas le dire devant Lucky et la souris.[line break]-- Vas-y ! dit le chien. Nous partageons un esprit maintenant, il n'y a pas de vrais secrets entre nous.[line break]-- Très bien, dit Julien, je t'appelle mon lapin.[line break]-- Lapin ? dit la souris. Elle est un lapin ? Quoi ? Je suis totalement confus.",
"Bon, Julien, il me semble que tu es en train de récupérer ta mémoire, dit la scientifique.[line break]-- Tu penses ? Pourtant tu m'as dit que je ne suis qu'une toute petite biopsie de cerveau. Est-il possible que les souvenirs soient les tiens et que je lise dans tes pensées ?[line break]-- Je dirais qu'une toute petite biopsie ne serait  guère capable de hasarder une telle hypothèse, il s'agit plutôt d'un cerveau entier en pleine forme.",
"Si j'ai bien compris, dit Lucky, tu as dit que les cerveaux des zombies sont complètement effacés par le virus. Vu que rien ne reste de son cerveau, comment se fait-il qu'il peut fonctionner maintenant ?[line break]-- Nous n'avons jamais eu un pareil cas pour étudier, répond la scientifique. Il est temps de réviser notre compréhension du processus : il semble que les cerveaux ne sont pas détruits, mais plutôt supprimés. Ses voies neuronales ont toujours étés intactes. En fait, c'est grâce à eux que nous continuons à exister. Nous nous servons de ses voies pour formuler nos propres pensées.",
"C'est super ! dit Julien. On peut restaurer tous les zombies ![line break]-- Mon dieu, Julien, vous avez raison. Ils ne sont plus perdus, répond la scientifique. Pour la première fois, il y a un espoir de restaurer le monde et terminer ce cauchemar.[line break]-- Même les chiens infectés ? demande Lucky.[line break]-- Oui, y compris les chien et toutes les autres espèces infectés par le virus, répond la scientifique.",
"Alors, que faire ? demande la souris.[line break]-- Julian, dit Isabelle, il faut parler avec le colonel pour le convaincre que tu es guéri et que nous possédons un remède contre le virus.[line break]-- D'accord. Je ferai de mon mieux, dit Julien.[line break]-- Allons-y ! crie la souris."
}.

Chapter The Void

The void is a room.

The petite créature grise is an edible female thing. It is in the void.

The dépouille saignante du Docteur Rambaud is a female thing in the void. The indefinite article of dépouille saignante du Docteur Rambaud is "la".

The interphone is a buttoned thing in the void. The interphone can be live. The interphone is not live.

Instead of pushing the interphone:[only present at consciousness 4]
	if the interphone is not live:
		say "Une petite LED rouge sur l'interphone s'allume indiquant que vous êtes en direct avec la salle de contrôle.";
		now the interphone is live;
	otherwise:
		say "Vous avez déjà activé l'interphone et sa LED reste allumée."

The panneau électrique is an openable closed container in the void. The disjoncteurs are in the panneau électrique. The disjoncteurs are plural-named. The disjoncteurs are broken. The indefinite article of disjoncteurs is "des". The printed name of the disjoncteurs is "disjoncteurs[if the disjoncteurs are broken] sautés[end if]".

Instead of touching the disjoncteurs:
	say "Vous remettez les disjoncteurs";
	now the disjoncteurs are not broken;
	if the servomoteur is broken:
		say ".[paragraph break]Le panneau électrique fait un bruit sec et vous constatez que les disjoncteurs ont de nouveau sautés";
		now the disjoncteurs are broken;
	say "."

The unité de synthèse microfluidique is an openable closed container in the void. 

The servomoteur is in the unité de synthèse microfluidique. The servomoteur is broken. The printed name of the servomoteur is "[pnServo]".

To say pnServo:
	say "servomoteur";
	if the servomoteur is not broken:
		say " que vous avez réparé".

After opening the unité de synthèse microfluidique:
	say "Vous ouvrez le panneau d'accès et tout de suite reconnaissez le problème : un écaillee de soudure est tombée sur les terminaux d'un servomoteur, créant un court-circuit."
	
Instead of touching the servomoteur:
	now the servomoteur is not broken;
	say "Vous écartez le morceau de soudure. La machine doit fonctionner normalement maintenant."

Chapter End Game

To terminate the game:
	repeat with N running from 1 to 10:
		now the tint of the button in row N of the Table of Glimmr Buttons is g-black;
		now the linked replacement-command of the button in row N of the Table of Glimmr Buttons is "";
	follow the refresh windows rule;
	now the command prompt is "";
	say "[VictoryText]".
		
To say VictoryText:
	say "[paragraph break][bold type]        *** VOUS AVEZ GAGNÉ ***[roman type][paragraph break]Vous avez sauvé le monde du fléau du virus zombie777.[paragraph break][bold type]>infos[roman type][line break]Ce jeu participe au Concours Francophone de Fictions Interactives (2017). Il a été écrit en Inform 7.[paragraph break][bold type]>remerciements[roman type][paragraph break]Je voudrais remercier :[paragraph break]* Les organisateurs du concours.[paragraph break]* Graham Nelson pour avoir conçu et écrit Inform 7.[paragraph break]* Les auteurs des modules utilisés dans cette oeuvre : Eric Forgeot, Emily Short et Erik Temple.[paragraph break]* Ben Collins-Sussman, qui a peint la couverture à l'aquarelle.[paragraph break]* Les relecteurs et beta-testeurs extraordinaires.[paragraph break][bold type]FIN."
	
Chapter Testing

Test me with "est / ouest / manger / est / ouvrir / nord / ouvrir / manger / pousser / sud / pousser / est / pousser / ouest / sud / ouvrir / manger / manger / manger / nord / ouvrir / nord / ouvrir / ouvrir / manger / sud / ouest / déverrouiller / ouvrir / ouest / déverrouiller / ouvrir / nord / nord / déverrouiller / ouvrir / nord / parler / parler / parler / parler / parler / manger / sud / sud / sud / est / pousser / est / pousser / ouest / déverrouiller / ouvrir / sud / ouvrir / réparer / nord / pousser / est / pousser / ouest / ouest / nord / ouvrir / réparer / sud / est / pousser / est / pousser / ouest / sud / nord / pousser / est / pousser / ouest / ouest / nord / nord / nord / pousser / parler / parler / parler /  parler ".

Test full with "est / est / ouest / ouest / manger / est / ouest / ouvrir / est / ouvrir / nord / sud / ouest / sud / est / nord / z / z / z / z / z / z / z / z / z / z / z / manger / ouvrir / manger / pousser / manger / nord / sud / ouest / ouest / est / est / pousser / est / pousser / ouest / ouest / sud / ouvrir / pousser / manger / manger / manger / manger / nord / ouest / nord / nord / ouvrir / nord / manger / pousser / ouvrir / ouvrir / manger / sud / sud / ouvrir / pousser / nord / ouest / déverrouiller / ouest / ouvrir / ouest / nord / déverrouiller / nord / ouvrir / nord / nord / nord / nord / déverrouiller / nord / ouvrir / nord / manger / manger / manger / manger / manger / manger / pousser / déverrouiller / nord / parler / parler / parler / parler / parler / parler / manger / parler / pousser / parler / pousser / pousser / parler / nord / sud / sud / sud / ouvrir / réparer / ouvrir / réparer / pousser / sud / est / sud / pousser / ouvrir / manger / nord / nord / réparer / sud / pousser / est / pousser / ouest / ouest / est / nord / pousser / manger / réparer / sud / sud / déverrouiller / ouvrir / sud / réparer / ouvrir / réparer / nord / pousser / est / pousser / ouest / ouest / nord / ouvrir / réparer / sud / est / est / pousser / est / pousser / ouest / sud / réparer / nord / pousser / est / pousser / ouest / sud / nord / ouest / nord / nord / nord / manger /parler / pousser / parler / parler / sud / nord / parler / parler ".



