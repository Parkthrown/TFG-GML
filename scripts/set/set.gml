///@argument data
var arr = argument0;
if(is_array(argument0)){
	for(var i = 0; i < array_length_1d(arr); i++){
		var a2 = arr[i];
		variable_instance_set(id,a2[0],a2[1]);
		show_debug_message(strcat(id, " variable ",a2[0], " is now ", a2[1]));
	}
}else{
	variable_instance_set(id,argument0,argument[1]);
}
