
shader_set(sh_flameType);
flameType_set_palette(flameType);
draw_sprite_ext(spr_Ctip,TIMER*4,x,y-8,image_xscale,1,0,c_white,1.);
shader_reset();