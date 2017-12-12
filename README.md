# Assignment 1 - Spaceship - Processing
# DT228/DT282 Object Oriented Programming 2017-2018

Instructions
---------
There are four main areas of functionality
* Planet switching
* Image Capture
* Movement
* Planet specifications

To move around the planet, from your keyboard press the UP key to speed the ship up in the forward direction. To move left around the planet
press the LEFT key and to move right around the planet press the RIGHT directional key. You can keep an eye on the smaller globe at the bottom of the screen for a sense of direction.

To read information about the planet over which you are flying press the 1st red button on the the screen with a left click of your mouse. This will show you information about the planet including its temperature (min/max), radius, orbital velocity, etc.

To choose another planet to navigate click on the second red button. A panel will appear with a list of planets and choosing a planet will change the planet.

To take an image of the current position of the planet, click the third red button. This will capture an image of your current position over the planet and it will then display it to the glass panel on screen. You will also receive confirmation that the image has been captured.

The 4th red button will turn on the spaceship's inner light.

Program Design
---------
The program was created in three dimensional space using Processing's P3D. This allowed the planet's sphere to be created and manipulated with regards to moving over it in three directions. The planets' texture is created from images which are then textured over the sphere. 

Each planet is related to information which is delivered via a csv file which contains rows of information for each individual planet. Each row is then associated with each individual planet and placed in an arrayList. 

The switches which are linked to the program's main features are created via a class which defines the size and position of each instance of the objects created. The switches are then monitored by a function which measures there position and waits for the mouse to be clicked within their dimensions. Depending on which switch is clicked, the specified function is then called.

The movement over the planet is controlled via a method which waits for a key to be pressed. If the key is the UP key it moves forward at an increased rate of radians. If the Left or Right key is pressed the planet rotates in that direction by rotating the sphere by the specified radians each time the project is drawn.

The sounds which play intermitantly play every 10 seconds. This is defined by specifying that each clip from an array is played when the frame count modular 60seconds x 10. This makes sure sound is only played every 10 seconds. The sound clips are loaded to the array when the program loads initially.

The camera method takes an image of the planet at its current position by first specifying the area that needs to be captured. Once the area has been captured it is saved as a JPG and saved to the data directory. If an image has been taken, it is then placed in an array and the first element of this array is then drawn to the screen on top of the glass panel with slight transparency. All images taken can be accessed after the program ends, via the data directory.

Online Video
---------
 A video of the program running is displayed here:

[![YouTube](http://img.youtube.com/vi/5h3g3IW1cgk/0.jpg)](https://www.youtube.com/watch?v=5h3g3IW1cgk) 



