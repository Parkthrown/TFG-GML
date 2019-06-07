
var loop = 0;
var level = global.shortcuts[|global.level];
for(var i = 0; i<2; i++) 
for(var j = 0; j<2; j++){
	if(level[loop]){
		draw_sprite_ext(spr_keyCard,loop,argument0-50-4+j*22,9+i*15,1,1,270,c_white,1);
	}else{
		shader_set(sh_outlineOnly);
		var uvs = TexelArray(spr_keyCard,0);
		var uf = shader_get_uniform(sh_outlineOnly,"u_vTexSize");
		shader_set_uniform_f(uf,uvs[0],uvs[1]);
		var uf = shader_get_uniform(sh_outlineOnly,"u_vColor");
		shader_set_uniform_f(uf,1.,1.,1.);
		draw_sprite_ext(spr_keyCard,0,argument0-50-4+j*22,9+i*15,1,1,270,c_white,1);
		shader_reset();
	}
	loop++;
}