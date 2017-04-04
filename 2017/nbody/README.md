Simple C project template
===============================

This is a little template for compiling C programs, that I use
to save me some pain. There is a lot to be added, but this should be able to compile basic C application with considerably small effort. 

##### Whats inside ?

- Simple directory structure that you can use organize your stuff.
- MIT licence, which you can remove or replace.
- Sample files for README, INSTALL, VERSION.
- Sample program.
- A Makefile made to work on this directory structure.

By default Makefile includes some libraries like glib, libcurl etc. 
These were necessary for me and if you need you can uncomment them or 
add your own. These are just to get you started.


##### What are the directories for ?

Directory   |   What for ?
-------     |   --------
doc  	      |   Here be the docs.
include     |   Here be the header(.h) files.
src 	      |   Here be the source(.c) files.
src/obj     |   Here the compiler puts object files.
lib         |   Here be the local libraries.
data        |   Here be some data for your program. 	 


##### References:
A lot of good stuff was learned from these websites:

* A Simple Makefile Tutorial
http://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/
* Makefile tutorial
http://makefiletutorial.com/
