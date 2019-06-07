//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float percent;

void main()
{

   vec4 texColor = texture2D( gm_BaseTexture, v_vTexcoord );
   float greyscale = (texColor.r+texColor.g+texColor.b)/3.0;
   greyscale = greyscale/2.6;
   float final = floor((greyscale + percent)*6.0)/6.0;
   texColor = vec4(vec3(final),texColor.a);
   gl_FragColor = texColor;
   
}