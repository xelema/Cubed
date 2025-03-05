in vec3 texCoord;

#ifdef DISCARD_ALPHA
   #ifdef COLOR_MAP
      uniform sampler2DArray m_ColorMap;
#else
      uniform sampler2D m_DiffuseMap;
#endif
    uniform float m_AlphaDiscardThreshold;
#endif

out vec4 fragColor;

void main(){
    #ifdef DISCARD_ALPHA
       #ifdef COLOR_MAP
            if (texture(m_ColorMap, texCoord).a <= m_AlphaDiscardThreshold){
        discard;
    }
    #else
            if (texture(m_DiffuseMap, texCoord.xy).a <= m_AlphaDiscardThreshold){
        discard;
    }
    #endif
    #endif

    fragColor = vec4(1.0);
}