/// @description Insert description here
// You can write your code in this editor
current = 0;
actions = undefined;
//actions contains an array, [ Int! , [ ] ]
//the integer value determines the next step in the cutscene, 

//0 executes a script, [ 0, [Script: String!, params: [any] ] ]

//1 creates an object, [ 1, [Object: object!, Script: String!, params: [any] ] ]
//the object is attached to an object creation script (preferably a json decoder for the properties);

//2 changes the camera, [ 2, [state: Int!, params: [follow: mixed!, speed: Int!] ] ]
//follow for state 0 is an object
//follow for state 1 is "vec", an array of 2 positions
//follow for state 2 is an array of 2 objects

//3 changes an object behavior [ 3, [object: object!, type: Int!, params: ...mixed!]
//params for state 0 is a sprite, an image and a boolean determining if current should change 
//params for state 1 is an overseer object and a boolean determining if current should change 
//params for state 2 is a sprite, an variable name and the value it will hold.

//4 sets a timer for current to change, [  4, [ alarm: Int!, time: Int! ] ]


