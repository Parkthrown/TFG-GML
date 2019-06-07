/// @description Insert description here
// You can write your code in this editor
if(holding){
	with(holding){
		grabber = 0;
	}
}
ds_list_destroy(trail);
surface_free(capeSurf);
ds_map_destroy(fsm_map);