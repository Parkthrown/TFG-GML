/// @description Insert description here
// You can write your code in this editor


for(var i = 0; i < ds_list_size(sysList); i++){
	var list = sysList[|i];
	for(var j = 0; j < ds_list_size(list); j++){
		part_system_update(list[|j]);
	}
}