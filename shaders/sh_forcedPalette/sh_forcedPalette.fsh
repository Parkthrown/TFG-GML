//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform sampler2D u_sPalette;
uniform float u_fLight;

void main()
{
	vec4 col =  texture2D( gm_BaseTexture, v_vTexcoord );
	col.rgb += u_fLight;
	gl_FragColor = vec4(texture2D(u_sPalette, vec2(col.r*0.125+floor(col.b*8.0)*0.125,col.g)).rgb,col.a);
}