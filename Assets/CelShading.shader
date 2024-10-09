Shader "Custom/CelShading"
{
    Properties
    {
        _Colour ("Color", Color) = (1,1,1,1) // Colour i use since for the midterm i didn't have any textures
        _MainTex("Main Texture", 2D) = "white"{} // object main texture if i were to not use coloud
        _RampTex("Ramp Texture", 2D) = "white"{}// greyscale ramp texture used to get shadow darkness
        _Brightness("Brightness", Range(0,1))=0 // effect the shader has on object
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf ToonRamp

        float4 _Colour;
        fixed _Brightness;
        sampler2D _RampTex;
        sampler2D _MainTex;


        float4 LightingToonRamp(SurfaceOutput s, fixed2 lightDir, fixed atten){
            float dif = dot (s.Normal,lightDir); // calculate angle between normal and lightdirection
            float h = dif * .5 +.5; // turn this into number from 0-1
            float2 rh = h;
            float3 ramp = tex2D(_RampTex, rh).rgb; // get shadow colour by sampling rampTex
            float4 c;
            c.rgb = s.Albedo*_LightColor0.rgb*(ramp); // set colour based on albedo, light colour, and shadow darkness.
            c.a = s.Alpha;
            return c*_Brightness; // return new brightness
        }

        struct Input{
           float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o){
            o.Albedo = _Colour.rgb;
        }
        ENDCG
        
       
    }

}
