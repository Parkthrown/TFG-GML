
ds_list_insert(trail,0,[sprite_index,image_index,x,y,image_xscale]);
ds_list_pop(trail,2);
var size = ds_list_size(trail);
if(size){
	alarm_set(5,5);
}