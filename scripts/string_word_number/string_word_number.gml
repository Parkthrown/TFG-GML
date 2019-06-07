
///@argument0 string
///@argument1 word
var word = argument1;
var pivot = 0;
var newStr = "";
var wordCount = 0;
for(var i = 1; i<=string_length(argument0); i++){
	if(pivot){
		newStr+=string_char_at(argument0,i);
		if(string_char_at(argument0,i) == " " ) return newStr;
	}else{
		if(string_char_at(argument0,i) != " "){
			if(wordCount >= word){
				pivot = 1;
				i--;
				continue;
			}else{
				wordCount++;
			}
		}
	}
}

return (pivot) ? newStr: -1;