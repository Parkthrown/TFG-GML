/// @description out of bounds death
// You can write your code in this editor
if(!point_in_rectangle(x,y,0,0,room_width,room_height)){
	HP = 0;
	event_user(events.hit);
}