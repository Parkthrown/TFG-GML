/// @description Insert description here
// You can write your code in this editor
with(cutscene){
	event_user(0);
}

with(speaker){
	dialog_stop();
}

ds_list_destroy(dialog);
dialog = undefined;