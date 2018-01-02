# Pre-requisites

Needs Retropie 4.3 - not tested on another version.  
It's based on a Recalbox overlays set - see credits below - so if you have Recalbox, just use the source.

Works for a 16:9 screen in 1920x1080 (1080p).

# Installation

- Open the "configs" shared folder on you retropie installation
- **Recommended**: backup the folder content
- Copy the content of the chosen "configs_xxx" folder into the share and overwrite the files.

# Contents

The `configs_noshader` folder contains overlays to use if you don't already have shaders configured for you emulators.  
They have scanlines and pixel grids inside the overlays, so using them in addition to a shader can look funky.

The `configs_shader` folder has a mix of shadered and non-shadered overlays.  
The "regular" consoles and computers using a CRT TV are pre-configured to use the `crt-pi-curvature` shader.  
The portable consoles (Gamegear, Gameboy...) use the overlay's pixel grids, and disable shaders.

# Customization

If you want to use a shader on the portable consoles, there are both the gridded and gridless overlays in `config_shaders/all/retroarch/overlay/systems/`.
Just overwrite the images in the folder with what you want.

If you want to use another shader than `crt-pi-curvature` (or disable it), edit the `configs_shaders/xxx/xxx.cfg` where "xxx" is the system name (megadrive, nes...).

# Credits

- MarbleMad (Team ScreenZone)
- Kam3leon (Team ScreenZone)
- [Orions angel](https://www.youtube.com/channel/UCG1g7PE9yzd4MboQQa9OYWA)

[Source](https://www.screenscraper.fr/forumsujet.php?frub=43&fsuj=182)

I have just moved files around to adapt the pack for Retropie.

Usage of the pack in a commercial product is strictly forbidden.
