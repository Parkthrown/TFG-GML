/// @description Insert description here
// You can write your code in this editor
x = target.bbox_right-(abs(target.bbox_right-target.bbox_left)/2-1);
y = target.bbox_top-12;
with(target){
	if(!place_meeting(x,y,obj_player)){
		instance_destroy(other);
	}
}