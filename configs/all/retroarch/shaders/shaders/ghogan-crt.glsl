#pragma parameter INPUT_GAMMA "Input gamma" 2.45 0.0 5.0 0.01
#pragma parameter OUTPUT_GAMMA "Output gamma" 2.22 0.0 5.0 0.01



//You can edit these to adjust the sharpness
// "0" is nearest neighbor scaling (sharp)
// "-1.0" is bilinear filtering (blurry)
#define BLURSCALEX -0.6 //default is -0.6 , -0.4 is pretty sharp
#define BLURSCALEY -0.3 //default is -0.3 , Doesn't really change much...

//Scanline options.  Controls darkness of the scanlines for Bright/Dark pixels
#define LOWLUMSCAN -6.0 //default is -6.0, larger negatives darken scanlines
#define HILUMSCAN -14.0 //default is -14.0, larger negatives darken scanlines
#define BRIGHTBOOST 1.2 // Low brightness pixels get boosted

#define FAKEGAMMA  //Does a fake gamma correction for modern TV vs CRT

//Mask options.
#define MASK_DARK -0.3 //This adjusts how much aperture grille to apply
//#define FINE_MASK //comment to disable a 2 pixel mask (3 pixel is standard)
#define MASK_FADE 0.28 //The mask fades out at high brightness. Range is 0-0.33

#ifdef PARAMETER_UNIFORM
uniform float INPUT_GAMMA;
uniform float OUTPUT_GAMMA;

#else
#define INPUT_GAMMA 2.45
#define OUTPUT_GAMMA 2.22

#endif

/* COMPATIBILITY
   - GLSL compilers
*/

/*
    Z_PI_CRT - A simple CRT shader that can run 60fps on a raspberry pi 3
	at a fullscreen 1600x1200 or 1920x1080.

    Copyright (C) 2017 Greg Hogan (SoltanGris42)

    This program is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the Free
    Software Foundation; either version 2 of the License, or (at your option)
    any later version.


*/

#ifdef GL_ES
#define COMPAT_PRECISION mediump
#else
#define COMPAT_PRECISION
#endif


uniform vec2 TextureSize;
varying COMPAT_PRECISION vec2 invSize;
varying COMPAT_PRECISION vec2 TEX0;

#if defined(VERTEX)
uniform mat4 MVPMatrix;
attribute vec4 VertexCoord;
attribute vec2 TexCoord;
uniform vec2 InputSize;
uniform vec2 OutputSize;
//varying COMPAT_PRECISION vec2 invSize;

void main()
{
	TEX0 = TexCoord;
	gl_Position = MVPMatrix * VertexCoord;
	invSize = 1.0/TextureSize;
}

#elif defined(FRAGMENT)
uniform sampler2D Texture;

void main()
{
#if defined(FINE_MASK)
	COMPAT_PRECISION float whichMask = fract(gl_FragCoord.x * 0.5);
	float mask = 1.0 + float(whichMask < 0.5) * MASK_DARK;
#else
	COMPAT_PRECISION float whichMask = fract(gl_FragCoord.x * 0.33333);
	float mask = 1.0 + float(whichMask < 0.33333) * MASK_DARK;
#endif

	//We find the center of the pixel so we can choose 
	//how much nearest neighbor vs bilinear we want
	vec2 texcoordInPixels = TEX0 * TextureSize;
	vec2 centerCoord = floor(texcoordInPixels.xy)+vec2(0.5,0.5);
	vec2 distFromCenter = centerCoord - texcoordInPixels;

	//Compute the scanline profiles to lerp between
	float Y = distFromCenter.y * distFromCenter.y;
	float YY = Y*Y;
	float scanLineWeight = BRIGHTBOOST + LOWLUMSCAN*(Y - 2.05*YY);
	float scanLineWeightB = 1.0 + HILUMSCAN*(YY-2.8*YY*Y);

	
	//Sample our texture at coordinates we adjust for our chosen sharpness
 	vec2 tc = vec2( invSize.x*(centerCoord.x + BLURSCALEX*distFromCenter.x) , invSize.y*(centerCoord.y + BLURSCALEY*distFromCenter.y));
	vec3 colour = texture2D(Texture, tc).rgb;
	
	//Theoretically we should apply a gamma of 2.4/2.2 because we're not on a CRT
	//but we don't because it makes the picture too dark.
	//Also, we're not attemping real gamma correct processing at all...

#if defined(FAKEGAMMA)
	colour.rgb*=0.8+0.2*(colour.rgb); //fake gamma because the pi is too slow!
#endif

	//Apply the scanlines and aperture grill effects
	colour.rgb *= mix(scanLineWeight*mask, scanLineWeightB, dot(colour.rgb,vec3(MASK_FADE)));
	
	gl_FragColor = vec4(colour.rgb , 1.0);

}
#endif
