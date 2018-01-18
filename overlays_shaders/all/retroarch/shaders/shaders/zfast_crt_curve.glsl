/*
    zfast_crt_curve - A simple, fast CRT shader.

    Copyright (C) 2017 Greg Hogan (SoltanGris42)

    This program is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the Free
    Software Foundation; either version 2 of the License, or (at your option)
    any later version.


Notes:  This shader does sharp scaling on the x and y axes based on the
	algorithm by Inigo Quilez here: 
	http://http://www.iquilezles.org/www/articles/texture/texture.htm
	but modified to be somewhat sharper.  Then a scanline effect is applied
	along with a monochrome aperture mask.  This shader is a simplified version
	of my zfast_crt_standard shader that has an adjustable curvature effect
	added.  It is slower that the standard version of the filter, but still
	generally runs as 60fps on the Raspberry Pi 3 hardware at a resolution
	of 1440x1080px.
*/

//For testing compilation 
//#define FRAGMENT
//#define VERTEX

//This can't be an option without slowing the shader down
//Comment this out for a coarser 3 pixel mask...which is currently broken
//on SNES Classic Edition due to Mali 400 gpu precision
#define FINEMASK
//Some drivers don't return black with texture coordinates out of bounds
//SNES Classic is too slow to black these areas out when using fullscreen
//overlays.  But you can uncomment the below to black them out if necessary
#define BLACK_OUT_BORDER

// Compatibility #ifdefs needed for parameters
#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif

// Parameter lines go here:
#pragma parameter CURVE "Curvature" 0.025 0.0 0.05 0.002
#pragma parameter CORNER "Corner" 0.6 0.0 5.0 0.2
#pragma parameter LOWLUMSCAN "Scanline Darkness" 3.0 0.0 10.0 0.5
#pragma parameter BRIGHTBOOST "Brightness Boost" 1.0 0.5 1.5 0.05
#pragma parameter MASK_DARK "Mask Effect Amount" 0.1 0.0 1.0 0.05

#ifdef PARAMETER_UNIFORM
// All parameter floats need to have COMPAT_PRECISION in front of them
uniform COMPAT_PRECISION float LOWLUMSCAN;
uniform COMPAT_PRECISION float BRIGHTBOOST;
uniform COMPAT_PRECISION float MASK_DARK;
uniform COMPAT_PRECISION float CURVE;
uniform COMPAT_PRECISION float CORNER;

#else
#define LOWLUMSCAN 2.5
#define BRIGHTBOOST 1.1
#define MASK_DARK 0.25
#define CURVE 0.025
#define CORNER 1.6
#endif

#if defined(VERTEX)

#if __VERSION__ >= 130
#define COMPAT_VARYING out
#define COMPAT_ATTRIBUTE in
#define COMPAT_TEXTURE texture
#else
#define COMPAT_VARYING varying 
#define COMPAT_ATTRIBUTE attribute 
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif

COMPAT_ATTRIBUTE vec4 VertexCoord;
COMPAT_ATTRIBUTE vec4 COLOR;
COMPAT_ATTRIBUTE vec4 TexCoord;
COMPAT_VARYING vec4 COL0;
COMPAT_VARYING vec4 TEX0;
// out variables go here as COMPAT_VARYING whatever
COMPAT_VARYING float maskFade;
COMPAT_VARYING float cornerConst;
COMPAT_VARYING vec2 invDims;
COMPAT_VARYING vec2 screenScale;
COMPAT_VARYING vec2 iscreenScale;

vec4 _oPosition1; 
uniform mat4 MVPMatrix;
uniform COMPAT_PRECISION int FrameDirection;
uniform COMPAT_PRECISION int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;

// compatibility #defines
#define vTexCoord TEX0.xy
#define SourceSize vec4(TextureSize, 1.0 / TextureSize) //either TextureSize or InputSize
#define OutSize vec4(OutputSize, 1.0 / OutputSize)


void main()
{
    gl_Position = MVPMatrix * VertexCoord;
	
	TEX0.xy = (TexCoord.xy);
	cornerConst = CORNER*0.0001;
	invDims = 1.0/TextureSize.xy;
	screenScale = TextureSize.xy/InputSize.xy;
	iscreenScale = 1.0/screenScale;
}

#elif defined(FRAGMENT)

#if __VERSION__ >= 130
#define COMPAT_VARYING in
#define COMPAT_TEXTURE texture
out vec4 FragColor;
#else
#define COMPAT_VARYING varying
#define FragColor gl_FragColor
#define COMPAT_TEXTURE texture2D
#endif

#ifdef GL_ES
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif

uniform COMPAT_PRECISION int FrameDirection;
uniform COMPAT_PRECISION int FrameCount;
uniform COMPAT_PRECISION vec2 OutputSize;
uniform COMPAT_PRECISION vec2 TextureSize;
uniform COMPAT_PRECISION vec2 InputSize;
uniform sampler2D Texture;
uniform sampler2D iqLUT;
uniform sampler2D scanLUT;


COMPAT_VARYING vec4 TEX0;
// in variables go here as COMPAT_VARYING whatever
COMPAT_VARYING float maskFade;
COMPAT_VARYING float cornerConst;
COMPAT_VARYING vec2 invDims;
COMPAT_VARYING vec2 screenScale;
COMPAT_VARYING vec2 iscreenScale;


// compatibility #defines
#define Source Texture
#define vTexCoord TEX0.xy
#define texture(c, d) COMPAT_TEXTURE(c, d)
#define SourceSize vec4(TextureSize, 1.0 / TextureSize) //either TextureSize or InputSize
#define OutSize vec4(OutputSize, 1.0 / OutputSize)

vec2 warp(vec2 pos){
  pos = -1.0 + 2.0*pos;   
  vec2 p = pos*pos; 
  pos*=vec2(1.0+1.33*CURVE*p.y ,1.0+CURVE*p.x);
  //return clamp(pos*0.5+0.5 , 0.0 , 1.0);
  return clamp(pos*0.5+0.5,0.0,1.0);
}

void main()
{
	//vec2 tc =TEX0.xy*screenScale;
	vec2 tc = warp(TEX0.xy*screenScale);
	
	vec2 corn = min(tc,vec2(1.0)-tc); //This is used to mask the rounded
	corn.x = cornerConst/corn.x;      //corners later on
	
	tc*=iscreenScale;
	COMPAT_PRECISION vec2 p = tc * TextureSize;
	COMPAT_PRECISION vec2 f = fract(p);

//We get the adjusted texture coordinates from a texture instead of math
//for speed now.  It's still basically Quilez's "Improved Texture Filtering"
	p = (floor(p) + texture(iqLUT,f).rg )*invDims; 

//This is how will black out the rounded corners	
	vec3 colour = vec3(0.0);
	if (corn.y >= corn.x)  
		colour = texture(Source, p).rgb; //fix tc to p

//compute the aperture mask
#if defined(FINEMASK) 
	COMPAT_PRECISION float whichmask = fract( gl_FragCoord.x*0.5);
	COMPAT_PRECISION float  mask = BRIGHTBOOST + float(whichmask < 0.5) * -MASK_DARK;
#else
	COMPAT_PRECISION float whichmask = fract(gl_FragCoord.x * -0.3333);
	COMPAT_PRECISION float  mask = BRIGHTBOOST + float(whichmask <= 0.33333) * -MASK_DARK;
#endif

//Compute the scanlines.  It was actually slower to use a texture LUT for
//the scanline profile so we're still using math

	f -= 0.5;
	COMPAT_PRECISION float Y = f.y*f.y;
	COMPAT_PRECISION float YY = Y*Y;
	FragColor.rgb = colour.rgb*(mask - LOWLUMSCAN*(Y - 2.05*YY));
	
} 
#endif
