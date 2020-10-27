/*
* Copyright (c) 2020 AoiKamishiro
*
* This code is provided under the MIT license.
*
*/

Shader "Kamishiro/MultiTexturePoster/Unlit"
{
    Properties
    {
        _Mode ("Transition Mode", int) = 0
        _DispTime ("Display Time", int) = 5
        [HideInInspector]_FadeTime ("Fadeing Time", float) = 1
        _Count ("Poster Count", int) = 5
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

            struct appdata_t
            {
                float4 vertex: POSITION;
                float2 uv: TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };

            struct v2f
            {
                float4 vertex: SV_POSITION;
                float2 uv: TEXCOORD0;
                UNITY_FOG_COORDS(1)
                UNITY_VERTEX_OUTPUT_STEREO
            };

            float _DispTime;
            float _FadeTime;
            int _Mode;
            int _Count;
            float4 _MainTex_ST;

            UNITY_DECLARE_TEX2D(_MainTex);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex1);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex2);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex3);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex4);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex5);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex6);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex7);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex8);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex9);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex10);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex11);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex12);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex13);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex14);
            UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex15);

            fixed4 SimpleMode(v2f i)
            {
                fixed4 col = fixed4(0, 0, 0, 1);
                float localTimes = fmod(_Time.y, _Count * _DispTime);
                if (0 <= localTimes && localTimes < _DispTime)
                {
                    col = UNITY_SAMPLE_TEX2D(_MainTex, i.uv.xy).rgba;
                }
                if(_DispTime <= localTimes && localTimes < _DispTime * 2)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex1, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 2 <= localTimes && localTimes < _DispTime * 3)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex2, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 3 <= localTimes && localTimes < _DispTime * 4)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex3, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 4 <= localTimes && localTimes < _DispTime * 5)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex4, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 5 <= localTimes && localTimes < _DispTime * 6)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex5, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 6 <= localTimes && localTimes < _DispTime * 7)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex6, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 7 <= localTimes && localTimes < _DispTime * 8)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex7, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 8 <= localTimes && localTimes < _DispTime * 9)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex8, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 9 <= localTimes && localTimes < _DispTime * 10)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex9, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 10 <= localTimes && localTimes < _DispTime * 11)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex10, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 11 <= localTimes && localTimes < _DispTime * 12)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex11, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 12 <= localTimes && localTimes < _DispTime * 13)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex12, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 13 <= localTimes && localTimes < _DispTime * 14)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex13, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 14 <= localTimes && localTimes < _DispTime * 15)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex14, _MainTex, i.uv.xy).rgba;
                }
                if(_DispTime * 15 <= localTimes && localTimes < _DispTime * 16)
                {
                    col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex15, _MainTex, i.uv.xy).rgba;
                }
                return col;
            }

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
                col = SimpleMode(i);
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
