///@argument cats

var str = "";
for(var i = 0; i< argument_count; i++){
	str += (is_string(argument[i])) ? argument[i] : string(argument[i]);
}
return str;