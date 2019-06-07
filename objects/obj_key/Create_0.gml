/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

lock = 0;
var arr = global.shortcuts[|global.level];
show_debug_message(arr[lock]);
if(arr[lock] == 1) instance_destroy();