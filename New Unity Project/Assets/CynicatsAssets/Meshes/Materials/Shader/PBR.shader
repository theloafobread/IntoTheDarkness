// Shader created with Shader Forge Beta 0.36 
// Shader Forge (c) Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:0.36;sub:START;pass:START;ps:flbk:,lico:1,lgpr:1,nrmq:1,limd:3,uamb:True,mssp:True,lmpd:True,lprd:False,enco:False,frtr:True,vitr:True,dbil:True,rmgx:True,rpth:0,hqsc:True,hqlp:False,tesm:0,blpr:0,bsrc:0,bdst:0,culm:0,dpts:2,wrdp:True,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,ofsf:0,ofsu:0,f2p0:False;n:type:ShaderForge.SFN_Final,id:1,x:32570,y:32797|diff-220-OUT,spec-226-OUT,gloss-52-OUT,normal-14-RGB;n:type:ShaderForge.SFN_Tex2d,id:3,x:33504,y:31891,ptlb:BaseColor,ptin:_BaseColor,tex:8be23cc687b17874694e5664d43a4b3a,ntxv:0,isnm:False|UVIN-91-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:14,x:33504,y:32521,ptlb:Normal,ptin:_Normal,tex:5e366109e5976c4408fa77aca700a06a,ntxv:3,isnm:True|UVIN-91-UVOUT;n:type:ShaderForge.SFN_Lerp,id:20,x:33222,y:31987|A-3-RGB,B-23-OUT,T-25-R;n:type:ShaderForge.SFN_Vector3,id:23,x:33504,y:32046,v1:0,v2:0,v3:0;n:type:ShaderForge.SFN_Tex2d,id:25,x:33504,y:32161,ptlb:Metallic,ptin:_Metallic,tex:04fc81123ab5de04db982dbec74251fe,ntxv:2,isnm:False|UVIN-91-UVOUT;n:type:ShaderForge.SFN_Lerp,id:37,x:33227,y:32200|A-40-OUT,B-3-RGB,T-25-R;n:type:ShaderForge.SFN_Vector1,id:40,x:33227,y:32148,v1:0.04;n:type:ShaderForge.SFN_OneMinus,id:52,x:33227,y:32328|IN-204-OUT;n:type:ShaderForge.SFN_Tex2d,id:53,x:33829,y:32337,ptlb:Roughness,ptin:_Roughness,tex:ccd57b9dc4daba6409fd9373d9bdebf0,ntxv:0,isnm:False|UVIN-91-UVOUT;n:type:ShaderForge.SFN_Parallax,id:91,x:33743,y:32009|UVIN-92-UVOUT,HEI-131-OUT;n:type:ShaderForge.SFN_TexCoord,id:92,x:34102,y:31876,uv:0;n:type:ShaderForge.SFN_Tex2d,id:98,x:34102,y:32034,ptlb:HeightMap,ptin:_HeightMap,tex:fdd5962ae5bfe494089db1691d3bc2f1,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:131,x:33929,y:32090|A-98-R,B-132-OUT;n:type:ShaderForge.SFN_ValueProperty,id:132,x:34102,y:32207,ptlb:HeightRange,ptin:_HeightRange,glob:False,v1:1;n:type:ShaderForge.SFN_RemapRangeAdvanced,id:204,x:33493,y:32353|IN-53-R,IMIN-206-OUT,IMAX-207-OUT,OMIN-210-OUT,OMAX-211-OUT;n:type:ShaderForge.SFN_Vector1,id:206,x:33829,y:32488,v1:0;n:type:ShaderForge.SFN_Vector1,id:207,x:33829,y:32535,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:210,x:33831,y:32598,ptlb:RoughnessMin,ptin:_RoughnessMin,glob:False,v1:0;n:type:ShaderForge.SFN_ValueProperty,id:211,x:33831,y:32667,ptlb:RoughnessMax,ptin:_RoughnessMax,glob:False,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:219,x:33314,y:31700,ptlb:Brightness,ptin:_Brightness,glob:False,v1:1;n:type:ShaderForge.SFN_Multiply,id:220,x:32885,y:32165|A-274-OUT,B-20-OUT;n:type:ShaderForge.SFN_Multiply,id:226,x:32902,y:32379|A-37-OUT,B-274-OUT;n:type:ShaderForge.SFN_Multiply,id:274,x:33141,y:31786|A-219-OUT,B-275-OUT;n:type:ShaderForge.SFN_Vector1,id:275,x:33330,y:31846,v1:3;proporder:219-3-25-53-210-211-14-98-132;pass:END;sub:END;*/

Shader "Cynicat/PBR" {
    Properties {
        _Brightness ("Brightness", Float ) = 1
        _BaseColor ("BaseColor", 2D) = "white" {}
        _Metallic ("Metallic", 2D) = "black" {}
        _Roughness ("Roughness", 2D) = "white" {}
        _RoughnessMin ("RoughnessMin", Float ) = 0
        _RoughnessMax ("RoughnessMax", Float ) = 1
        _Normal ("Normal", 2D) = "bump" {}
        _HeightMap ("HeightMap", 2D) = "white" {}
        _HeightRange ("HeightRange", Float ) = 1
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "ForwardBase"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #ifndef LIGHTMAP_OFF
                float4 unity_LightmapST;
                sampler2D unity_Lightmap;
                #ifndef DIRLIGHTMAP_OFF
                    sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform sampler2D _BaseColor; uniform float4 _BaseColor_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _Metallic; uniform float4 _Metallic_ST;
            uniform sampler2D _Roughness; uniform float4 _Roughness_ST;
            uniform sampler2D _HeightMap; uniform float4 _HeightMap_ST;
            uniform float _HeightRange;
            uniform float _RoughnessMin;
            uniform float _RoughnessMax;
            uniform float _Brightness;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                #ifndef LIGHTMAP_OFF
                    float2 uvLM : TEXCOORD7;
                #endif
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                #ifndef LIGHTMAP_OFF
                    o.uvLM = v.texcoord1 * unity_LightmapST.xy + unity_LightmapST.zw;
                #endif
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float2 node_349 = i.uv0;
                float2 node_91 = (0.05*((tex2D(_HeightMap,TRANSFORM_TEX(node_349.rg, _HeightMap)).r*_HeightRange) - 0.5)*mul(tangentTransform, viewDirection).xy + i.uv0.rg);
                float3 normalLocal = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_91.rg, _Normal))).rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                #ifndef LIGHTMAP_OFF
                    float4 lmtex = tex2D(unity_Lightmap,i.uvLM);
                    #ifndef DIRLIGHTMAP_OFF
                        float3 lightmap = DecodeLightmap(lmtex);
                        float3 scalePerBasisVector = DecodeLightmap(tex2D(unity_LightmapInd,i.uvLM));
                        UNITY_DIRBASIS
                        half3 normalInRnmBasis = saturate (mul (unity_DirBasis, normalLocal));
                        lightmap *= dot (normalInRnmBasis, scalePerBasisVector);
                    #else
                        float3 lightmap = DecodeLightmap(lmtex);
                    #endif
                #endif
                #ifndef LIGHTMAP_OFF
                    #ifdef DIRLIGHTMAP_OFF
                        float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                    #else
                        float3 lightDirection = normalize (scalePerBasisVector.x * unity_DirBasis[0] + scalePerBasisVector.y * unity_DirBasis[1] + scalePerBasisVector.z * unity_DirBasis[2]);
                        lightDirection = mul(lightDirection,tangentTransform); // Tangent to world
                    #endif
                #else
                    float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                #endif
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i)*2;
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                #ifndef LIGHTMAP_OFF
                    float3 diffuse = lightmap.rgb;
                #else
                    float3 diffuse = max( 0.0, NdotL)*InvPi * attenColor + UNITY_LIGHTMODEL_AMBIENT.rgb*2;
                #endif
///////// Gloss:
                float4 node_53 = tex2D(_Roughness,TRANSFORM_TEX(node_91.rg, _Roughness));
                float node_206 = 0.0;
                float gloss = (1.0 - (_RoughnessMin + ( (node_53.r - node_206) * (_RoughnessMax - _RoughnessMin) ) / (1.0 - node_206)));
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_40 = 0.04;
                float4 node_3 = tex2D(_BaseColor,TRANSFORM_TEX(node_91.rg, _BaseColor));
                float4 node_25 = tex2D(_Metallic,TRANSFORM_TEX(node_91.rg, _Metallic));
                float node_274 = (_Brightness*3.0);
                float3 specularColor = (lerp(float3(node_40,node_40,node_40),node_3.rgb,node_25.r)*node_274);
                float specularMonochrome = dot(specularColor,float3(0.3,0.59,0.11));
                float HdotL = max(0.0,dot(halfDirection,lightDirection));
                float3 fresnelTerm = specularColor + ( 1.0 - specularColor ) * pow((1.0 - HdotL),5);
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float alpha = 1.0 / ( sqrt( (Pi/4.0) * specPow + Pi/2.0 ) );
                float visTerm = ( NdotL * ( 1.0 - alpha ) + alpha ) * ( NdotV * ( 1.0 - alpha ) + alpha );
                visTerm = 1.0 / visTerm;
                float normTerm = (specPow + 8.0 ) / (8.0 * Pi);
                float3 specular = 1*NdotL * pow(max(0,dot(halfDirection,normalDirection)),specPow)*fresnelTerm*visTerm*normTerm;
                #ifndef LIGHTMAP_OFF
                    #ifndef DIRLIGHTMAP_OFF
                        specular *= lightmap;
                    #else
                        specular *= (floor(attenuation) * _LightColor0.xyz);
                    #endif
                #else
                    specular *= (floor(attenuation) * _LightColor0.xyz);
                #endif
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                diffuseLight *= 1-specularMonochrome;
                finalColor += diffuseLight * (node_274*lerp(node_3.rgb,float3(0,0,0),node_25.r));
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "ForwardAdd"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            Fog { Color (0,0,0,0) }
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma exclude_renderers xbox360 ps3 flash d3d11_9x 
            #pragma target 3.0
            #ifndef LIGHTMAP_OFF
                float4 unity_LightmapST;
                sampler2D unity_Lightmap;
                #ifndef DIRLIGHTMAP_OFF
                    sampler2D unity_LightmapInd;
                #endif
            #endif
            uniform sampler2D _BaseColor; uniform float4 _BaseColor_ST;
            uniform sampler2D _Normal; uniform float4 _Normal_ST;
            uniform sampler2D _Metallic; uniform float4 _Metallic_ST;
            uniform sampler2D _Roughness; uniform float4 _Roughness_ST;
            uniform sampler2D _HeightMap; uniform float4 _HeightMap_ST;
            uniform float _HeightRange;
            uniform float _RoughnessMin;
            uniform float _RoughnessMax;
            uniform float _Brightness;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
                float2 texcoord1 : TEXCOORD1;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 binormalDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o;
                o.uv0 = v.texcoord0;
                o.normalDir = mul(float4(v.normal,0), _World2Object).xyz;
                o.tangentDir = normalize( mul( _Object2World, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.binormalDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(_Object2World, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            fixed4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.binormalDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
/////// Normals:
                float2 node_350 = i.uv0;
                float2 node_91 = (0.05*((tex2D(_HeightMap,TRANSFORM_TEX(node_350.rg, _HeightMap)).r*_HeightRange) - 0.5)*mul(tangentTransform, viewDirection).xy + i.uv0.rg);
                float3 normalLocal = UnpackNormal(tex2D(_Normal,TRANSFORM_TEX(node_91.rg, _Normal))).rgb;
                float3 normalDirection =  normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i)*2;
                float3 attenColor = attenuation * _LightColor0.xyz;
                float Pi = 3.141592654;
                float InvPi = 0.31830988618;
/////// Diffuse:
                float NdotL = dot( normalDirection, lightDirection );
                float3 diffuse = max( 0.0, NdotL)*InvPi * attenColor;
///////// Gloss:
                float4 node_53 = tex2D(_Roughness,TRANSFORM_TEX(node_91.rg, _Roughness));
                float node_206 = 0.0;
                float gloss = (1.0 - (_RoughnessMin + ( (node_53.r - node_206) * (_RoughnessMax - _RoughnessMin) ) / (1.0 - node_206)));
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                NdotL = max(0.0, NdotL);
                float node_40 = 0.04;
                float4 node_3 = tex2D(_BaseColor,TRANSFORM_TEX(node_91.rg, _BaseColor));
                float4 node_25 = tex2D(_Metallic,TRANSFORM_TEX(node_91.rg, _Metallic));
                float node_274 = (_Brightness*3.0);
                float3 specularColor = (lerp(float3(node_40,node_40,node_40),node_3.rgb,node_25.r)*node_274);
                float specularMonochrome = dot(specularColor,float3(0.3,0.59,0.11));
                float HdotL = max(0.0,dot(halfDirection,lightDirection));
                float3 fresnelTerm = specularColor + ( 1.0 - specularColor ) * pow((1.0 - HdotL),5);
                float NdotV = max(0.0,dot( normalDirection, viewDirection ));
                float alpha = 1.0 / ( sqrt( (Pi/4.0) * specPow + Pi/2.0 ) );
                float visTerm = ( NdotL * ( 1.0 - alpha ) + alpha ) * ( NdotV * ( 1.0 - alpha ) + alpha );
                visTerm = 1.0 / visTerm;
                float normTerm = (specPow + 8.0 ) / (8.0 * Pi);
                float3 specular = attenColor*NdotL * pow(max(0,dot(halfDirection,normalDirection)),specPow)*fresnelTerm*visTerm*normTerm;
                float3 finalColor = 0;
                float3 diffuseLight = diffuse;
                diffuseLight *= 1-specularMonochrome;
                finalColor += diffuseLight * (node_274*lerp(node_3.rgb,float3(0,0,0),node_25.r));
                finalColor += specular;
/// Final Color:
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
