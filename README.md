# Retropie console overlays pack

Overlays (or bezels) are images added "above" the emulator, to mask the black borders around the image.

This pack adds overlays for most systems emulated by Retropie.  
While you're here, it also configures appropriate shaders to make your games extra good-looking.

**Requirements:**

- Retropie 4.3 - not tested on another version.
- A 16:9 screen doing at least 720p. This pack is useless on a 4:3 screen, since you don't have black borders.
- The configuration is optimized to work on a Raspbery Pi 3. It will work on more powerful hardware, but maybe not on less.

# Installation

- Open the `configs` shared folder on you retropie installation (`\\retropie\configs\` on Windows, `smb://retropie/configs` on Mac)
- **Recommended:** backup the folder content
- Copy the content of the `overlays_shaders` folder from the pack into the share, and overwrite the files.

# Content

Each system has an appropriate overlay and shader configured.

Emulators are configured so that your screen will switch to 720p, because it's much so faster. The overlays don't look as sharp as in 1080p obviously, but I don't find it distracting while playing.  
See below if you want to stay in 1080p, but be warned that a pi3 is not powerful enough to be both fast and good-looking at 1080p. Yes, even with a measly old Gameboy.

In 1080p, 8 bit and 16 bit consoles use the crt-pi shader. While not as good looking as crt-pi-curvature, it's much faster, and crt-pi-curvature feels sluggish in comparison.  
In 720p configuration, they use crt-pi-curvature, which is fine at this resolution.

PSX and N64 use the ghogan-crt shader because, while not as good looking as crt-pi, it's a bit faster.  
For instance, Moto Racer on PSX is as fast as no shader with ghogan-crt, drops a few frames here and there with crt-pi, and drops to an unplayable 15 to 30fps with crt-pi-curvature.

Handheld consoles use the ghogan-lcd shader, which is amazingly gorgeous and always very fast.

If you use Retropie on a powerful machine (so, not a pi), feel free to search-and-replace "ghogan-crt" with "crt-pi-curvature" in every cfg file.

# Customization

## Using a 1080p resolution in the emulators

By default the emulators will display at a 720p resolution (the actual emulator is smaller but the whole screen is 720p).

If you want better looks, you can configure the emulators to run in 1080p:

- Open the `all/retroarch/overlay_cfg/resolution_xxx.cfg` file
- Change the include of "1080p.cfg" to "720p.cfg"

## Changing the shader

If you want to use another shader than the ones configured (or disable it), edit the `all/retroarch/overlay_cfg/xxx_1080p.cfg` and `xxx_720p.cfg` files, where "xxx" is the screen type (crt, arcade) or system name (gamegear, gb...).

# Credits

- MarbleMad (Team ScreenZone)
- Kam3leon (Team ScreenZone)
- [Orions angel](https://www.youtube.com/channel/UCG1g7PE9yzd4MboQQa9OYWA)
- [Source of the pack](https://www.screenscraper.fr/forumsujet.php?frub=43&fsuj=182)
- [Shaders from ghogan42](https://retropie.org.uk/forum/topic/13356/)

I have just moved files around to adapt the pack for Retropie, and edited a bunch of config files.

Usage of the pack in a commercial product is strictly forbidden.
