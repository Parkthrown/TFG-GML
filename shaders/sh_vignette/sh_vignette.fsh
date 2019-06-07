//
// Simple passthrough fragment shader
//
#ifdef GL_ES
precision mediump float;
#endif

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_resolution;
uniform float u_time;
uniform float u_radius;
uniform vec2 u_center;


float noise (vec2 st) {
   return fract(sin(dot(st.xy,
   vec2(0.,0.00010)))*
   543758.5453123);
}

float greysc(vec3 vec){
    return (vec.r+vec.g+vec.b)/3.;
}

float binaryNoise(float f,vec2 st){
    return ceil(f-0.5*noise(st));
}
void main() {
    vec2 st = gl_FragCoord.xy/u_resolution.xy - u_center;
    st.x *= u_resolution.x/u_resolution.y;
    float s = -0.188;
	float r = u_radius*abs(cos(u_time));
    float steps = length(st)-r;
    vec3 colors = vec3(1.)*smoothstep(r,s,steps);
   	colors.rgb = vec3(binaryNoise(greysc(colors),st));
    gl_FragColor = vec4(colors,-(colors.r-1.));
}