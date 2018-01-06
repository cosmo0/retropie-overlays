//Set Options here.  Comment out GBAGAMMA to skip gamma adjustment
#define GBAGAMMA
#define BORDERTHICK 0.15
#define BORDERDARK 0.65

/* COMPATIBILITY
   - GLSL compilers
*/

/*
    Z_PI_LCD_INT - A very simple LCD shader (Integer Scaling Only version).

    Copyright (C) 2017 Greg Hogan (SoltanGris42)

    This program is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the Free
    Software Foundation; either version 2 of the License, or (at your option)
    any later version.


Notes:  This shader just does nearest neighbor scaling of the game and then
		darkens the border pixels to imitate an LCD screen. You can change the
		amount of darkening and the thickness of the borders.  You can also 
		do basic gamma adjustment.  You MUST use this version with integer
		scaling set in Retroarch.	
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

	
	vec2 texcoordInPixels = TEX0 * TextureSize;
	
	vec2 centerCoord = floor(texcoordInPixels.xy)+vec2(0.5,0.5);
	texcoordInPixels.xy = fract(texcoordInPixels.xy);
	float edgeDist = min(min(texcoordInPixels.x, 1.0-texcoordInPixels.x), min(texcoordInPixels.y, 1.0-texcoordInPixels.y));


 	vec2 tc = vec2( invSize.x*centerCoord.x , invSize.y*centerCoord.y);
	vec3 colour = texture2D(Texture, tc).rgb;

	
#if defined(GBAGAMMA)
	//colour.rgb = pow(colour.rgb, vec3(1.35));
	colour.rgb*=0.6+0.4*(colour.rgb); //fake gamma because the pi is too slow!
#endif

	if(edgeDist<=BORDERTHICK)
		colour.rgb*=BORDERDARK;

	gl_FragColor = vec4(colour.rgb , 1.0);
	
}
#endif
