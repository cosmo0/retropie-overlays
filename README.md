# Pre-requisites

Needs Retropie 4.3 - not tested on another version.  
It's based on a Recalbox overlays set and ghogan42's shaders - see credits below.

Works for a 16:9 screen in 1920x1080 (1080p).

# Installation

- Open the `configs` shared folder on you retropie installation
- **Recommended**: backup the folder content
- Copy the content of the `configs` folder into the share and overwrite the files.

# Content

Each system has an appropriate overlay.

Portable consoles use the ghogan-lcd shader.

8 and 16 bit consoles use the crt-pi shader. While not as good looking as crt-pi-curvature, it's much faster.

PSX and N64 use the ghogan-crt shader because, while not as good looking as crt-pi, it's a bit faster. PSX is unplayable with crt-pi-curvature, and more sluggish with crt-pi than with ghogan-crt.

If you use Retropie on a powerful machine (not a pi), feel free to search-and-replace "ghogan-crt" with "crt-pi-curvature" in every cfg file.

# Customization

If you want to use another shader than the ones configured (or disable it), edit the `configs_shaders/xxx/xxx.cfg` where "xxx" is the system name (megadrive, nes...).

# Credits

- MarbleMad (Team ScreenZone)
- Kam3leon (Team ScreenZone)
- [Orions angel](https://www.youtube.com/channel/UCG1g7PE9yzd4MboQQa9OYWA)

[Source](https://www.screenscraper.fr/forumsujet.php?frub=43&fsuj=182)

[Shaders from ghogan42](https://retropie.org.uk/forum/topic/13356/)

I have just moved files around to adapt the pack for Retropie.

Usage of the pack in a commercial product is strictly forbidden.
