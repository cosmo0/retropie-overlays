Hi Guys,

I noticed a post in the Help/Support forum asking about an LCD shader and that reminded me that I never posted any of my shaders.  So I'm posting three shaders here.

They are in my Google Drive here: https://drive.google.com/drive/folders/0B5_cUiAJwMMvT1RJRjdHell3ckU?usp=sharing

Z_PI_CRT: A CRT shader that I wrote that could handle 1920x1080 fullscreen (not just 1440x1080).
Z_PI_LCD: A modification of my CRT filter that just draws boxes around nearest neighbor scaled pixels.  This works with non-integer scaling.
Z_PI_LCD_INT: A simpler, (much) faster LCD shader that ONLY works correctly if you set retroarch to Integer Scaling in the video options.

They all should be able to chug along at a solid 60fps at any resolution up to a full 1920x1080 or 1600x1200 if your PI3 isn't throttling.  The reason the CRT shader exists is mostly because crt-pi can only do 53-55fps for 1600x1200 or 1920x1080 type of resolutions.

Here are screenshots of the default options on Z_PI_CRT and Z_PI_LCD:

Castelevania - Aria of Sorrow: https://drive.google.com/file/d/0B5_cUiAJwMMvaTBXTjRwM05NSlE/view?usp=sharing
Streets of Rage 3 - https://drive.google.com/file/d/0B5_cUiAJwMMvbUdMeXFoTWFtck0/view?usp=sharing

Both LCD shaders have an option to adjust the border darkness and whether to apply Gameboy Advance fake gamma correction.  This is enabled by default.

The CRT shader has many more options.  You might want to open Z_PI_CRT.glsl to change some of them.  Here are some of the options that you can edit near the top of the file:

----------------------------------

#define BLURSCALEX -0.6 
#define BLURSCALEY -0.3

A value of "-1.0" makes the shader use bilinear filtering (blurry)on that axis.  A value of "-0.0" makes the shader use pure nearest neighbor scaling (perfectly sharp).  Choosing something between lets you choose how blurry the scaling is.

----------------------------------

#define LOWLUMSCAN -6.0 //default is -6.0, larger negatives darken scanlines
#define HILUMSCAN -14.0 //default is -14.0, larger negatives darken scanlines
#define BRIGHTBOOST 1.2 // Low brightness pixels get boosted

These are constants adjusting the scanline profiles.  I'll be referring to th edark part of the scanline as the "scanline".  The shader uses a a thicker, darker scanline for the lower brighness pixel, and a thinner, lighter scanline for brighter pixels.  Also, there is a "brightness boost" for the lower scanline profile that helps counteract the fact that thicker scanlines darken the picture more than the thinner lines.

----------------------------------

#define FAKEGAMMA

Most emulators don't offer gamma correction.  So when you display the image meant for a gamma 2.4 display on a TV/Monitor that's around 2.2 the picture is too bright.  If FAKEGAMMA is NOT commented out then an approximation of the need gamma adjustment is applied to the image.  Please comment this line out if you think the image is too dark.

----------------------------------

//Mask options.
#define MASK_DARK -0.3 
//#define FINE_MASK 
#define MASK_FADE 0.28 

By default, every third pixel is darkened to imitate an aperture grill.  This is done as a monochrome effect because your get bad results with color aperture effects with chroma subsampling on most TVs.  MASK_DARK lets you choose how dark the mask effect is.  MASK_FADE adjusts how the mask fades out AND HOW THE THINNER SCANLINES FADE IN.  If the mask looks too course for you, you can uncomment FINE_MASK and the shader will use a 2 pixel effect instead of 3 pixels.  Expect to have to change MASK_DARK if you use FINE_MASK.

----------------------------------

-SoltanGris42