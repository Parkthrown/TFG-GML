var file = json_encode(global.contMap);
if(file_exists(CONTROLLER_FILE)) file_delete(CONTROLLER_FILE);
var tx = file_text_open_write(CONTROLLER_FILE);
file_text_write_string(tx,file);
file_text_close(tx);