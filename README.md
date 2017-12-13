# engarde
English translation of Faute de servo

What is this?
-------------

This is the source code to "Faute de Servo", an interactive fiction game
(or more commonly known as "text adventure".)  It was originally
written by Jack Welch in late 2017.

The code is released under the MIT license, which you can find in the
LICENSE file.

The game is written in the Inform 7 programming language, using
version 6G60.  Not the most recent version, but one what worked 
with all the necessary extensions with a minimum of hair pulling.
You can download the compiler and IDE as a single
package from http://www.inform7.com

When compiled, the source code produces a bytecode file which can be
executed on any implementation of a Glulx virtual machine:

  http://www.eblong.com/zarf/glulx/

The game's source code lives in a single file called 'story.ni' --
this file, some .i7x extensions, along with the 'uuid.txt', are the
primary things kept under version control.


To build the game:
------------------

	1. Create a working Inform project from your source tree:

		$ git clone URL cerveaux
  
		$ cd cerveaux
  
		$ mv cerveaux.inform/ temp.inform/

	[...launch Inform, create new project in this dir called 'cerveux'…]

		$ cp temp.inform/Source/story.ni cerveaux.inform/Source/
  
		$ cp temp.inform/uuid.txt cerveaux.inform/
  
		$ rm -rf temp.inform/

	2. Install extensions. The extensions used in this project are all "stock" -- 
	none have been modified, but there's always the concern about versions and 
	compatability. For that reason, I've put copies of all used extensions in the 
	cerveaux/extensions directory. If the whole project is cloned, these files will 
	come along for the ride. Be sure to install them into your local copy of inform 
	when you compile.

	3. Launch the Inform IDE and load the cerveux.inform project.  The source code 
	should be visible, and it should compile fine.  [Make	sure that Inform's 
	settings are are set to "Glulx" as the target VM.]


WARNING!!

	DO NOT do any version control operations (commit, push, and particularly, 
	pull, update, and merge) while the Inform IDE  is still open.  When the IDE 
	'saves', it destroys and recreates  the whole cerveux.inform/ directory, thus
	possibly eradicating and changes you may have downloaded.  
