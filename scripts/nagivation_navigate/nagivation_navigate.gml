///@arg navigator
///@arg room
///@arg transition
///@arg navigation data


var nav = argument[0];
var _room = argument[1];

nav[?navigation.prevRoom] = room;
nav[?navigation.nextRoom] = _room;

if(argument_count < 3) {
	room_goto(_room);
}else{
	if(argument[2]) instance_create_depth(0,0,0,argument[2]);
	if(argument_count > 3){
		nav[?navigation.payload] = argument[3];
	}
}