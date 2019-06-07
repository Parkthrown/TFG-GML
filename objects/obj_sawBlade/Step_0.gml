/// @description Insert description here
// You can write your code in this editor
if(!alarm[0]){
	hsp = lerp(hsp,maxhsp * sign(x_path[current_paths[0]] - x),x_accel);
	if(sign(x-x_path[current_paths[0]]) == sign(hsp) 
	&& in_range_of(x,x_path[current_paths[0]],hsp)){
		hsp = 0;
		alarm_set(0,delay);
	}
}
if(!alarm[1]){
	vsp = lerp(vsp,maxvsp * sign(y_path[current_paths[1]] - y),y_accel);
	if(sign(y-y_path[current_paths[1]]) == sign(vsp)
	&& in_range_of(y,y_path[current_paths[1]],vsp)){
		vsp = 0;
		alarm_set(1,delay);
	}
}

x+=hsp;
y+=vsp;

hbox = hitbox_in(bbox_left,bbox_top,bbox_right,bbox_bottom,TARGETEABLE,hbox);
for(var i = 0; i<ds_list_size(hbox); i++){
	var hit = hbox[|i]
	if(attack_instance(hit,damage,10,knockback,0,(hit.x > x) ? 315: 45)){
		with(hit){
			if(object_is_ancestor(object_index,obj_player)){
				shaker(1.2,15,obj_Cam);
				sleep(1);
			}
		}
	}
}
ds_list_clear(hbox);
