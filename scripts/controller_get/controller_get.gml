///@argument0 key(string) 
///@argument1 device
///@argument2 mode(1=check,2=pressed,3=released,4=axis)
return gamepad_button_check(argument1,global.contMap[?argument0]);