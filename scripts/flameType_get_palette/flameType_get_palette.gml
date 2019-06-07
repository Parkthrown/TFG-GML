if(argument0 < 6){
	var palette = global.palettes[|argument0%6];
	var c_light = color_to_array(palette[0]);
	var c_middle = color_to_array(palette[1]);
	var c_dark = color_to_array(palette[2]);
}else{
	var palette = global.palettes[|(TIMER*2)%6];
	var c_light = color_to_array(palette[0]);
	var c_middle = color_to_array(palette[1]);
	var c_dark = color_to_array(palette[2]);
}

return rgbToGlsl(array_append(c_light,c_middle,c_dark));