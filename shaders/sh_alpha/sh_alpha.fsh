/*
Simple alpha Shader: Changes the gamma of an image
Fragment Shader: Multiply Alpha
*/

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float alpha;

void main()
{
    gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord ) * vec4(vec3(1.), alpha);
}
