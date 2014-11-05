// Vertex shader implemented to perform lighting according to the
// Phong reflection model. The interpolation method that is used is
// Phong shading (per-fragment shading) and therefore the actual
// lighting calculations are performed in the fragment shader.

attribute highp vec3 posAttr;
attribute highp vec3 normalAttr;
attribute lowp vec4 colAttr;
uniform highp mat4 mvMatrix;
uniform highp mat4 pMatrix;
uniform highp mat3 nMatrix;

varying lowp vec4 col;

varying vec3 vNormalEye;
varying vec3 vPositionEye3;

uniform highp vec3 lightPosition;
uniform lowp vec3 ambientColor;
uniform lowp vec3 diffuseColor;
uniform lowp vec3 specularColor;

//could come from the program
const float shininess = 32.0;

void main()
{
    // Get vertex position in eye coordinates and send to the fragment shader
    vec4 vertexPositionEye4 = mvMatrix * vec4(posAttr, 1.0);
    vPositionEye3 = vertexPositionEye4.xyz / vertexPositionEye4.w;
    // Transform the normal to eye coordinates and send to fragment shader
    vNormalEye = normalize(nMatrix * normalAttr);
    // Transform the geometry
    gl_Position = pMatrix * mvMatrix * vec4(posAttr, 1.0);
    col = colAttr;
}

