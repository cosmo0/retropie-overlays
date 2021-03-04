# Retropie full screen overlays with shaders

## Installation

- Download [the latest release](https://github.com/cosmo0/retropie-overlays/releases)
- Open the `configs` shared folder on you retropie installation (`\\retropie\configs\` on Windows, `smb://retropie/configs` on Mac)
- **Recommended:** backup the folder content!
- Copy the content of the chosen overlays folder into the share, and overwrite the files.

## Content

Each system has an appropriate overlay and shader configured to look the most like what the original systems did, while maintaining proper speed on a raspberry pi 3.

For the home consoles, the selected shader gives a "curved" appearance to the emulator, like you had with an old-school, not-flat TV.  
Simulating that takes a few resources, but I think it looks better, and probably more faithful.

Prefer using a Pi 4 for better performances, a Pi 3 might be a bit slow, a Pi 2 will absolutely be too slow.  
Disable the shader if it's too slow for you: in `all/retroarch/overlay_cfg/common_crt.cfg`, set `video_shader_enable` to `false`.

## Credits

Most overlays have been created by [Marblemad & Kam3leon](https://screenscraper.fr/forumsujet.php?frub=43&fsuj=182), [OrionsAngel](https://www.youtube.com/channel/UCG1g7PE9yzd4MboQQa9OYWA) and [Duimon](https://github.com/Duimon/HSM-Reflection-Shader-Graphics).

The shaders have been created by [ghogan42](https://retropie.org.uk/forum/topic/13356/).

## Shaders

The home consoles (8 and 16 bit) use the `zfast_crt_curve` shader. It's nice-looking enough, and the fastest around.  
The more advanced consoles (PSX and N64) use the `zfast_crt_standard` shader, in order to be faster.

Handheld consoles use the `zfast_lcd_standard` shader, which is amazingly gorgeous and very fast.

If you use Retropie on a more powerful machine (PC or Odroid), feel free to edit all cfg files to change the shader to something better. There are a lot of nice-looking shaders out there; have a look at crt-royale, for instance, which requires a powerful GPU to run. The latest trend is using HSM Reflection Shader, which reflects the game on the bezels, or ReShade, a very powerful shaders tool.
