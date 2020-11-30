float _DispTime;
float _FadeTime;
int _Count;
float _Direction;
float _SingleTime;
float _CycleTime;
//float4 _MainTex_ST;

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
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex16);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex17);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex18);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex19);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex20);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex21);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex22);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex23);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex24);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex25);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex26);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex27);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex28);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex29);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex30);
UNITY_DECLARE_TEX2D_NOSAMPLER(_Tex31);

fixed4 SimpleMode(float2 uv, float localTime)
{
    fixed4 col = fixed4(0, 0, 0, 1);
    if (0 <= localTime && localTime < _SingleTime)
    {
        col = UNITY_SAMPLE_TEX2D(_MainTex, uv).rgba;
    }
    if(_SingleTime <= localTime && localTime < _SingleTime * 2)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex1, _MainTex, uv).rgba;
    }
    if(_SingleTime * 2 <= localTime && localTime < _SingleTime * 3)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex2, _MainTex, uv).rgba;
    }
    if(_SingleTime * 3 <= localTime && localTime < _SingleTime * 4)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex3, _MainTex, uv).rgba;
    }
    if(_SingleTime * 4 <= localTime && localTime < _SingleTime * 5)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex4, _MainTex, uv).rgba;
    }
    if(_SingleTime * 5 <= localTime && localTime < _SingleTime * 6)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex5, _MainTex, uv).rgba;
    }
    if(_SingleTime * 6 <= localTime && localTime < _SingleTime * 7)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex6, _MainTex, uv).rgba;
    }
    if(_SingleTime * 7 <= localTime && localTime < _SingleTime * 8)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex7, _MainTex, uv).rgba;
    }
    if(_SingleTime * 8 <= localTime && localTime < _SingleTime * 9)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex8, _MainTex, uv).rgba;
    }
    if(_SingleTime * 9 <= localTime && localTime < _SingleTime * 10)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex9, _MainTex, uv).rgba;
    }
    if(_SingleTime * 10 <= localTime && localTime < _SingleTime * 11)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex10, _MainTex, uv).rgba;
    }
    if(_SingleTime * 11 <= localTime && localTime < _SingleTime * 12)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex11, _MainTex, uv).rgba;
    }
    if(_SingleTime * 12 <= localTime && localTime < _SingleTime * 13)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex12, _MainTex, uv).rgba;
    }
    if(_SingleTime * 13 <= localTime && localTime < _SingleTime * 14)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex13, _MainTex, uv).rgba;
    }
    if(_SingleTime * 14 <= localTime && localTime < _SingleTime * 15)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex14, _MainTex, uv).rgba;
    }
    if(_SingleTime * 15 <= localTime && localTime < _SingleTime * 16)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex15, _MainTex, uv).rgba;
    }
    if(_SingleTime * 16 <= localTime && localTime < _SingleTime * 17)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex16, _MainTex, uv).rgba;
    }
    if(_SingleTime * 17 <= localTime && localTime < _SingleTime * 18)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex17, _MainTex, uv).rgba;
    }
    if(_SingleTime * 18 <= localTime && localTime < _SingleTime * 19)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex18, _MainTex, uv).rgba;
    }
    if(_SingleTime * 19 <= localTime && localTime < _SingleTime * 20)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex19, _MainTex, uv).rgba;
    }
    if(_SingleTime * 20 <= localTime && localTime < _SingleTime * 21)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex20, _MainTex, uv).rgba;
    }
    if(_SingleTime * 21 <= localTime && localTime < _SingleTime * 22)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex21, _MainTex, uv).rgba;
    }
    if(_SingleTime * 22 <= localTime && localTime < _SingleTime * 23)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex22, _MainTex, uv).rgba;
    }
    if(_SingleTime * 23 <= localTime && localTime < _SingleTime * 24)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex23, _MainTex, uv).rgba;
    }
    if(_SingleTime * 24 <= localTime && localTime < _SingleTime * 25)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex24, _MainTex, uv).rgba;
    }
    if(_SingleTime * 25 <= localTime && localTime < _SingleTime * 26)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex25, _MainTex, uv).rgba;
    }
    if(_SingleTime * 26 <= localTime && localTime < _SingleTime * 27)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex26, _MainTex, uv).rgba;
    }
    if(_SingleTime * 27 <= localTime && localTime < _SingleTime * 28)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex27, _MainTex, uv).rgba;
    }
    if(_SingleTime * 28 <= localTime && localTime < _SingleTime * 29)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex28, _MainTex, uv).rgba;
    }
    if(_SingleTime * 29 <= localTime && localTime < _SingleTime * 30)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex29, _MainTex, uv).rgba;
    }
    if(_SingleTime * 30 <= localTime && localTime < _SingleTime * 31)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex30, _MainTex, uv).rgba;
    }
    if(_SingleTime * 31 <= localTime && localTime < _SingleTime * 32)
    {
        col = UNITY_SAMPLE_TEX2D_SAMPLER(_Tex31, _MainTex, uv).rgba;
    }
    return col;
}

fixed4 XFadeMode(float2 uv, float localTime)
{
    fixed4 col = fixed4(0, 0, 0, 1);
    float current = fmod(localTime, _SingleTime);
    if(current < _DispTime)
    {
        col = SimpleMode(uv, localTime);
    }
    else
    {
        float nextLocamTime = fmod(localTime + _SingleTime, _CycleTime);
        float ratio = (current - _DispTime) / _FadeTime;
        col = SimpleMode(uv, localTime) * (1 - ratio) + SimpleMode(uv, nextLocamTime) * ratio;
    }
    return col;
}

fixed4 SlideMode(float2 uv, float localTime)
{
    fixed4 col = fixed4(0, 0, 0, 1);
    float current = fmod(localTime, _SingleTime);
    if(current < _DispTime)
    {
        col = SimpleMode(uv, localTime);
    }
    else
    {
        float nextLocamTime = fmod(localTime + _SingleTime, _CycleTime);
        float ratio = (current - _DispTime) / _FadeTime;
        
        if(_Direction == 0 || _Direction == 1)
        {
            float2 uv1 = float2(uv.x, _Direction == 0?uv.y - ratio: uv.y + ratio);
            if(_Direction == 0)
            {
                if(uv.y > ratio)
                {
                    col = SimpleMode(uv1, localTime);
                }
                else
                {
                    col = SimpleMode(uv1, nextLocamTime);
                }
            }
            else
            {
                if(uv.y > (1 - ratio))
                {
                    col = SimpleMode(uv1, nextLocamTime);
                }
                else
                {
                    col = SimpleMode(uv1, localTime);
                }
            }
            /*
            col = _Direction == 0
            ?uv.y > ratio
            ?SimpleMode(uv1, localTime)
            : SimpleMode(uv1, nextLocamTime)
            : uv.y > (1 - ratio)
            ?SimpleMode(uv1, nextLocamTime)
            : SimpleMode(uv1, localTime);
            */
        }
        if (_Direction == 2 || _Direction == 3)
        {
            float2 uv1 = float2(_Direction == 2?uv.x - ratio: uv.x + ratio, uv.y);
            if(_Direction == 2)
            {
                if(uv.x > ratio)
                {
                    col = SimpleMode(uv1, localTime);
                }
                else
                {
                    col = SimpleMode(uv1, nextLocamTime);
                }
                if(uv.x > (1 - ratio))
                {
                    SimpleMode(uv1, nextLocamTime);
                }
                else
                {
                    SimpleMode(uv1, localTime);
                }
            }
            /*
            col = _Direction == 2
            ?uv.x > ratio
            ?SimpleMode(uv1, localTime)
            : SimpleMode(uv1, nextLocamTime)
            : uv.x > (1 - ratio)
            ?SimpleMode(uv1, nextLocamTime)
            : SimpleMode(uv1, localTime);
            */
        }
    }
    return col;
}