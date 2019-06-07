
ds_list_insert(trail,0,[sprite_index,image_index,x,y,image_xscale]);
while(ds_list_size(trail)>=maxTrail){
	ds_list_pop(trail);
}
alarm_set(5,3);