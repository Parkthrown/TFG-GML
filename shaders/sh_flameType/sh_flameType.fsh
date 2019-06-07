//
// Simple passthrough fragment shader
// precision lowp float;
#ifdef GL_ES
#define precision lowp float;
#endif
#define COLORS_AMMOUNT 3



varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_vReplaceColors[COLORS_AMMOUNT];
uniform vec3 u_vColors[COLORS_AMMOUNT];
uniform float alpha;

void main(){
	vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord); 
	for(int i = 0; i < COLORS_AMMOUNT; ++i){
		if(all(equal(vec3(u_vReplaceColors[i]),texColor.rgb))){
			gl_FragColor = vec4(u_vColors[i],1.);
			return;
		}
	}
	gl_FragColor = texColor;
}