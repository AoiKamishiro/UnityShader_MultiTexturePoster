﻿/*
* Copyright (c) 2020 AoiKamishiro
*
* This code is provided under the MIT license.
*
*/

Shader "Kamishiro/MultiTexturePoster/XFade_Surface"
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
        Tags { "RenderType" = "Opaque" }
        LOD 200
        Cull [_Cull]
        
        CGPROGRAM
        
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows
        
        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 4.0
        
        #include "SurfaceCore.hlsl"
        
        float _ManualSelect;
        int _Select;
        
        struct Input
        {
            float2 uv_MainTex;
        };
        
        UNITY_INSTANCING_BUFFER_START(Props)
        // put more per-instance properties here
        UNITY_INSTANCING_BUFFER_END(Props)
        
        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            float localTime = fmod(_Time.y, _CycleTime);
            fixed4 c = XFadeMode(IN.uv_MainTex, localTime);
            //fixed4 c =  UNITY_SAMPLE_TEX2D(_MainTex, IN.uv_MainTex).rgba;
            o.Albedo = c.rgb;
            o.Alpha = 1.0;
        }
        ENDCG
        
    }
    FallBack "Standard"
    CustomEditor "Kamishiro.UnityShader.MultiTexturePoster.SurfaceGUI"
}
