# Full screen overlays with shaders

## Content

Each system has an appropriate overlay and shader configured.

Most systems should be emulated in 1080p without too much trouble. It depends on the games: the Raspberry Pi 3 shares the memory bandwitdh between CPU and GPU, and a complex game with heavy CPU load can make the emulator slow in 1080p but not in 720p.

## Shaders

The 8 and 16 bit consoles use the `zfast_crt_standard` shader. It's nice-looking enough, and the fastest around.

Handheld consoles use the `zfast_lcd_standard` shader, which is amazingly gorgeous and always very fast.

If you use Retropie on a powerful machine (so, not a pi), feel free to edit all cfg files to change the shader to something better. There are a lot of nice-looking shaders out there; have a look at crt-royale, for instance.

## Using a 720p resolution

By default the emulators will display at a 1080p resolution (the actual emulator is smaller but the whole screen is 1080p).

If you want better performance, you can configure the emulators to run in 720p:

- Open the folder `all/retroarch/overlay_cfg/`
- Edit `common.cfg` and change the `video_fullscreen_x` and `video_fullscreen_y` to match 720p (1280x720).
- Edit `common_crt.cfg`, comment the `custom_viewport_xxx` parameters and un-comment the 720p ones. Change the shader from `zfast_crt_standard` to `zfast_crt_720p_PI3`.
- Do the same for `common_arcade.cfg`.
- Do the same for all config files for handheld (atarilynx, gamegear, gb, etc) and do the same.
- Edit `common_lcd.cfg` and change the shader from `zfast_lcd_standard` to `zfast_lcd_720p`.
