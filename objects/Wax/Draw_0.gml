/// @description Insert description here
// You can write your code in this editor
var sty = stretch(y,16);
var stx = stretch(x,16);
if(alarm[2]%2)exit; 
#region trail
shader_set(sh_flatColor);
for(var i = ds_list_size(trail)-1; i >= 0 ;i--){
	var rand = choose(1,-1, 0);
	var arr = trail[|i];
	var palette = global.palettes[|(flameType < 6) ? flameType: (TIMER*2)%6];
	var color = rgbToGlsl(color_to_array(palette[(i%3)]));
	var u_Color = shader_get_uniform(sh_flatColor,"u_Color");
	shader_set_uniform_vec3(u_Color,color);
	draw_sprite_ext(arr[0],arr[1],round(arr[2]+rand),round(arr[3]-rand),arr[4],1,0,c_white,1.);
}
shader_reset();
#endregion
#region character drawing
fsm_execute_state(fsm_map,event_type,state);
#endregion