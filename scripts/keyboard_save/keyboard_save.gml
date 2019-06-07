var file = json_encode(global.kMap);
if(file_exists(KEYBOARD_FILE)) file_delete(KEYBOARD_FILE);
var tx = file_text_open_write(KEYBOARD_FILE);
file_text_write_string(tx,file);
file_text_close(tx);