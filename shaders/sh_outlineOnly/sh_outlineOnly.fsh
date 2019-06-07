//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vTexSize;
uniform vec3 u_vColor;

void main()
{	
	vec4 tex = texture2D( gm_BaseTexture, v_vTexcoord );
	float alpha = tex.a;
	
	if(alpha<=0.){
		alpha+= 
		ceil(texture2D( gm_BaseTexture, v_vTexcoord + vec2(u_vTexSize.x,0.)).a)+
		ceil(texture2D( gm_BaseTexture, v_vTexcoord - vec2(u_vTexSize.x,0.)).a)+
		ceil(texture2D( gm_BaseTexture, v_vTexcoord + vec2(0.,u_vTexSize.x)).a)+
		ceil(texture2D( gm_BaseTexture, v_vTexcoord - vec2(0.,u_vTexSize.x)).a);
		gl_FragColor = vec4(vec3(u_vColor),alpha);
		return;
	}else{
		gl_FragColor = vec4(0.,0.,0.,0.);
	}
	
   
}
