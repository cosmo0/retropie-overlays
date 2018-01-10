SOURCE: https://retropie.org.uk/forum/topic/13356/

----------------

Hello All,

I spent quite a while getting versions of these shaders up and running on the SNES Classic. The gpu it has is a big downgrade from the Raspberry Pi 3. Then I got busy at work and haven't had time to come back to this.

Here's how things stand now with the current version as of Jan 07, 2018 . The newest files are at the bottom of this post.

I changed the names of the shaders to zfast_crt_standard, zfast_lcd_standard, zfast_crt_720p_SNES, zfast_crt_720p_PI3, zfast_lcd_720p. Hopefully they won't get confused with the crt-pi shaders.

There were bugs in the horizontal scaling I used. It's now completely different. I've made a sharper version of the algorithm here: http://www.iquilezles.org/www/articles/texture/texture.htm that works well for scaling pixel graphics with a good tradeoff between blur/shimmer

Most shaders now have RetroArch shader paramters that you can adjust. So if you don't like the defaults you no longer have to edit the files. Just go into the retroarch "Preview Shader Parameters" and edit them. Then you can save a preset with the options you like.

Here's what the current versions look like. You won't see much difference, but under the hood things have changed.

zfast_crt_standard: https://drive.google.com/file/d/12-auksKKlw0-78caUUYh2nX4rMgLArvf/view?usp=sharing

zfast_lcd_standard: https://drive.google.com/file/d/1pc3nZUeuQTGVvC2rPVFIWPnjlryqqSit/view?usp=sharing

Here's some tips for setting the shaders up:

You can drop all of the files in the zip file into any folder on your PI3. The GLSLP files and GLSL files go in the same folder. That's not how retropie usually does things, but it's how I did it.
So either:
\RETROPIE\configs\all\retroarch\shaders

or:
\RETROPIE\configs\all\retroarch\shaders\shaders

should be fine for the location.

You can load the shaders in retroarch with either "Load Shader Preset" and selecting the ".glslp" file OR by loading the shaders ".glsl" file
directly. If you select the shader file directly then you should set the "Filter" to "Linear" and the "Scale" to "Don't Care".

Three of the shaders should give correct output at 1080p or 720p: zfast_crt_standard, zfast_lcd_standard, zfast_lcd_720p. The 720p version of the lcd shader just has one pixel borders which the 1080p version can't replicate (it can only darken two pixels at a minimum). So you can use these at any resolution where they look good.

There are two version of the 720p crt shader: zfast_crt_720p_SNES and zfast_crt_720p_PI3. The difference between them is that the SNES version is faster but requires you to manually ensure that you're getting 3x Integer Scaling on the vertical axis. That's what you SHOULD get at 720p from all of the old consoles with Intger Scaling set. However it turns out that many/most cores seem to lie about the resolution they produce! So you get non-integer scaling even when you turn on "Integer Scaling" in the Video Options!! So I made the zfast_crt_720p_PI3 version that tries to ensure integer scaling on it's own. It doesn't always center the image correcly though. I'm not sure why... The punchline is that if you're stuck running 720P and you see some artifacts in zfast_crt_standard then you probably want to try zfast_crt_720p_PI3 and not zfast_crt_720p_SNES.

There is a "bonus" shader called sharp_quilez_gamma in the zip file. This is a modified "quilez" shader that is sharper than the default (but blurrier than nearest neighbor). It also does an approximate 2.45 to 2.2 gamma adjustment. It might be useful to people that want sharp-ish scaling without shimmering when things move.

Answers to some questions that have come up:

Q: Can you add curvature?
A: Nope. I wrote these to be full speed at a full 1920x1080 or 1600x1200 on a rpi3 and fullspeed on an SNES Classic at 720p. They won't be if I added curvature.

Q: Will these make my pi overheat?
A: They shouldn't! My pi3 is an an case with a retrotink on top blocking air flow and I don't have problems. Make sure you have a heatsink on there though. And if your pi is only stable at 720p, well then, go ahead and use that.

Newest Versions of the shaders as of January 07 2018:
https://drive.google.com/file/d/1f4B1lzTRnjuYySh1iZazT_KlWY1Bj2Oc/view?usp=sharing