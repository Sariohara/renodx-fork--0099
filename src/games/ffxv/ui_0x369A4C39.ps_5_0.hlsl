// ---- Created with 3Dmigoto v1.3.16 on Fri May 30 00:38:52 2025
#include "shared.h"
cbuffer MenuHDRParam : register(b0)
{
  float HDRSaturation : packoffset(c0);
  float HDRLuminance : packoffset(c0.y);
}

SamplerState g_samp0_s : register(s0);
Texture2D<float4> g_samp0Texture : register(t0);


// 3Dmigoto declarations
#define cmp -


void main(
  float4 v0 : SV_POSITION0,
  float4 v1 : COLOR0,
  float2 v2 : TEXCOORD0,
  out float4 o0 : SV_TARGET0)
{
  float4 r0,r1,r2;
  uint4 bitmask, uiDest;
  float4 fDest;

  r0.x = g_samp0Texture.Sample(g_samp0_s, v2.xy).x;
  o0.w = v1.w * r0.x;
  o0.xyz = v1.xyz;

  o0.xyz = renodx::color::srgb::DecodeSafe(o0.xyz);
  return;
}