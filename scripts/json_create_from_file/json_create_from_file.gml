var json = "";
var file = file_text_open_read(argument0);
while(!file_text_eof(file)){
	json+=file_text_readln(file);
}
file_text_close(file);
return json;