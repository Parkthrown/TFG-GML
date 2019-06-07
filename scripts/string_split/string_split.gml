
///@argument0 string
///@argument1 split factor
var split = argument1;
var newStr = "";
var result = [];
for(var i = 1; i<=string_length(argument0); i++){
	if(string_char_at(argument0,i) == string_char_at(split,0)){
		if(newStr != "") result[array_length_1d(result)] = newStr;
		newStr="";
		continue;
	}
	newStr+=string_char_at(argument0,i);
}

if(newStr != "") result[array_length_1d(result)] = newStr;

return result;