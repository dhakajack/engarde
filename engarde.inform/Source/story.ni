"En Garde" by Tana Ostrova

The story headline is "A voyager forever mindless".
The story genre is "horror".
The release number is 1.
The story creation year is 2017.
The story description is "The one thing you don't miss is memory."

Include Basic Screen Effects by Emily Short.
Include Glimmr Canvas-Based Drawing by Erik Temple.
Include Glimmr Graphic Hyperlinks by Erik Temple.
Include Glimmr Bitmap Font by Erik Temple.
Include Glulx Input Loops by Erik Temple.

Use full-length room descriptions.
Use no scoring.

Release along with cover art.

Chapter Globals

BlockChatterFlag is a truth state that varies. BlockChatterFlag is false.

Chapter The Player

The player has a number called consciousness. The consciousness of the player is 0. The curedFlag of the player is a truth state that varies. The curedFlag of the player is false. The player has a number called conversations. The conversations of the player is 0.

[Level					after eating….
0					nothing
1					a mouse
2					a dog
3					a slice of guard brain
4					the scientist's brain
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

[TODO: re-enable to kill keyboard. 
The focal event type of main input is hyperlink-event.]

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
	say "[line break][italic type]Where am I? For that matter, who am I?[roman type][paragraph break]You wake up alone in a plain room with a bluish hue.[paragraph break][italic type]Why can't I remember anything?[paragraph break]I've got to concentrate! What happened? Come on. Think! Think![paragraph break]In any case, the solution isn't here -- I'll have to have a look around."
	
Chapter Geography

Section Location Generalities

The printed name of a room is usually "Here".

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
			say "This door is secured with an electronic lock.";
		otherwise:
			if la porte is buttoned:
				say "First, you have to ";
				if the player is in an elevator:
					say "indicate the destination floor.";
				otherwise:
					say "call the elevator";
			otherwise:
				say "The door is closed"
			
To say bougePas:
	say "The wall does not budge"
			
Section Bloc Opératoire

Bloc Opératoire is a room. The description of Bloc Opératoire is "[descBlocOperatoire]." Couloir 2 is east from Bloc Opératoire. The player is in Bloc Opératoire. The printed name of the Bloc Opératoire is "[pnBlocOpératoire]".

To say descBlocOperatoire:
	if the consciousness of the player is:
		-- 0:
			say "A dark room[one of]. Nothing interesting here[or][stopping]";
		-- 1:
			say "There's a bit of blood here -- a huge, blue room with metallic walls";
		-- 2:
			say "The blue room in which humans cut up animals and remove their guts";
		-- 3:
			say "The operating table stands in the middle of the blue room, surrounded by surgical equipment. The exit leads to the corridor";
		-- 4:
			say "The operating table in the middle of the room is covered in blue surgical drapes. The table has various straps and contraptions to immobilize animals during surgery. Just next to the table is an anaesthesia machine, with knobs and dials, and tubes leading to the ceiling. Just above it, there are several vital signs monitors, all of which are off at present. A portable radiography machine has been wheeled in next to the table.[paragraph break]The central corridor for level two is just off to the east".
			
To say pnBlocOpératoire:
	if the consciousness of the player is:
		-- 0:
			say "The blue place";
		-- 1:
			say "The scary place";
		-- 2:
			say "The torture chamber";
		-- 3:
			say "Operating room";
		-- 4:
			say "Surgical theater".

Section Couloir 2

Couloir 2 is a room. The description of Couloir 2 is "[descCouloir2]." The labZooDoor is a door. It is north of Couloir 2 and south of Laboratoire Zoologique. The printed name of Couloir 2 is "[pnCouloir2]".

To say descCouloir2:
	if the consciousness of the player is:
		-- 0:
			say "A white, unfurnished hallway";
		-- 1:
			say "A great white corridor that connects the scary place to the west with the den of the fierce wolf to the north" ;
		-- 2:
			say "The hall that leads from my comfy nook to the north to the chamber of horrors to the west";
			say "[liftDoorDogStatus]";
		-- 3:
			say "The central corridor for level two. The operating room is to the west, the kennel to the north, the lab to the south, and the elevator to the east";
		-- 4:
			say "The central corridor for level two of the research complex. The operating theater is to the west, the animal laboratory is to the north, the biochemical synthesis laboratory to the south, and the elevator to the east".
			
To say liftDoorDogStatus:
	if the door east from the location is closed:
		say ". A red button shines on the wall to the east";
	otherwise:
		say ". The wall to the east has disappeared".
			
To say pnCouloir2:
	if the consciousness of the player is:
		-- 0:
			say "Corridor";
		-- 1:
			say "Great Hall";
		-- 2:
			say "Dangerous Passage";
		-- 3:
			say "Corridor, Level 2";
		-- 4:
			say "Level 2: Physiological Experiments".
	
		
After going east from Couloir 2 when the ascenseur2door is open for the first time:
	now the BlockChatterFlag is true;
	try looking;
	say "[italic type][quotation mark]Lucky, how did you know how to open the magic box?[quotation mark][line break][quotation mark]I saw a button. I pushed it. That's what I do. So, what's all this about a [apostrophe]magic box[apostrophe]?[quotation mark][line break][quotation mark]The giants… [quotation mark][line break][quotation mark]You mean the humans?[quotation mark][line break][quotation mark]Sure, probably. Anyhow, the humans go into the box and they disappear. Later, other humans appear in the same box. It's got to be magic.[quotation mark][line break][quotation mark]Hmm. We'll see about that.[quotation mark][roman type][paragraph break]".
			

Section Laboratoire Zoologique

Laboratoire Zoologique is a room. The description of Laboratoire Zoologique is "[descLabZoo]." The printed name of Laboratoire Zoologique is "[pnLabZoo]".

To say descLabZoo:
	if the consciousness of the player is:
		-- 1:
			say "From his cage, the vicious wolf stares at you";
		-- 2:
			say "The room in which you were taught to press a button to get treats out of the reward machine";
		-- 3:
			say "A cage takes up half the space in this room; the rest is dedicated to animal training equipment";
		-- 4:
			say "Animals are kept here in a large cage, which allows them to remain active during experiments that can last up to several weeks[one of]. You notice a sign taped to the cage: [apostrophe]Subject 205-Alpha[apostrophe][or][stopping]."
			

To say pnLabZoo:
	if the consciousness of the player is:
		-- 1:
			say "The wolf's den";
		-- 2:
			say "My home";
		-- 3:
			say "The kennel";
		-- 4:
			say "Zoological laboratory".
	
To say openNord:
		say "The wall to the north slides aside, revealing the room next door."
	
The cage is an openable closed  container in the Laboratoire Zoologique. 

The chien is an edible  thing. It is in the cage. The printed name of the chien is "[if the consciousness of the player is 1]wolf[otherwise]dog[end if]". The chien can be dead. The chien is not dead.

The corps de chien is a thing. It is in the void.

The distributeur de nourriture is in the Laboratoire Zoologique. It is buttoned. 

Instead of pushing the distributeur de nourriture:
	say "You press the red button. ";
	if the consciousness of the player is:
		-- 2:
			say "In reward, a few nuggets fall to the ground. You eat them, but they do not satisfy your hunger.";
		-- 3:
			say "You don't find the reward nuggets that fall at your feet the least bit appetizing.";
			move the tas de nourriture de chien to the Laboratoire Zoologique;
		-- 4:
			say "The operant conditioning device dispenses a few dog food pellets that pile up on the ground.";
			move the tas de nourriture de chien to the Laboratoire Zoologique.
			
The tas de nourriture de chien is in the void.

Every turn when the chien is in the cage and the player is in the Laboratoire Zoologique:
	if a random chance of 3 in 8 succeeds:
		say "The wolf [one of]barks loudly[or]chews the bars of his cage[or]scratches his hears[or]paces back and forth in his metal cage[or]howls with all his might[or]sniffs the air[or]sniffs his cage[or]sniffs himself[or]licks his paws[or]shows you his teeth[or]growls menacingly[or]ignores you[or]runs the length of his cage, eying you[in random order]."		
	
		 
Section Ascenseur 2

An elevator is a kind of room. The description of an elevator is "[descAscenseur1]." The printed name of an elevator is "[pnAsc]".

An elevatorDoor is a kind of door. ElevatorDoors are buttoned. 

To say pnAsc:
	if the consciousness of the player is 2:
		say "The little room";
		if Ascenseur 2 is visited:
			say " that vibrates";
	otherwise:
		say "The elevator".

Ascenseur 2 is an elevator. The Ascenseur2door is an elevatorDoor. It is east of Couloir 2 and west of Ascenseur 2. 

Instead of pushing an elevatorDoor:
	say "You push the button";
	if the player is in an elevator:
		if the consciousness of the player is:
			-- 2:
				say " with your snout[one of] (which seems shorter than you remember)[or][stopping] and notices a slight vibration. A moment later, the wall [apostrophe]opens upon a corridor to the west.";
			-- otherwise:
				say ", the elevator [if the location is Ascenseur 2]descends to the first level[otherwise]goes up to the second level[end if] and the doors open to the west."; 
		if the player is in Ascenseur 2:
			move the player to Ascenseur 1, without printing a room description;
			now Ascenseur1door is open;
		otherwise:
			move the player to Ascenseur 2, without printing a room description;
			now Ascenseur2door is open;
	otherwise:
		if the consciousness of the player is:
			-- 2:
				say " and the wall slides open, allowing you to proceed to the east.";
			-- otherwise:
				say " and the elevator door opens to the east.";
		if the player is in Couloir 2:
			now Ascenseur2door is open;
		otherwise:
			now Ascenseur1door is open.
		
After going east from Couloir 2:
		say "[portesReferment].";
		try looking;
		now the Ascenseur2door is closed.
		
To say portesReferment:
	say "You ";
	if the player is in an elevator:
		say "enter";
	otherwise:
		say "leave";
	say " and ";
	if the consciousness of the player is less than 3:
		say "the wall slides shut again";
	otherwise:
		say "the doors close";
	say " silently behind you".
	
After going west from an Ascenseur 2:
	say "[portesReferment].";
	try looking;
	now Ascenseur2door is closed.
	

Section Laboratoire Biochimique

Laboratoire Biochimique is a room. The description of Laboratoire Biochimique is "[descLabBio]." The printed name of the Laboratoire Biochimique is "[pnLabBio]". 

The labBioDoor is a  locked door. It is south of Couloir 2 and north of Laboratoire Biochimique. The printed name of the labBioDoor is "[pnLabBioDoor]".

To say descLabBio:
	if the consciousness of the player is:
		-- 3:
			say "The room is lined floor to ceiling with high-tech equipment. On a typical day, the room would be full of blinking lights and the whir of robotic actuators, but right now the equipment is dark and you don't hear the slightest sound";
		-- 4:
			if the disjoncteurs are not broken:
				say "With power restored, the room is now lit up like a Christmas tree, the computer fans are whirring, and the microfluidic station stands ready to carry out even the most complex biochemical syntheses";
			otherwise:
				say "The room is entirely dark, and neither the computers nor the robotic molecular synthesis unit are working. It's obvious that somewhere electrical power to the room has been cut".
					
To say pnLabBio:
	if the consciousness of the player is:
		-- 3:
			say "Biochemical Laboratory";
		-- 4:
			say "Molecular Synthesis Laboratory".
			
To say pnLabBioDoor:
	say "laboratory door".
	

Section Couloir 1

Couloir 1 is a room. The description of Couloir 1  is "[descCouloir1]." The printed name of Couloir 1 is "[pnCouloir1]".

To say descCouloir1:
	if the consciousness of the player is:
		-- 2:
			say "A corridor that looks like the [quotation mark]dangerous hallway[quotation mark] near your cage. You see [if labPathDoor is closed]and exit to the south and a sliding door to the north[otherwise]exits to the north and south[end if]";
			say "[liftDoorDogStatus]"; 
		-- 3:
			say "The level one central corridor lies between the restrooms to the south, showers to the west, a lab to the north, and the elevator to the east";
		-- 4:
			say "The central corridor on level one leads southward to the restroom, west to the decontamination suite, north to the histopathology laboratory, and east to the elevator".
		
To say pnCouloir1:
	if the consciousness of the player is:
		-- 2:
			say "New corridor";
		-- 3:
			say "Corridor, level one";
		-- 4:
			say "Level 1: Biocontainment".
			
After going east from Couloir 1:
		say "[portesReferment].";
		try looking;
		now the Ascenseur1door is closed.

Section Ascenseur 1

Ascenseur 1 is an elevator. The Ascenseur1door is an elevatorDoor. It is east of Couloir 1 and west of Ascenseur 1. 

To say descAscenseur1:
	say "A button shines on a panel".
	
After going west from an Ascenseur 1:
	say "[portesReferment].";
	try looking;
	now Ascenseur1door is closed.

Section Laboratoire De Pathologie

Laboratoire de Pathologie is a room. The description of Laboratoire de Pathologie is "[descLabPath]." The labPathDoor is a door. It is north of Couloir 1 and south of Laboratoire de Pathologie. The printed name of Laboratoire de Pathologie is "[pnLabPath]".

To say pnLabPath:
	if the consciousness of the player is:
		-- 2:
			say "The kitchen";
		-- 3: 
			say "The prep lab";
		-- 4:
			say "The histopathology laboratory".

To say descLabPath:
	If the consciousness of the player is:
		-- 2:
			say "[one of]This room reminds you of better times that you spent with your family -- from before you were kidnapped. Considering the counters, shelves full of food, sinks, and large appliances, there's no doubt in your mind that this is the most important room in the entire house: the kitchen[or]A typical kitchen, with black decor[stopping]";
		-- 3:
			say "This is where the researchers prepare microscope slides.[paragraph break]You recognize a meat slicer and a microwave oven, but most of the equipment on the counter doesn't look familiar to you";
		-- 4:
			say "An ultramodern laboratory dedicated to preparation and analysis of tissue samples".
	
The frigo is a closed openable container in the Laboratoire de Pathologie. The frigo is closed. The printed name of the frigo is "[pnFrigo]".

To say pnFrigo:
	if the consciousness of the player is:
		-- 2:
			say "fridge";
		-- 3:
			say "freezer";
		-- 4:
			say "minus 70 freezer for storing pathology specimens".

The boîte en plastique is a  closed openable container in the frigo. The boîte en plastique is closed.

The morceau de cerveau is a  edible thing in the boîte en plastique.

After opening the labPathDoor:
	say "[openNord]."
	
After going north from Couloir 1 when the labPathDoor is open for the first time:
	now the BlockChatterFlag is true;
	say "[italic type][quotation mark]Mmmmm![quotation mark] says Lucky, obviously excited.[quotation mark][line break][quotation mark]What are you so happy about?[quotation mark][line break][quotation mark]You see that box, there? That's the real magic box: the fridge![quotation mark][line break][quotation mark]Do we get in the fridge to go places?[quotation mark][line break][quotation mark]No, we eat what's inside it![quotation mark][roman type][paragraph break]";
	try looking.


Section Les Toilettes

Les Toilettes is a room. The description of Les Toilettes is "[descToilettes]." Les Toilettes are south of Couloir 1. The printed name of Les Toilettes is "[pnToilettes]". 

To say descToilettes:
	if the consciousness of the player is less than 3:
		say "The scent of urine is strong here[one of]. Many have marked their territory. This must be an extremely desirable location[or][stopping]";
	otherwise:
		say "A black and white tiled floor, cabinets, urinals and sinks"
	
To say pnToilettes:
	if the consciousness of the player is less than 3:
		say "The tiled room";
	otherwise:
		say "The toilets".
		
Instead of simplePushing when the player is in les Toilettes:
	if the consciousness of the player is less than 3:
		say "you press a metal button and immediately hear a loud sound.";
	otherwise:
		say "You pulll the flush lever."
		
Instead of simpleOpening when the player is in Les Toilettes:
	if the consciousness of the player is less than 3:
		say "[if the potty is in Les Toilettes]The water bowl is already open[otherwise]Having lifted the cover, you reveal a bowl full of water[end if].";
	otherwise:
		say "[if the potty is in Les Toilettes]You have already lifted[otherwise]You lift[end if] the toilet seat cover.";
	now the potty is in Les Toilettes.
	
The potty is a  thing in the void. The printed name of the potty is "[pnPotty]".

To say pnPotty:
	if the consciousness of the player is less than 3:
		say "bowl full of water";
	otherwise:
		say "toilet (the cover of which has been lifted)". 
		
Instead of simpleEating when the player is in Les Toilettes:
	if the potty is in the void:
		continue the action;
	otherwise:
		if the consciousness of the player is:
			-- 2:
				say "You [one of]lap up the water in the bowl. It's refreshing[or]you're not really thirsty, but you drink some water[or]you are no longer thirsty having already guzzled down a few liters of water[stopping].";
			-- 3:
				say "No, that would be disgusting[one of] (even for someone who eats brains)[or][stopping]."; 
			-- 4:
				say "Do you have any idea how many species are pathogenic bacteria live in the water? No way."
				
After going south from Couloir 1 when the consciousness of the player is 3 for the first time:
		now the BlockChatterFlag is true;
		say "As you enter the bathroom, you catch some movement out of the corner of your eye.[paragraph break][italic type]Is somebody else here?[roman type][paragraph break]A burly man dressed in a tattered uniform stares at you with unblinking eyes. His pale skin, rheumy eyes and sunken cheeks call to mind a cadaver.[paragraph break]This awkward encounter goes on for several minutes before you realize that you are staring at your own reflection in a mirror.";
		try looking.
	
After going south from Couloir 1 when the consciousness of the player is 4 for the first time:
	now the BlockChatterFlag is true;
	say "You see your reflection in a mirror and give yourself a long, hard look. You immediately recognize Julien, dressed in his blue guard uniform and despite all odds, still wearing his official hat.";
	try looking.

Section Salle de Décontamination

Salle de Décontamination is a room. The description of Salle de Décontamination is "[descDecon]." The printed name of the Salle de Décontamination is "[pnDecon]".

The deconDoor is a  locked door. It is west of Couloir 1 and east of Salle de Décontamination. The printed name of the deconDoor is "[pnDeconDoor]".

To say descDecon:
	if the consciousness of the player is:
		-- 3:
			say "The showerheads are aimed at the center of a room bathed continously in a deep, purple light";
		-- 4: 
			say "The high pressure nozzles that ring the room are designed to hose down personnel with an antiseptic solution as they come and go from potentially contaminated zones within the complex. The room is continuously illuminated by germicidal lights";
	say ". The door to the east leads to the hallway and to the north to the stairs"

To say pnDecon:
	if the consciousness of the player is:
		-- 3:
			say "The showers";
		-- 4:
			say "Decontamination room".
			
To say pnDeconDoor:
	if the consciousness of the player is:
		-- 3:
			say "bathroom door";
		-- 4:
			say "decontamination suite door".

Section Escalier 1

Escalier 1 is a room. The description of Escalier 1  is "[descEscalier1]." The printed name of Escalier 1 is "Stairway (first level)".

The esc1door is a  locked door. It is north of Salle de Décontamination and south of Escalier 1.

The printed name of esc1door is "door between the [if the consciousness of the player is 3]shower[otherwise]decontamination[end if] room et the stairs".

To say descEscalier1:
	say "The stairway climbs to the north and connects the [if the consciousness of the player is 3]shower[otherwise]decontamination[end if] room to the south with the rest of the installation above".
	
After going north from Salle de Décontamination:
	say "[upNorth].";
	try looking.
	
After going south from Escalier 2:
	say "[downSouth].";
	try looking.
	
To say upNorth:
	say "You climb the stairs towards the north".
	
To say downSouth:
	say "You go down the stairs southwards".

Section Escalier 2

Escalier 2 is a room. The description of Escalier 2  is "[descEscalier2]." Escalier 2 is north from Escalier 1. The printed name of Escalier 2 is "Stairway (second level)".

To say descEscalier2:
	say "The stairs go up towards the north and connect the lower set of stairs to the south with the airlock to the north".
	
After going north from Escalier 1:
	say "[upNorth].";
	try looking.
	
After going south from Sas:
	say "[downSouth].";
	try looking.

Section Sas

Sas is a room. The description of Sas is "[descSas]." The printed name of the sas is "Airlock".

The sasDoor is a  locked door. It is north of Escalier 2 and south of Sas. The printed name of the sasDoor is "armored airlock door".

The scientist is an edible  thing in the sas. The scientist has a number called conversations. The conversations of the scientist is 0.

To say descSas:
	if the consciousness of the player is:
		-- 3:
			say "A long, tubular room bathed in red light";
		-- 4:
			say "The heavy armored doors, lack of windows, and tubular shape of the room remind you of a submarine. The light above the door at the other end of the room is red, signaling that the exterior door is locked".
			
Instead of going north when the player is in the sas:
	if scientist is in the sas:
		say "You would need to get past the scientist and she doesn't appear to be all that cooperative. More over, since you don't know the code to open the outer door, it wouldn't make much sense to try.";
	otherwise:
		say "Useless. The door is hermitically sealed and can only be opened by someone in the control room."
			
Before eating scientist when the conversations of scientist are less than 5:
	now the BlockChatterFlag is true;
	say "[one of]The scientist beats you back with her crowbar. Once out of reach of your slavering maw, she presses a button on the intercom and says, [quotation mark]Attention, control room, this is Doctor Rambaud in the airlock. Julien is here with me. Unfortunately, I have to report that the experiment has failed. Don't unlock the outer door no matter what.[quotation mark][paragraph break][or]Doctor Rambaud does not budge from behind the desk, but as you approach she lands a series of blows with her crowbar that makes you reconsider your actions.[or]The scientist confides, [quotation mark]I have to give you credit for your perseverance, but… [quotation mark] and she whacks you solidly on the nose. Stunned, you stagger back out of reach of her crowbar.[or]Doctor Rambaud beats you repeatedly with the crowbar.[stopping]";
	stop the action.
	

Chapter Verbs

Section simpleUnlocking

simpleUnlocking is an action applying to nothing. Understand "unlock" as simpleUnlocking.

Carry out simpleUnlocking:
	repeat with way running through directions:
		if the door the way of the location is locked:
			now the door the way from the location is unlocked;
			say "You enter the code on the numeric keypad and hear the door to the [way] unlock.[no line break][one of][firstUnlocked][or][stopping][paragraph break]";
			stop the action;
	say "You don't see any locked door."
	
To say firstUnlocked:
	now the BlockChatterFlag is true;[hate to side effect this way, but here it seems expedient]
	say "[paragraph break][italic type][quotation mark]Hang on a minute,[quotation mark] says the dog. [quotation mark]What kind of a trick is that?[quotation mark][line break][quotation mark]To unlock these doors with electronic locks, you have to enter the right code.[quotation mark][line break][quotation mark]And you remember the code?[quotation mark] asks the mouse.[line break][quotation mark]Apparently so.[quotation mark][roman type][paragraph break]".
	
Section simpleOpening

Definition: A door is simpleOpenable if it is closed and it is not locked and it is not buttoned.
	
simpleOpening is an action applying to nothing. Understand "open" as simpleOpening.

Carry out simpleOpening:
	repeat with the way running through directions:
		if the door the way of the location is simpleOpenable:
			try opening the door the way from the location;
			stop the action;
	repeat with the item running through visible containers:
		if the item is closed:
			try opening the item;
			stop the action;
	say "There's nothing obvious to open here." 

Section simpleEating

simpleEating is an action applying to nothing. Understand "eat" as simpleEating.

Carry out simpleEating:
	repeat with the item running through visible edible things:
		try eating the item;
		stop the action;
	say "You don't see anything to eat";
	if the tas de nourriture de chien is in the location:
		say " (at least, nothing that looks appetizing)";
	say "."
	
Section simplePushing

simplePushing is an action applying to nothing. Understand "push" as simplePushing.

Carry out simplePushing:
	repeat with the item running through visible buttoned things:
		try pushing the item;
		stop the action;
	say "There's nothing to push here."
	
Section simpleTalking

simpleTalking is an action applying to nothing. Understand "talk" as simpleTalking.

Check simpleTalking:
	if the player is not in the sas:
		say "No one is around. Who are you talking to[one of]?[paragraph break]Do you want everyone to think you're nuts[or][stopping]?";
		stop the action;
	otherwise:
		if the dépouille saignante du Docteur Rambaud is in the sas:
			if the interphone is not live:
				say "To talk to the control room, you must first activate the intercom.";
				stop the action.
				
Carry out simpleTalking:
	if the dépouille saignante du Docteur Rambaud is in the sas:
		now the BlockChatterFlag is true;
		if the curedFlag of the player is not true:
			say "[one of]You explain your plan. The director of the installation grabs the microphone and wishes you good luck. Beyond that, he instructs you report back when you have succeeded. Short of that, though, he requests that you not use the intercom[or]The control room refuses to talk to you until you have a proven cure in hand[stopping]. They hang up on you and the intercom goes dark.";
			now the interphone is not live;
		otherwise:
			increase the conversations of the player by 1;
			if the conversations of the player is:
				-- 1:
					say "[quotation mark]Control room, Professeur Drummond speaking.[quotation mark][line break][quotation mark]It's me, your dog, Lucky! I'm in the airlock! I am so happy to hear your voice![quotation mark][line break][quotation mark]Um. Huh? Are you messing with me? The intercom is only for official communications. Who is this?[quotation mark][paragraph break][italic type][quotation mark]It's him! It's the father of my family,[quotation mark] says Lucky.[line break][quotation mark]Calm down, Lucky,[quotation mark] insists the scientist. Please let Julien do the talking.[quotation mark][roman type][paragraph break][quotation mark]Excuse me,[quotation mark] says Julien. [quotation mark]I can explain everything. I am Julien Truffaut.[quotation mark][line break][quotation mark]The guard?[line break][quotation mark]Yes.[quotation mark][line break][quotation mark]Impossible. Doctor Rambaud said that he had turned. Zombies can't talk. I don't have time for your crap, now get off the line.[quotation mark][paragraph break]";
				-- 2:
					say "[quotation mark]I'm not joking,[quotation mark] says Julien. Doctor Rambaud has cured me.[quotation mark][line break][quotation mark]Okay, enough,[quotation mark] answers the professor. If she's there, put her on.[quotation mark][line break][quotation mark]She is… occupied… at the moment.[quotation mark] While you are speaking, you drag the scientist's lifeless body around the corner to the stairwell.[paragraph break][quotation mark]Listen,[quotation mark] you continue,[quotation mark]if you don't believe me, turnon the surveillance cameras in the airlock. You'll be able to see me.[quotation mark][line break][quotation mark]Okay, wait a minute.[quotation mark][paragraph break]";
				-- 3:
					say "[quotation mark]Do you see me?[quotation mark] you ask.[line break][quotation mark]Yes. Got you on the screen. But how can you still be alive? I thought you had been infected by the virus?[quotation mark][line break][quotation mark]Well, yes, you're right, but as I told you…[quotation mark][paragraph break][italic type][quotation mark]Let me explain,[quotation mark] interrupts the scientist.[quotation mark][roman type][paragraph break][quotation mark]Doctor Rambaud prepared a cure using the microfluidic biosynthesis workstation following protocol M13 as she discussed with you previously. My neural pathways were restored and I am entirely cured.[quotation mark][line break][quotation mark]Okay… But that would mean… this could be it. An end the pandemic![quotation mark][line break]Right. We need to move on this quickly.[quotation mark][paragraph break]";
				-- 4: 
					say "You request to speak to the director of the entire research complex, Colonel Greillier and you relate everything that has happened, leaving out, for now, all some of the detail that Lucky and mouse would like to add.[paragraph break]After a couple hours of discussion and some blood tests, the colonel is convinced and orders that the airlock doors be unsealed, permitting you to exit.";
					terminate the game;
	otherwise:
		now the BlockChatterFlag is true;
		increase the conversations of scientist by 1;
		if the conversations of scientist is:
			-- 1:
				say "You start babbling incoherently, the words refusing to come. As the sounds trip off your lips, the scientist stares at you incredulously.[paragraph break][quotation mark]Is it possible,[quotation mark] she asks. [quotation mark]Are you still capable of speaking somehow?[quotation mark][line break][quotation mark]Yes,[quotation mark] you groan painfully, [quotation mark]I… speak.[quotation mark][line break][quotation mark]Incredible! It's a miracle, Julien. What do you remember?[quotation mark][paragraph break][italic type][quotation mark]Julien? Who's Julien?[quotation mark] asks Lucky.[line break][quotation mark]Not me,[quotation mark] says the mouse. Maybe the name belongs to our buddy, the slice of brain?[quotation mark][line break][quotation mark]I don't recall, but sure, I guess I could be this Julien. I mean, why not?[quotation mark][roman type][paragraph break][quotation mark]Nothing. I don't remember a thing… Julien… that's me?[quotation mark][line break][quotation mark]Yes, Julien. It's you. And I'm your Isabelle. Isabelle Rambaud,[quotation mark]replies the scientist in a disappointed tone.[paragraph break]";
			-- 2:
				say "[italic type][quotation mark]She has pretty eyes (for a giant),[quotation mark] remarks the mouse.[line break][quotation mark]Shut up,[quotation mark] say the slice of brain and Lucky in unison.[roman type][paragraph break][quotation mark]You force yourself to form the words, one after another.[paragraph break][quotation mark]What are we doing here?[quotation mark][line break][quotation mark]Listen, Julien, I don't I much time. I am a medical researcher and you are a guard. We both work at an installation dedicated to finding a cure for the zombie777 virus, which has desolated the entire world.[quotation mark][line break][quotation mark]A guard?[quotation mark][line break][quotation mark]Yes. Pay attention, Julien, this is important. A crowd of infected individuals surrounded the lab complex and you were protecting me when you were scratched by one of them. I had to give you the experimental treatment to prevent you from turning into a zombie.[quotation mark][line break][quotation mark]So, I'm cured?[quotation mark][line break][quotation mark]No, not even close.[quotation mark][paragraph break]";
			-- 3:
				say "[quotation mark]So, the treatment didn't work?[quotation mark] you ask.[line break][quotation mark]No, not entirely it would seem. I had a little problem with the microfluidic biosynthesis unit that produced the dose I gave you. I think that one of the ingredients must have been left out of that batch. I was trying to repair the unit when you caught me off guard. You attacked me, but I managed to hole up here in the airlock. So. That's where things stand.[quotation mark][line break][quotation mark]Sorry.[quotation mark][line break][quotation mark]It wasn't you. You were a full-blown zombie at the time. But… how is it that now you're able to talk? I've never heard of a zombie that could talk -- it just doesn't happen.[quotation mark][paragraph break]";
			-- 4:
				say "[quotation mark]It's really hard for us to talk.[quotation mark][line break][quotation mark]Naturally, your neural pathways are in a state of… hold on… what do you mean, [apostrophe]us[apostrophe]?[quotation mark][paragraph break][italic type][quotation mark]Tell her about me,[quotation mark] implores the mouse, full of excitement.[quotation mark][line break][quotation mark]And about me![quotation mark] adds Lucky.[roman type][paragraph break]Yeah. About that. I said [apostrophe]us[apostrophe] because there are three minds in my head: a mouse, a dog named Lucky, and a slice of brain. We work together as best we can to get around and talk.[quotation mark][line break][quotation mark]Well.[quotation mark] She stares a moment at the ceiling to gather her thoughts. [quotation mark]Well, I suppose that explains everything. You brain was rebooted, more or less erased by the virus, but somehow you have managed to reload it in a sense with normal brains. That slice of brain that you mentioned must have been the biopsie that I took from Julien before the virus had invaded that part of his brain.[quotation mark][paragraph break]";
			-- 5:
				say "[quotation mark]So, we're well and truly screwed?[quotation mark] you say.[paragraph break][italic type][quotation mark]Totally,[quotation mark] whines the mouse.[line break][quotation mark]Yeah, I'd say so,[quotation mark] agrees Lucky.[roman type][paragraph break][quotation mark]Maybe not… [quotation mark][line break][quotation mark]You have an idea?[quotation mark][line break][quotation mark]Yes, I think so. Do exactly what I say: I don't have long for this world. I can't even feel my legs; it's only a matter of time. However… if you eat my brain -- hang on, not yet! Let me finish talking -- thanks. As I was saying, if you eat my brain, my personality will meld with all of yours. You are still actively infected with the virus and in time it will destroy what's left of your brain, but the infection seems to have been slowed by the first treatment, even if it wasn't completely effective. If there's enough time, I can repair the synthesis unit and we can try again. If we succeed this time, I can live on in you, along with your thoughts.[line break][quotation mark]So, I should eat your brain now?[quotation mark][line break][quotation mark]Go for it.[quotation mark][paragraph break]";
			-- otherwise:
				say "There's nothing more to say."
				
												
Section simpleRepairing

simpleRepairing is an action applying to nothing. Understand "repair" as simpleRepairing.

Carry out simpleRepairing:
	repeat with the item running through visible broken things:
		try touching the item;
		stop the action;
	say "You don't see anything in need of repair."
	
Instead of touching something (called the item):
	now the item is not broken;
	say "You repair [the item]."
	[override touch with specific repair actions.]
	
Chapter Consciousness

To increment the consciousness of the player:
	increase the consciousness of the player by 1;
	try looking.

Chapter Known Commands

actionList is a list of text that varies. actionList is {"east", "west","eat","open","north","south","push","unlock","talk","repair"}

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
	say "A tiny creature zips out of nowhere, weaves between your feet, and flees to the west.";
	increment the knownCommands of the player.
	
After going west from Couloir 2 for the first time:
	move the small gray creature to the Bloc Opératoire;
	try looking;
	say "It hides in the shadows, trembling.";
	increment the knownCommands of the player.
	
After eating the small gray creature:
	say "[line break]You blindly sweep the base of the wall with your hand. Despite your lack of speed and dexterity, by some miracle you manage to trap the tiny roden against the wall. You seize it firmly and feel something warm, furry, and now moist, melt in your hand. Without another thought, you pop it into your mouth and swallow.[paragraph break]A moment later, you are overcome as new thoughts flood your mind.[paragraph break][italic type]Help! A giant monster is after me! It's going to eat me! I have to hide.[paragraph break]I…um.  Am I dead or what? I don't get it. What's going on?[roman type].";
	increment the consciousness of the player.
	
After going east when the consciousness of the player is 1 for the first time:
	try looking;
	now the BlockChatterFlag is true;
	say "[italic type]Ah, the great white hallway.[paragraph break]How many times I have seen the giants walk right through the smooth walls into secret rooms? How do they do it?[roman type][paragraph break]";
	increment the knownCommands of the player.
	
After opening the labZooDoor:
	say "[openNord].";
	increment the knownCommands of the player.
	
After going north from Couloir 2 for the first time:
	say "You sneak into the wolf's den, a place that is well known to you, but still scary. As usual, the wolf is imprisoned in an iron cage and you are free to explore, beyond the reach of his slaving fangs.";
	try looking;
	increment the knownCommands of the Player.
	
After opening the cage:
	say "You open the cage, but the wolf remains prudently inside, watching you."
	
After eating the chien:
	now the chien is dead;
	now the corps de chien is in the cage;
	say "Out of instinct, you eat its brain and throw the body back into the cage. Once again, new throughts invade your mind.[paragraph break][italic type]I'm warning you: if you get near my cage, I'll eat you. Stop! I'm not kidding…[paragraph break]Huh? What's going on? What's that dead dog doing in my cage… bleeding on my favorite pillow?[paragraph break]And what am I doing standing on my hind legs like a human? It seems to be easier than I would have thought.";
	increment the consciousness of the player;
	increment the knownCommands of the player.
	
After eating the morceau de cerveau:
	say "While eating the slice of brain you notice that the flavor is a little bit off.[paragraph break]Nothing happens for a few minutes, and you begin to wonder if you can now eat just anything you find without having to worry about it.[paragraph break]Suddenly, the world explodes from black and white into full, vibrant color. A wave of electricity courses through your mind and you collapse, disoriented. As you stand back up, new ideas blend into your thoughts and you see everything in a new light.";
	increment the consciousness of the player;
	increment the knownCommands of the player.
	
After going north from Escalier 2 when the sasDoor is not locked for the first time:
	now the BlockChatterFlag is true;
	say "A women in her forties, dressed in a white lab coat sits behind a metal desk. She is half way between you and the door at the other end of the room. Her upper right arm is swathed in gauze, but the bandages are drenched in blood and she appears gravely injured. In her other hand, she brandishes a crowbar with determination.";
	try looking;
	increment the knownCommands of the player.
	
After eating scientist:
	now the BlockChatterFlag is true;
	say "You eat the scientist's brain and immediately perceive the world from a more refined and erudite perspective.[paragraph break][italic type][quotation mark]Is it done,[quotation mark] asks the voice of Isabelle with hesitation.[line break][quotation mark]Yes, you were delicious,[quotation mark] compliments the mouse.[line break][quotation mark]The best yet,[quotation mark] adds Lucky.[line break][quotation mark]Excuse my co-brains, they are sorely lacking in tact,[quotation mark] interjects the slice of brain.[line break][quotation mark]Hey![quotation mark] complain the mouse and dog.[line break][quotation mark]Make yourself at home, Isabelle,[quotation mark] continues the slice of brain. [quotation mark]Let me present our little company: here's Lucky the dog, and that's the Duke of Mousedom (or just [apostrophe]the mouse[apostrophe], as he's rather modest), and me. I'm the one they call [apostrophe]slice of brain[apostrophe]. We are at your service.[quotation mark][line break][quotation mark]Good morning, boys,[quotation mark] says Isabelle warmly.[paragraph break]";
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
			say "The robotic workstation emits a beep and fills a flask with fluorescent green fluid. You take the flask, propose a short toast to yourself, and kick it back in one gulp.[paragraph break][quotation mark]I don't feel anything,[quotation mark] worries the slice of brain.[line break][quotation mark]Wait for it,[quotation mark] reassures Isabelle.[line break][quotation mark]Me neither,[quotation mark] pipes up the mouse.[line break][quotation mark]Wait for it,[quotation mark] insists the scientist.[line break][quotation mark]Oh my![quotation mark] barks Lucky. [quotation mark]Something's starting to…[line break][quotation mark]And we're off![quotation mark] shouts the doctor.[paragraph break]You shake violently and pass out. When you are able to stand up again, you note that you skin has recovered its normal tint and that you can walk without lurching back and forth. In short, you've been cured.[paragraph break]";
			now the curedFlag of the player is true;
	if the BlockChatterFlag is false:
		if the consciousness of the player is:
			-- 1:
				if the number of entries in mouseDialogue is greater than zero:
					say "[italic type][entry 1 of mouseDialogue][roman type][paragraph break]";
					remove entry 1 from mouseDialogue;
			-- 2:
				if the number of entries in mouseDogDialogue is greater than zero:
					say "[italic type][entry 1 of mouseDogDialogue][roman type][paragraph break]";
					remove entry 1 from mouseDogDialogue;
			-- 3:
				if the number of entries in mouseDogGuardDialogue is greater than zero:
					say "[italic type][entry 1 of mouseDogGuardDialogue][roman type][paragraph break]";
					remove entry 1 from mouseDogGuardDialogue;
			-- 4:
				if the curedFlag of the player is true:
					if the number of entries in CuredDialogue is greater than zero:
						say "[italic type][entry 1 of CuredDialogue][roman type][paragraph break]";
						remove entry 1 from CuredDialogue;
				otherwise:
					if the number of entries in EverybodyDialogue is greater than zero:
						say "[italic type][entry 1 of EverybodyDialogue][roman type][paragraph break]";
						remove entry 1 from EverybodyDialogue;
	now the BlockChatterFlag is false.
	
Section Mouse Dialogue

mouseDialogue is a list of text that varies. 
	
mouseDialogue is {
"In any case, I seem to have grown quite a bit. Hmph.",
"I've got a real hankering for something, I just can't quite put my paw on it.",
"Let's see, what do I usually want?",
"Sleep? Nope. Drink? Nope. Sex? Nope.[paragraph break]My God! No? Am I sick?",
"Ah, that's it. I'm hungry.",
"But hungry for what? That escapes me for the moment.",
"For some cheese? No, not really.",
"I'm looking for something soft, juicy...",
"I guess I'll know it when I see it."
}.

Section MouseDog Dialogue	
		
mouseDogDialogue is a list of text that varies. 

mouseDogDialogue is {
"[quotation mark]Sorry[quotation mark][line break][quotation mark]Sorry about what?[quotation mark][line break][quotation mark]I guess, I'm sorry that I ate you.[quotation mark][line break][quotation mark]Ate me? Who are you, anyhow?[quotation mark][line break][quotation mark]La souris.[quotation mark]",
"[quotation mark]The mouse? What mouse[quotation mark][line break][quotation mark]The mouse who lives here.[quotation mark][line break][quotation mark]That damned mouse who is always swiping crumbs from around my food dispenser?[quotation mark][line break][quotation mark]Yes, one and the same. Once again, just wanted to say that I'm sorry if I upset you.[quotation mark]",
"[quotation mark]Don't sweat it. I would have done the same.[quotation mark][line break][quotation mark]Thanks.[quotation mark][line break][quotation mark]Say, mouse, do you have a name?[quotation mark][line break][quotation mark]No, we mice don't have names. You can just call me [apostrophe]Mouse[apostrophe]. How about you? What's you name?[quotation mark][line break][quotation mark][apostrophe]Lucky[apostrophe]. Or, at least that's what my family called me before I got here. The torturers refer to me as [apostrophe]Sujet 205-Alpha[apostrophe], but I prefer [apostrophe]Lucky[apostrophe].[quotation mark][line break][quotation mark]Okay, Lucky.[quotation mark]",
"[quotation mark]Mouse, can you explain something to me? I'm still confused. How can it be that you, a mouse tiny little mouse, could manage to eat a big strong dog like me, when I'm several times your size?[quotation mark][line break][quotation mark]You know, I've asked myself the same question. Hang on -- you're a dog? I thought you were a wolf![quotation mark][line break][quotation mark]Nope, a dog.[quotation mark][line break][quotation mark]Really?[quotation mark][line break]Yes, I'm pretty sure.[quotation mark]",
"[quotation mark]I can't figure out how I managed to eat you.[quotation mark][line break][quotation mark][line break][quotation mark]I was seized by a sudden urge to eat brains.[quotation mark][line break][quotation mark]Brains? What brains?[quotation mark][line break][quotation mark]In this case -- yours.[quotation mark][line break][quotation mark]Ah, I see… no, not really.[quotation mark]",
"[quotation mark]Have you always lived here, Mouse?[quotation mark][line break][quotation mark]My family has lived here for generations, it is our hereditary territory. We defend it against all invaders. Field mice are nothing but thugs and thieves.[quotation mark][line break][quotation mark]Have you ever seen the outside world?[quotation mark][line break][quotation mark]I don't have the slightest desire to do so. I've heard stories, of course: the sky, clouds, fields, and so on, but none that interests me.[quotation mark]",
"[quotation mark]What about you, Lucky? You mentioned a family? Do you have a wife (we mice don't believe in marriage, but I've heard you dogs are more traditional)?[quotation mark][line break]A family, yes, but not a wife (although there was that poodle next door… but, um, that's another story). No, when I speak of family, I'm talking about a human family.[quotation mark]",
"[quotation mark]You were their slave,[quotation mark] asks the mouse.[line break][quotation mark]No, it wasn't like that. I played with the kids, they fed me, they pet me all day, and I even had my own bed.[quotation mark][line break][quotation mark]You're dreaming. I've never seen anything like that. Humans don't like animals -- they're always trying to crush us under their heels.[quotation mark]",
"[quotation mark]Meh, you don't know anything about humans,[quotation mark] refutes Lucky.[line break][quotation mark]I don't want to know them from any closer, thank you very much.[quotation mark][line break][quotation mark][line break][quotation mark]You would have liked my family.[quotation mark][line break][quotation mark]If that's the case, why did you leave such an amazing family, if I may ask?[quotation mark][line break][quotation mark]Not by choice. We were in a forest, I saw a squirrel, and you can figure out the rest. I never saw them again.[quotation mark][line break]Don't talk to me about squirrels. They're worse than wild mice.[quotation mark]",
"[quotation mark]Lucky, do you think you'll one day find your family again?[quotation mark][line break][quotation mark]Hope so.[quotation mark][line break][quotation mark]Me too. I'd like to chase squirrels with you.[quotation mark][line break][quotation mark]Yeah, that would be great.[quotation mark]"
}


Section MouseDogGuard Dialogue

mouseDogGuardDialogue is a list of text that varies. 

mouseDogGuardDialogue is { 
"[quotation mark]We have to patrol![quotation mark] commands a new voice.[quotation mark][line break][quotation mark]Patrol? What's that mean?[quotation mark] asks the mouse.[line break][quotation mark]Well, it means to walk everywhere and secure the installation,[quotation mark] replies the voice.[line break][quotation mark]I love to go on walks![quotation mark] says Lucky excitedly.",
"[quotation mark]If I might ask a question,[quotation mark] begins the mouse, [quotation mark]who are you?[quotation mark][line break][quotation mark]My name is… hmm… let's see… give me a sec… yeah, good question. I don't quite seem to remember it for the moment. Why don't you pick one for me?[line break][quotation mark]Let's call him [apostrophe]the little slice of brain that we found in the fridge that had kind of a weird taste[apostrophe], suggests Lucky.[line break][quotation mark]No, that's entirely too long. Let's just go with [apostrophe]the slice of brain[apostrophe]. How's that?[quotation mark][line break][quotation mark]Sure,[quotation mark] says the slice of brain, [quotation mark]all things considered, I prefer short names.[quotation mark]",
"[quotation mark]Do you guys also have names?[quotation mark] asks the slice of brain.[line break][quotation mark]Yes,[quotation mark] replies the dog. [quotation mark]Excuse our lack of etiquette. I'm called Lucky, and my friend the mouse is simply named, [apostrophe]Mouse[apostrophe].[quotation mark][line break][quotation mark]Right,[quotation mark] confirms the mouse.[line break][quotation mark]A pleasure to make your acquaintances, my new friends.[quotation mark]", 
"[quotation mark]So, slice of brain, I wonder what kind of animal you were before you got here. I was a dog and the mouse had always been a mouse.[quotation mark][line break][quotation mark]I was something other than a slice of brain?[quotation mark][line break][quotation mark]It seems to me that you must have been a fridge,[quotation mark] suggests the mouse. [quotation mark]I ate the brain of a dog and Lucky appeared. After that, we opened and ate a fridge, and you appeared.[quotation mark][line break][quotation mark]I don't think it works like that,[quotation mark] murmurs Lucky.",
"[quotation mark]When you got here, you said that we had to [apostrophe]secure the installation[apostrophe]. What did you mean by that?[quotation mark] asks Lucky.[line break]I meant that we have to look all around the installation to protect it against all threats.[quotation mark][line break][quotation mark]OK,[quotation mark] says the mouse, trying to follow the thread of the conversation, [quotation mark]but what's an installation?[quotation mark][line break][quotation mark]Oh, an installation? It's the complex of… um… rather, it's a place, where everyone works to… hmm.  Yeah. It's where we are,[quotation mark] concludes the slice of brain.",
"[quotation mark]What threat are you talking about,[quotation mark] asks the mouse.[line break][quotation mark]To be honest, I'm not sure,[quotation mark] replies the slice of brain. [quotation mark]This is so frustrating! I just can't remember, but I'm sure that there's a lot of them and that they are very bad.[quotation mark][line break]You know, you're sounding a bit paranoid,[quotation mark] observes the dog.[line break][quotation mark]Maybe, but if I just had my memories, I could… no, I'm afraid they're lost.[quotation mark]",
"[quotation mark]Do you think there's anything we could do to get your memories back?[quotation mark] asks Lucky.[line break][quotation mark]How? I've tried remembering all sorts of things and nothing comes to mind.[quotation mark][line break][quotation mark]Probably because you're just a little slice of brain,[quotation mark] remarks the mouse. [quotation mark]If we could find the rest of your brain, which must be around here some place I suppose, we could eat it and get back all your missing memories, right?[quotation mark][line break][quotation mark]Really? Do you think so?[quotation mark] wonders the slide of brain.[line break][quotation mark]Oh yes, certainly,[quotation mark] reassures the dog.",
"[quotation mark]But what if the rest of the brain finds us before we find it?[quotation mark] asks the mouse.[line break][quotation mark]Yeah, so?[quotation mark] says Lucky.[line break][quotation mark]The rest of the brain could eat us before we eat it,[quotation mark] replies the mouse anxiously.[line break][quotation mark]And what exactly would that change?[quotation mark] asks the slice of brain. [quotation mark]Either way, we'd all still be together in one spot, wouldn't we?[quotation mark] asks the slice of brain.[line break][quotation mark]Yes, but usually I prefer to eat others before they eat me.[quotation mark]",
"[quotation mark]You know what we need,[quotation mark] asks Lucky. [quotation mark]A plan. We need a plan.[quotation mark][line break][quotation mark]Yes, I agree,[quotation mark] says the mouse. [quotation mark]What do you propose?[quotation mark][line break][quotation mark]Number one[quotation mark], explains the dog, [quotation mark]we need to explore a bit to, as the slice of brain says, secure the installation. Number two: to search for the missing brain. And number… um, the number that comes after two: we need to escape.[quotation mark][line break][quotation mark]Amazing! You're a genius, Lucky,[quotation mark] says the slice of brain.",
"[quotation mark]Escape? You mean out of here? Outside?[quotation mark] asks the mouse. [quotation mark]What does the outside world offer? Nothing but headaches, I'd say. Here, I have inherited lands and even a title -- did you know that I am a duke? It's true, I'm not kidding. I am the eighteenth duke of my line. You want me to throw all that away?[quotation mark][line break][quotation mark]But, there's a whole world out there![quotation mark] howls the dog.[line break][quotation mark]I've lived out there,[quotation mark] adds the slice of brain. [quotation mark]I think I lived not too far from the installation with my girlfriend… what was her name?[quotation mark]",
"[quotation mark]Ew, a girlfriend, huh?[quotation mark] asks Lucky, suddenly interested.[line break][quotation mark]Details, pleases.[quotation mark] encourages the mouse.[line break][quotation mark]Well, to tell you the truth, I don't remember much about her, not even her name. That said, I do recall that was blindingly clever… she had a great sense of humor and a loud, rowdy laugh… and almond-shaped eyes of the deepest violet… and she had huge… hmm…  Sorry, don't recall the word.",
"[quotation mark]If we manage to get out of the installation, do you think you could find your house,[quotation mark] asks Lucky.[line break][quotation mark]Sure, no doubt. There are only a handful of rooms to get through and we'll be out. The house is not far at all, we just have to follow the street… I don't remember which one, but I'd recognize it.[quotation mark][line break][quotation mark]Your amnesia does not inspire a lot of confidence,[quotation mark] complains the mouse.[line break][quotation mark]If we can find the rest of the brain on our way out, everything will fall into place,[quotation mark] suggests Lucky.",
"[quotation mark]If we do manage to find a way out of the installation, do you think you can help Lucky find his family?[quotation mark] asks the mouse.[line break][quotation mark]Maybe. Probably. Lucky, is your house also near by? inquires the slice of brain.[quotation mark][line break][quotation mark]I think so,[quotation mark] replies the dog. [quotation mark]My family lives in a large, white house surrounded by tall trees. There can't be many houses like that.[quotation mark][line break][quotation mark]Are there any cats?[quotation mark] interrupts the mouse.[line break][quotation mark]Not one,[quotation mark] says the dog.",
"[quotation mark]I had a troubling thought,[quotation mark] says the mouse.[line break][quotation mark]What? asks the slice of brain.[line break][quotation mark]What are we going to do if we run into a cat?[quotation mark][line break][quotation mark]We'd eat its brains, wouldn't we?[quotation mark] answers the slice of brain. [quotation mark]I don't see a problem there.[quotation mark][line break][quotation mark]Oh, but I do,[quotation mark] says the dog. [quotation mark]We'd hear cat thoughts all the time. That would be intolerable.[quotation mark][line break][quotation mark]Absolutely![quotation mark] agrees the mouse. [quotation mark]Eating a cat? Sure. No problem. Count me in. But, I refuse to listen to his thoughts. That would be too much.[quotation mark]",
"[quotation mark]When we're outside, what do we need to do to find Lucky's house,[quotation mark] asks the mouse.[line break][quotation mark]First, let's head to my house,[quotation mark] replies the slice of brain. [quotation mark]I have a car, and that will speed up the search.[quotation mark][line break][quotation mark]Let me get this straight,[quotation mark] says the mouse, [quotation mark]you don't remember your own name, but you know how to drive?[quotation mark][line break][quotation mark]if not, I can,[quotation mark] says Lucky. [quotation mark]I've watched humans do it many times. Driving doesn't seem all that complicated.[quotation mark].",
"[quotation mark]Listen, guys,[quotation mark] says the slice of brain, [quotation mark]It's getting harder and harder for me to focus; could I suggest that we hold off on the conversation for a bit so I can catch my breath?[quotation mark][line break][quotation mark]Yeah, me too,[quotation mark] agrees the mouse. [quotation mark]I have a splitting headache. A little rest would be nice.[quotation mark][line break][quotation mark]I agree. I like to run with the pack as much as anyone, but I could do with a little downtime.[quotation mark][line break]Good night, everyone,[quotation mark] says the mouse."
}

Section Everybody Dialogue

EverybodyDialogue is a list of text that varies. 

EverybodyDialogue is { "Quelle sensation incroyable ! délire la scientist.[line break]-- On s'y habitue après un temps, dit la souris laconiquement.[line break]-- Dis-lui le plan, Lucky, demande la tranche de cerveau. Je ne me rappelle pas de toutes les étapes.[line break]-- D'accord, dit le chien, numéro un : pour commencer nous avons besoin de trouver le reste du cerveau de Julien, numéro deux : quitterons l'installation, enfin, numéro plus que deux : nous chercherons ma famille.",
"Euh.  D'accord, dit Isabelle. Mais en premier lieu il faut sortir de la pièce où vous m'avez trouvé, et pour ce faire, il faut synthétiser le remède, propose la scientist.[line break]-- Impossible, dit la souris d'un ton définitif.[line break]-- Pourquoi ? demande Isabelle bouleversée.[line break]-- C'est une question de mathématiques, répond la souris d'un air pointilleux. Le plan de Lucky commence déjà avec numéro un. Il n'y a rien avant le numéro un.[line break]-- Numéro zéro ? suggère Isabelle.[paragraph break][roman type]Silence radio.[paragraph break][italic type]-- OK, dit Isabelle, renumérotons… un : faire le remède, deux : sortir de l'installation, trois : chercher la famille de Lucky. Ça vous convient ?[line break]-- Oui, accorde Lucky, ça l'air raisonnable.[line break]-- Et mathématiquement correct, ajoute la souris.",
"Attends, dit Lucky, toujours comptant les étapes du plan proposé par Isabelle. Que ferons-nous en ce qui concerne le cerveau manquant ? Si j'ai bien compris, nous en aurons besoin pour reconstituer Julien.[line break]-- Malheureusement, répond Isabelle, la tranche de cerveau est maintenant tout qui reste de Julien. Nous utilisons en ce moment les voies neurales du reste de son cerveau, mais à l'exception de la tranche récupérée rien ne reste de sa personnalité. C'est une perte grave, particulièrement pour moi.[line break]-- Pourquoi pour toi ? demande la souris.[line break]-- Parce que nous étions fiancés, Julien et moi.[line break]-- Désolé, dit la tranche de cerveau. Si je pouvais me souvenir de toi, je suis sûr que je t'aurais aimé.",
"Isabelle, penses-tu que nous allons un jour trouver ma famille ? demande Lucky.[line break]-- Oui, j'en suis certain.[line break]-- Comment peux-tu être si sûr ? demande la tranche de cerveau.[line break]-- Parce que je connais la famille : Jean-Paul et Alexandra Drummond et leurs filles, Léa et Camille. Ils ne vivent qu[apostrophe]à une centaine de mètres de moi et Julien.[line break]-- Oui, j'ai entendu ces noms souvent à la maison. Tu as assurément raison, mais comment peux-tu connaître de qui je parlais ? demande Lucky.[line break]-- Je les ai vus dans vos pensées, dit la scientist.",
"Tu dis que tu as vu dans les pensées de Lucky ? demande la souris. Comment est-ce possible ?[line break]-- Nous faisons tous partie d'un seul cerveau maintenant. Nos esprits sont d'une manière ou d'une autre mélangés. Je peux accéder à ses pensées et il peut également accéder aux miennes.[line break]-- Cool ! dit le souris. Nous avons des superpouvoirs !",
"Je trouve cela un peu improbable, dit le chien. Si tu peux voir dans mes pensées, à quel numéro est-ce que je pense en ce moment ?[line break]-- La scientist réfléchit un moment et elle dit, au numéro un.[line break]-- Oui, c'est exact, admet le chien, mais peut-être que tu y es arrivé par hasard. Essaie encore une fois…[line break]-- Tu penses au numéro deux, dit la scientist avec conviction.[line break]-- Oui encore, dit le chien satisfait.[line break]-- Mais, objecte le souris, Lucky ne connait que deux numéros… qu'est-ce que ça prouve ?",
"D'accord, dit la scientist patiemment, prenons un autre exemple. Souris, je pense en ce moment à mon petit déjeuner. Je m'efforce de le visualiser avec le plus de détails possibles… tente de le voir.[line break]-- Ou ? demande la souris. Je ne sens rien.[line break]-- Ah, dit Isabelle. Voilà le problème. Je pensais en termes visuels. Laisse-moi imaginer son odeur, sa saveur… [line break]-- Oh ! Oui, oui. Je commence à l'apercevoir, dit la souris. Mon dieu, c[apostrophe]était un énorme repas ! C'est merveilleux ! Puis-je vivre de nouveau chaque repas de votre vie ? Pince-moi, je rêve.",
"Même si je trouve le souvenir de votre repas délicieux, en ce moment je ne veux rien d'autre que des cerveaux. C'est drôle, non ? remarque la souris.[line break]-- Moi aussi, dit la tranche de cerveau.[line break]-- En fait, c'est tout à fait normal pour ceux comme nous qui fonctionnent en mode zombie, répond la scientist.[line break]-- Nous sommes des zombies ? interroge Lucky.[line break]-- Non, précise la scientist, ensemble nous constituons un seul zombie, partageant le corps de Julien.[line break]-- Au moins je suis dans mon propre corps, dit la tranche de cerveau.", 
"D'autres zombies sont-ils aussi agréable que nous ? demande Lucky.[line break]-- Non, répond Isabelle, ce sont des monstres. Nous sommes quelque chose à part.  Je dirais que nous sommes un demi-zombie, ayant reçu une dose d'un remède partiellement efficace. Quant aux autres zombies, ils ne sont pas capable de parler, de penser, en somme, de faire autrement que manger des cerveaux.[line break]-- Et ça pose un problème ? demande la souris.[line break]-- C'est rien de le dire, répond la scientist. Les zombies ont presque détruit la civilisation !", 
"Comment est-ce possible ? dit la tranche de cerveau.[line break]-- Le virus a une virulence sans précédent, répond la scientist. Le moindre griffure et c'est la contamination assurée. Les premiers cas ont été rapportés au Cambodge et vingt-quatre heures après des milliers des cas sont apparus tout autour du monde grâce aux transports aériens. La semaine suivante, c[apostrophe]était un capharnaüm à l[apostrophe]échelle mondiale. Sans électricité, eau et nourriture les grandes cités se sont effondrées presque immédiatement. Des feux ont balayé la campagnes. Il ne reste que quelques poches d'humanité.",
"Et quant aux animaux ? demande la souris. Étaient-ils touchés ?[line break]-- En fait, répond Isabelle, nous pensons que la maladie est d'origin canine. Avant la perte de communications avec l'Institut Pasteur à Hô-Chi-Minh-Ville, ils ont isolé une souche mutante de la rage qui a déclenché la pandémie.[line break]-- La rage ! dit Lucky, frappé de terreur. Il n'y a rien de plus terrifiant ![line break]-- Jusqu[apostrophe]à présent, précise la tranche de cerveau.",
"Si le zombisme s'est propagé si vite, s'inquiète Lucky, penses-tu que ma famille est survécu ?[line break]-- Oui, je le sais, rassure la scientist. Les Drummonds travaillent ici, dans l'installation et tous les travailleurs sont hébergés dans l'enceinte. Tu n'es pas loin d'eux. [line break]-- Génial ! dit le chien.", 
"Isabelle, dit la souris, si le remède fonctionne comme prévu, que deviendrons-nous ?[line break]-- Dans quel sens ?[line break]-- Est-ce que nous restons les individus avec nos propres pensées, ou crois-tu que nous allons fusionner dans une seul esprit ?[line break]-- Impossible à prédire. Jusqu[apostrophe]à maintenant, nous avons mené des vies individuelles. Tu as tes souvenirs et j'ai les miens, mais à l'avenir nous allons vivre les mêmes événements du même point de vue. Nous partagerons un seul corps et c'est possible que nous devenions un seul esprit après un certain temps.", 
"Je n'ai jamais souhaité être autre chose qu'une souris. Je trouve cela terrifiant, que mon esprit puisse être dilué.[line break]-- Mais vois les avantages, dit Lucky. Regarde dans mes pensés -- voici comment je me sens en chassant un écureuil. Et voici la sensation d[apostrophe]être gratté entre les oreilles.[line break]-- Oui, je suppose.[line break]-- Et ici, dit la scientist, je te montre la Terre vue depuis l'espace -- quelque chose qu'aucune souris n'a jamais vu.[line break]-- Heu. C'est impressionnant. Et je suppose que de mon coté j'ai quelque souvenirs à partager aussi : le chaleur de dormir avec les autres souris, la joie de voler les bribes du distributeur de Lucky…[line break]-- Hé ! hurle le chien.", 
"Quand j'ai vu le corps de Julien entrer dans le sas, j'ai remarqué qu'il se déplaçait avec difficulté, marchant lentement et trébuchant, dit la scientist.[line break]-- Oui, je sais comment marcher, dit la tranche de cerveau, mais je le trouve désespérément difficile de le mettre en pratique.[line break]-- La souris n'aide pas, commente Lucky. Il bouge toujours les jambes.[line break]-- Moi ? dit le souris avec indignation. C'est toi qui veut toujours aller à quatre pattes.[line break]-- OK, dit la scientist, puis-je vous convaincre qu'une seule personne doit pilote le corps à la fois ?[line break]-- Oui, certainement, acquiesce la tranche de cerveau. Le volant est à toi.", 
"D'accord, dit la scientist. Je m'empresse de faire ce qu'il faut pour obtenir le remède.[line break]-- Bon. Assez de papotage mes amis, laissez-la se concentrer, conseille la tranche de cerveau.[line break]-- Oui, d'accord, disent le chien et la souris."
}

Section Cured Dialogue

CuredDialogue is a list of text that varies. 
	
CuredDialogue is { 
"C'est fait, dit la scientist. Je ferai l'appel : Lucky ?[line break]-- Présent.[line break]-- Le Marquis de Souris ?[line break]-- Oui. Ici.[line break]-- Et la tranche de cerveau de Julien ?[line break]-- Présent.[line break]-- Bon, dit Isabelle, il me semble que nous sommes tous arrivés sauf et sain.",
"Et maintenant on quitte l'installation ? suggère le chien.[line break]-- Oui, dit Isabelle[line break]-- Mais la porte extérieure est verrouillée. Personne ne peut l'ouvrir à part le colonel Greillier dans la salle de contrôle, dit la tranche de cerveau.[line break]-- Oui, nous devons le convaincre de l'ouvrir, acquiesce la scientist.",
"Dis, ça me surprend un peu que tu te souviennes du colonel Greillier. J'ai pensé que tu avait oublié les noms.[line break]-- Du colonel ? demande la tranche de cerveau. Comment puis-je oublier le nom de ton boss ? C[apostrophe]était juste la dernière semaine qu'il est tombé dans la piscine pendant sa fête d'anniversaire. Je suppose que nous étions tous un tantinet bourrés ![line break]-- C'est quoi bourré ? demande la souris. Oh, je vois dans vos pensées. Ça a l'air amusant.[line break]-- Patientez un instant, Souris, dit Isabelle. Julien, c[apostrophe]était un souvenir compliqué. Penses-tu que ta mémoire est de retour ?[line break]-- Hein ? Comment pourrais-je savoir ?",
"Julien, dit la scientist, qu'est-ce que tu m'a donné en cadeau pour notre premier Noël ?[line break]-- Des gants ?[line break]-- Et ils était…[line break]-- Bien trop grands ! Oui, je les avais achetés pour mon frère, mais quand tu m'as donné un cadeau et je n'avais rien pour toi… oui… euh, es-tu toujours vexée ?[line break]-- Non, pas vraiment. Je testais juste ta mémoire.",
"Donne-moi un autre essai ![line break]-- D'accord. Comme est-ce que tu m'appelles quand nous sommes seuls ?[line break]-- Isabelle ?[line break]-- Non, réfléchis ! Quand c'est juste nous…[line break]-- Je préfère de ne pas le dire devant Lucky et la souris.[line break]-- Vas-y ! dit le chien. Nous partageons un esprit maintenant, il n'y a pas de vrais secrets entre nous.[line break]-- Très bien, dit Julien, je t'appelle mon lapin.[line break]-- Lapin ? dit la souris. Elle est un lapin ? Quoi ? Je suis totalement confus.",
"Bon, Julien, il me semble que tu es en train de récupérer ta mémoire, dit la scientist.[line break]-- Tu penses ? Pourtant tu m'as dit que je ne suis qu'une toute petite biopsie de cerveau. Est-il possible que les souvenirs soient les tiens et que je lise dans tes pensées ?[line break]-- Je dirais qu'une toute petite biopsie ne serait  guère capable de hasarder une telle hypothèse, il s'agit plutôt d'un cerveau entier en pleine forme.",
"Si j'ai bien compris, dit Lucky, tu as dit que les cerveaux des zombies sont complètement effacés par le virus. Vu que rien ne reste de son cerveau, comment se fait-il qu'il peut fonctionner maintenant ?[line break]-- Nous n'avons jamais eu un pareil cas pour étudier, répond la scientist. Il est temps de réviser notre compréhension du processus : il semble que les cerveaux ne sont pas détruits, mais plutôt supprimés. Ses voies neuronales ont toujours étés intactes. En fait, c'est grâce à eux que nous continuons à exister. Nous nous servons de ses voies pour formuler nos propres pensées.",
"C'est super ! dit Julien. On peut restaurer tous les zombies ![line break]-- Mon dieu, Julien, vous avez raison. Ils ne sont plus perdus, répond la scientist. Pour la première fois, il y a un espoir de restaurer le monde et terminer ce cauchemar.[line break]-- Même les chiens infectés ? demande Lucky.[line break]-- Oui, y compris les chien et toutes les autres espèces infectés par le virus, répond la scientist.",
"Alors, que faire ? demande la souris.[line break]-- Julian, dit Isabelle, il faut parler avec le colonel pour le convaincre que tu es guéri et que nous possédons un remède contre le virus.[line break]-- D'accord. Je ferai de mon mieux, dit Julien.[line break]-- Allons-y ! crie la souris."
}.

Chapter The Void

The void is a room.

The small gray creature is an edible  thing. It is in the void.

The dépouille saignante du Docteur Rambaud is a  thing in the void. The indefinite article of dépouille saignante du Docteur Rambaud is "la".

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
	say "Vous écartez le morceau de soudure. La machine doit fonctionner norment maintenant."

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

Test me with "east / west / eat /east / open / north / open / eat / push / south / push /east / push / west / south / open / eat / eat / eat / north / open / north / open / open / eat / south / west / unlock / open / west / unlock / open / north / north / unlock / open / north / talk / talk / talk / talk / talk / eat / south / south / south /east / push /east / push / west / unlock / open / south / open / repair / north / push /east / push / west / west / north / open / repair / south /east / push /east / push / west / south / north / push /east / push / west / west / north / north / north / push / talk / talk / talk /  talk ".

Test full with "est /east / west / west / eat /east / west / open /east / open / north / south / west / south /east / north / z / z / z / z / z / z / z / z / z / z / z / eat / open / eat / push / eat / north / south / west / west /east /east / push /east / push / west / west / south / open / push / eat / eat / eat / eat / north / west / north / north / open / north / eat / push / open / open / eat / south / south / open / push / north / west / unlock / west / open / west / north / unlock / north / open / north / north / north / north / unlock / north / open / north / eat / eat / eat / eat / eat / eat / push / unlock / north / talk / talk / talk / talk / talk / talk / eat / talk / push / talk / push / push / talk / north / south / south / south / open / repair / open / repair / push / south /east / south / push / open / eat / north / north / repair / south / push /east / push / west / west /east / north / push / eat / repair / south / south / unlock / open / south / repair / open / repair / north / push /east / push / west / west / north / open / repair / south /east /east / push /east / push / west / south / repair / north / push /east / push / west / south / north / west / north / north / north / eat /talk / push / talk / talk / south / north / talk / talk ".



