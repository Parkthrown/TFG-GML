///@arg list
///@arg quantity
if(ds_list_size(argument[0])){
	ds_list_delete(argument[0],ds_list_size(argument[0])-1);
	if(argument_count > 1 && argument[1]) ds_list_pop(argument[0],argument[1]-1);
}