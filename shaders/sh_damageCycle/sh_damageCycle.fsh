//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec3 u_vColors[4];
uniform float u_time;

float average(vec3 v3){
	return (v3.x+v3.y+v3.z)/3.;
}

void main()
{
    vec4 v_tex = v_vColour *  texture2D( gm_BaseTexture, v_vTexcoord );
	// uv remapping
	gl_FragColor = vec4(u_vColors[int(mod(floor(((average(v_tex.rgb)*u_time) * 4.)+0.5),4.))],v_tex.a);
}
