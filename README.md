# Retropie console overlays pack

Overlays (or bezels) are images added "above" the emulator, to mask the black borders around the image.

This pack adds overlays for most systems emulated by Retropie.

**Requirements:**

- Retropie 4.3 - not tested on another version.
- A 16:9 screen. This pack is useless on a 4:3 screen, since you don't have black borders.

# Installation

- Open the `configs` shared folder on you retropie installation (`\\retropie\configs\` on Windows, `smb://retropie/configs` on Mac)
- **Recommended:** backup the folder content
- Copy the content of the `configs` folder from the pack into the share, and overwrite the files.

# Content

Each system has an appropriate overlay.

Portable consoles use the ghogan-lcd shader.

In 1080p, 8 bit and 16 bit consoles use the crt-pi shader. While not as good looking as crt-pi-curvature, it's much faster.  
In 720p configuration (see below), they use crt-pi-curvature.

PSX and N64 use the ghogan-crt shader because, while not as good looking as crt-pi, it's a bit faster. PSX is unplayable with crt-pi-curvature, and more sluggish with crt-pi than with ghogan-crt.

If you use Retropie on a powerful machine (not a pi), feel free to search-and-replace "ghogan-crt" with "crt-pi-curvature" in every cfg file.

# Customization

## Using a 720p resolution in the emulators

By default the overlays will display at a 1080p resolution.

If you want better performance, use a 720p display during emulation:

- Open the `configs/all/retroarch/resolution_xxx.cfg` where "xxx" is the system (crt for all "regular" CRT screens)
- Change the include of "1080p.cfg" to "720p.cfg"

## Changing the shader

If you want to use another shader than the ones configured (or disable it), edit the `configs/all/retroarch/overlay_cfg/xxx_1080p.cfg` and `xxx_720p.cfg` files, where "xxx" is the screen type (crt, arcade) or system name (gamegear, gb...).

# Credits

- MarbleMad (Team ScreenZone)
- Kam3leon (Team ScreenZone)
- [Orions angel](https://www.youtube.com/channel/UCG1g7PE9yzd4MboQQa9OYWA)
- [Source of the pack](https://www.screenscraper.fr/forumsujet.php?frub=43&fsuj=182)
- [Shaders from ghogan42](https://retropie.org.uk/forum/topic/13356/)

I have just moved files around to adapt the pack for Retropie, and edited a bunch of config files.

Usage of the pack in a commercial product is strictly forbidden.
