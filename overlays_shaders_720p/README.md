# Full screen overlays with shaders

## Content

Each system has an appropriate overlay and shader configured.

Emulators are configured so that your screen will switch to 720p, because it's much so faster. The overlays don't look as sharp as in 1080p obviously, but I don't find it distracting while playing.  
See below if you want to stay in 1080p, but be warned that a pi3 is not powerful enough to be both fast and good-looking at 1080p. Yes, even with a measly old Gameboy.

## Shaders

In 720p (the default), the 8 and 16 bit consoles use the `zfast_crt_720p_PI3` shader. It's nice-looking enough, and the fastest around.

Handheld consoles use the `zfast_lcd_720p` shader, which is amazingly gorgeous and always very fast.

If you use Retropie on a powerful machine (so, not a pi), feel free to edit all cfg files to change the shader to something better; there are a lot of nice-looking shaders out there. Search for crt-royale, for instance.

## Customization

### Using a 1080p resolution in the emulators

By default the emulators will display at a 720p resolution (the actual emulator is smaller but the whole screen is 720p).

If you want better looks, you can configure the emulators to run in 1080p:

- Open the `all/retroarch/overlay_cfg/resolution_xxx.cfg` file
- Change the include of "1080p.cfg" to "720p.cfg"

### Changing the shader

If you want to use another shader than the ones configured (or disable it), edit the `all/retroarch/overlay_cfg/xxx_1080p.cfg` and `xxx_720p.cfg` files, where "xxx" is the screen type (crt, arcade) or system name (gamegear, gb...).
