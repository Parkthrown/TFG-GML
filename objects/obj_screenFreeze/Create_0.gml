/// @description Insert description here
// You can write your code in this editor
img = -1;
actor = obj_ambientManager;

with(obj_screenFreeze){
	if(id != other.id){
		instance_destroy(other);
		exit;
	}
}

time = 0;
alarm_set(1,1);