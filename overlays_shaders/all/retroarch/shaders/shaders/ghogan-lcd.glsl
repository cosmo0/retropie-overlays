//Comment out GBAGAMMA to skip gamma adjustment for the Gameboy Advance
#define GBAGAMMA
//Larger negative values give you a darker border. Range is 0.0 to 49.0
#define BORDER_DARK 14.0 

/* COMPATIBILITY
   - GLSL compilers
*/

/*
    Z_PI_LCD - A very simple LCD shader.

    Copyright (C) 2017 Greg Hogan (SoltanGris42)

    This program is free software; you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by the Free
    Software Foundation; either version 2 of the License, or (at your option)
    any later version.


Notes:  This shader just does nearest neighbor scaling of the game and then
		adds lines representing the LCD pixel edges with an algorithm borrowed
		from my CRT scanline shader: Z_PI_CRT
		
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
	vec2 distFromCenter = abs(centerCoord - texcoordInPixels);

	float Y = max(distFromCenter.x,(distFromCenter.y));

	Y=Y*Y;
	float YY = Y*Y;
	float YYY = YY*Y;

	float LineWeight = YY - 2.7*YYY;
	LineWeight = 1.0 - BORDER_DARK*LineWeight;

	vec3 colour = texture2D(Texture, invSize*centerCoord).rgb*LineWeight;

#if defined(GBAGAMMA)
	//colour.rgb = pow(colour.rgb, vec3(1.35));
	colour.rgb*=0.6+0.4*(colour.rgb); //fake gamma because the pi is too slow!
#endif

	gl_FragColor = vec4(colour.rgb , 1.0);

}
#endif
