///@argument0 x
///@argument1 y
///@argument2 vessels
///@argument3 filename

var xx = argument0;
var yy = argument1;
var vessels = argument2;
var filename = argument3;
if(is_string(filename) && string_length(filename) > 0){
	draw_text(xx+30, yy-14, filename);
	draw_sprite(spr_waxPortraits,vessels%5,xx+9,yy+7);
	draw_sprite(spr_portrait,0,xx+9,yy+7);
	draw_sprite(spr_vessel,0,xx+47,yy+14);
	draw_sprite(spr_x,0,xx+53,yy+6);
	var barTexture = sprite_get_texture(spr_gradientBar,0);
	draw_primitive_begin_texture(pr_trianglestrip,barTexture);

			draw_vertex_texture(xx+44,yy+24,0,0);
			draw_vertex_texture(xx+44,yy+32,0,1);
			draw_vertex_texture(xx+76,yy+24,1,0);
			draw_vertex_texture(xx+76,yy+32,1,1);
		
	draw_primitive_end();
	draw_sprite(spr_progressBar,0,xx+44,yy+24);
	draw_text(xx+70,yy+7,vessels);
}else{
	draw_set_color(C_NES_GRAY_3);
	draw_set_halign(fa_center);
	draw_text(xx+SAVE_FILE_WIDTH/2,yy-8+SAVE_FILE_HEIGHT/2,EMPTY_FILE);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
}