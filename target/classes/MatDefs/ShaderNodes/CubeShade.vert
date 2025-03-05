#import "Common/ShaderLib/Skinning.glsllib"

uniform mat4 g_WorldViewProjectionMatrix;

#if defined(HAS_COLORMAP) || (defined(HAS_LIGHTMAP) && !defined(SEPARATE_TEXCOORD))
    #define NEED_TEXCOORD1
#endif

in vec3 inPosition;
in vec3 inTexCoord;
in vec2 inTexCoord2;
in vec4 inColor;

out vec3 texCoord1;
out vec2 texCoord2;

out vec4 vertColor;

void main(){
#ifdef NEED_TEXCOORD1
        texCoord1 = inTexCoord;
#endif

#ifdef SEPARATE_TEXCOORD
        texCoord2 = inTexCoord2;
#endif

#ifdef HAS_VERTEXCOLOR
        vertColor = inColor;
#endif

vec4 modelSpacePos = vec4(inPosition, 1.0);
#ifdef NUM_BONES
        Skinning_Compute(modelSpacePos);
#endif
    gl_Position = g_WorldViewProjectionMatrix * modelSpacePos;
}