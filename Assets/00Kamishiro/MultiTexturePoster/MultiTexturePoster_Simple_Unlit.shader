/*
* Copyright (c) 2020 AoiKamishiro
*
* This code is provided under the MIT license.
*
*/

Shader "Kamishiro/MultiTexturePoster/Simple_Unlit"
{
    Properties
    {
        _DispTime ("Display Time", float) = 5
        _FadeTime ("Transition Time", float) = 1
        _Count ("Poster Count", int) = 5
        [HideInInspector]_SingleTime ("Total Time", float) = 6//Calc in UI
        [HideInInspector]_CycleTime ("Cycle Time", float) = 30//Calc in UI
        [Enum(Up, 0, Down, 1, Right, 2, Left, 3)]_Direction ("Scroll Direction", float) = 0
        [Toggle]_ManualSelect ("Manual Select", float) = 0
        _Select ("Select", int) = 0
        _MainTex ("Texture0", 2D) = "white" { }
        _Tex1 ("Texture1", 2D) = "white" { }
        _Tex2 ("Texture2", 2D) = "white" { }
        _Tex3 ("Texture3", 2D) = "white" { }
        _Tex4 ("Texture4", 2D) = "white" { }
        _Tex5 ("Texture5", 2D) = "white" { }
        _Tex6 ("Texture6", 2D) = "white" { }
        _Tex7 ("Texture7", 2D) = "white" { }
        _Tex8 ("Texture8", 2D) = "white" { }
        _Tex9 ("Texture9", 2D) = "white" { }
        _Tex10 ("Texture10", 2D) = "white" { }
        _Tex11 ("Texture11", 2D) = "white" { }
        _Tex12 ("Texture12", 2D) = "white" { }
        _Tex13 ("Texture13", 2D) = "white" { }
        _Tex14 ("Texture14", 2D) = "white" { }
        _Tex15 ("Texture15", 2D) = "white" { }
        _Tex16 ("Texture16", 2D) = "white" { }
        _Tex17 ("Texture17", 2D) = "white" { }
        _Tex18 ("Texture18", 2D) = "white" { }
        _Tex19 ("Texture19", 2D) = "white" { }
        _Tex20 ("Texture20", 2D) = "white" { }
        _Tex21 ("Texture21", 2D) = "white" { }
        _Tex22 ("Texture22", 2D) = "white" { }
        _Tex23 ("Texture23", 2D) = "white" { }
        _Tex24 ("Texture24", 2D) = "white" { }
        _Tex25 ("Texture25", 2D) = "white" { }
        _Tex26 ("Texture26", 2D) = "white" { }
        _Tex27 ("Texture27", 2D) = "white" { }
        _Tex28 ("Texture28", 2D) = "white" { }
        _Tex29 ("Texture29", 2D) = "white" { }
        _Tex30 ("Texture30", 2D) = "white" { }
        _Tex31 ("Texture31", 2D) = "white" { }
        [HideInInspector]_Version ("Version", int) = 0
        [Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull Mode", float) = 2
    }

    SubShader
    {
        Tags { "RenderType" = "Opaque" "IgnoreProjector" = "True" }
        LOD 100
        Lighting Off
        Cull [_Cull]

        Pass
        {
            CGPROGRAM
            
            #pragma vertex vert
            #pragma fragment frag
            #pragma target 4.0
            #pragma shader_feature _ _ALPHATEST_ON _ALPHAPREMULTIPLY_ON
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            #include "UnlitCore.hlsl"

            float _ManualSelect;
            int _Select;

            v2f vert(appdata_t v)
            {
                v2f o;
                UNITY_SETUP_INSTANCE_ID(v);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o, o.vertex);
                return o;
            }

            fixed4 frag(v2f i): SV_Target
            {
                fixed4 col;
                float localTime = 0;
                if (_ManualSelect == 0)
                {
                    localTime = fmod(_Time.y, _CycleTime);
                }
                else
                {
                    localTime = fmod(_SingleTime * _Select + 0.001, _CycleTime);
                }
                col = SimpleMode(i.uv.xy, localTime);
                UNITY_APPLY_FOG(i.fogCoord, col);
                UNITY_OPAQUE_ALPHA(col.a);
                return col;
            }
            ENDCG
            
        }
    }
    Fallback "Unlit"
    CustomEditor "Kamishiro.UnityShader.MultiTexturePoster.UnlitGUI"
}
