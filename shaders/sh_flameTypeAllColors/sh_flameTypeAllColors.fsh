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
	gl_FragColor = texColor;
}