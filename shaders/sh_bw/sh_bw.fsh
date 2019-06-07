//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_fExposure;
void main()
{
   vec4 out_col = texture2D( gm_BaseTexture, v_vTexcoord );
	 vec3 gsc = vec3(floor(dot(out_col.rgb,vec3(0.35+u_fExposure))+0.5));
	 out_col = vec4(gsc,out_col.a);
	 gl_FragColor = out_col;
		
}
