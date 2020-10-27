/*
* Copyright (c) 2020 AoiKamishiro
*
* This code is provided under the MIT license.
*
*/

Shader "Kamishiro/MultiTexturePoster/Surface"
{
    Properties
    {
        [HideInInspector]_Mode ("Transition Mode", int) = 0
        _DispTime ("Display Time", float) = 5
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
        Tags { "RenderType" = "Opaque" }
        LOD 200
        Cull [_Cull]
        
        CGPROGRAM
        
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows
        
        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 4.0
        
        float _DispTime;
        float _FadeTime;
        int _Mode;
        int _Count;
        
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
        
        struct Input
        {
            float2 uv_MainTex;
        };
        
        fixed4 SimpleMode(Input IN)
        {
            fixed4 col = fixed4(0, 0, 0, 1);
            float localTime = fmod(_Time.y, _Count * _DispTime);
            if (0 <= localTime && localTime < _DispTime)
            {
                col = UNITY_SAMPLE_TEX2D(_MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime <= localTime && localTime < _DispTime * 2)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex1, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 2 <= localTime && localTime < _DispTime * 3)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex2, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 3 <= localTime && localTime < _DispTime * 4)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex3, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 4 <= localTime && localTime < _DispTime * 5)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex4, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 5 <= localTime && localTime < _DispTime * 6)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex5, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 6 <= localTime && localTime < _DispTime * 7)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex6, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 7 <= localTime && localTime < _DispTime * 8)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex7, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 8 <= localTime && localTime < _DispTime * 9)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex8, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 9 <= localTime && localTime < _DispTime * 10)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex9, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 10 <= localTime && localTime < _DispTime * 11)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex10, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 11 <= localTime && localTime < _DispTime * 12)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex11, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 12 <= localTime && localTime < _DispTime * 13)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex12, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 13 <= localTime && localTime < _DispTime * 14)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex13, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 14 <= localTime && localTime < _DispTime * 15)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex14, _MainTex, IN.uv_MainTex).rgba;
            }
            if(_DispTime * 15 <= localTime && localTime < _DispTime * 16)
            {
                col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex15, _MainTex, IN.uv_MainTex).rgba;
            }
            return col;
        }
        
        UNITY_INSTANCING_BUFFER_START(Props)
        // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)
        
        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = SimpleMode(IN);
            o.Albedo = c.rgb;
            o.Alpha = 1.0;
        }
        ENDCG
        
    }
    FallBack "Standard"
    CustomEditor "Kamishiro.UnityShader.MultiTexturePoster.SurfaceGUI"
}
