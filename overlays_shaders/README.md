# Full screen overlays with shaders

## Content

Each system has an appropriate overlay and shader configured to look the most like what the original systems did, while maintaining proper speed on a raspberry pi 3.

For the home consoles, the selected shader gives a "curved" appearance to the emulator, like you had with an old-school, not-flat TV.  
Simulating that takes a few resources, but I think it looks better, and probably more faithful.

Prefer using a Pi 4 for better performances, a Pi 3 might be slow. Disable the shader if it's too slow for you: in `all/retroarch/overlay_cfg/common_crt.cfg`, set `video_shader_enable` to `false`.

## Credits

Most overlays have been created by [Marblemad & Kam3leon](https://screenscraper.fr/forumsujet.php?frub=43&fsuj=182) and [OrionsAngel](https://www.youtube.com/channel/UCG1g7PE9yzd4MboQQa9OYWA).

The shaders have been created by [ghogan42](https://retropie.org.uk/forum/topic/13356/).

## Shaders

The home consoles (8 and 16 bit) use the `zfast_crt_curve` shader. It's nice-looking enough, and the fastest around.  
The more advanced consoles (PSX and N64) use the `zfast_crt_720_PI3` shader, in order to be faster.

Handheld consoles use the `zfast_lcd_standard` shader, which is amazingly gorgeous and always very fast.

If you use Retropie on a more powerful machine (PC or Odroid), feel free to edit all cfg files to change the shader to something better. There are a lot of nice-looking shaders out there; have a look at crt-royale, for instance, which requires a powerful GPU to run.

## Using a 1080p resolution

By default the home console emulators will display at a 720p resolution (the actual emulator is smaller but the whole screen is 720p).

If you have a better performing hardware than a raspberry pi3, you can configure the emulators to run in 1080p:

- Open the folder `all/retroarch/overlay_cfg/`
- Edit `common_crt.cfg` and change the `video_fullscreen_x` and `video_fullscreen_y` to match 1080p (1920x1080). Comment the `custom_viewport_xxx` parameters for 720p and un-comment the 1080p ones.
- Edit `psx.cfg` and `n64.cfg` and remove the 720p shader.