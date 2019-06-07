//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_Color;
void main()
{
	
   vec4 finalTex = texture2D( gm_BaseTexture, v_vTexcoord );
   vec3 gsc = vec3((finalTex.x+finalTex.y+finalTex.z)/3.);
   gl_FragColor = vec4(((vec3(ceil(gsc.x))+u_Color)-vec3(1.)),finalTex.a);
						
}
