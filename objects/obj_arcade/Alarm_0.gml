/// @description Insert description here
// You can write your code in this editor
with(instance_create_depth(0,0,0,arcadeType)){
			saveRoom = room;
}
with(instance_create_depth(x,y,0,obj_transition)){
	tTime = 0;
	ammount = 1;
}
room_goto(roomWarp);
