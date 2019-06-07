//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec3 u_Color;
void main()
{
	
   vec4 finalTex = texture2D( gm_BaseTexture, v_vTexcoord );
   gl_FragColor = vec4(u_Color,finalTex.a);
						
}
