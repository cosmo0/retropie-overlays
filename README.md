# Retropie overlays pack

Overlays (or bezels) are images added "above" the emulator, to mask the black borders around the image.

This pack adds overlays for most common systems emulated by Retropie. The overlays are selected to be **subtle**, and to represent the original hardware in some way. So, no bright logos or colorful mascots.

If you prefer brighter overlays, browse the [_sources](https://github.com/cosmo0/retropie-overlays/tree/master/_sources) folder, there are a LOT of them.

**Usage of the pack in a commercial product is strictly forbidden.**

## Credits

Please see [credits](CREDITS.md) to check out the awesome original packs I picked from.  
I did mostly nothing except move files around and edit config files.

If one of your file is here and you want me to remove it, or want to be credited, please [file an issue](https://github.com/cosmo0/retropie-overlays/issues) and I will remove it as soon as possible.

## Contents

Full screen emulators, full set (35 systems):

- [overlays_shaders](overlays_shaders): overlays with shaders applied to simulate CRT scanlines and LCD grids.

Integer-scaled emulators, limited set (11 systems):

- [overlays_grid_integer](overlays_grid_integer): overlays with an included grid to simulate scanlines.

What is integer-scaling? It's when the displayed resolution is a multiple of the original console resolution.  
Why does it matter? It looks better, since there are no "TV pixel" in-between 2 "emulator pixel". And shaders applied are usually better-looking.  
However, an integer-scaled emulator does not take up the whole screen. So if you prefer a large image than a crisp image, use a non-integer-scaled version.

## Requirements

- A Raspberry Pi 3/4 - not tested on another hardware, but there's no reason it shouldn't work.
- Retropie 4.7+ - not tested on another version.
- A 16:9 screen in 1080p. This pack will be wrong in any other resolution. And it's useless on a 4:3 screen, since you don't have black borders.
- The configuration is optimized to work on a Raspbery Pi 3/4. It will work on more powerful hardware, but maybe not on less.

## Installation

- Download [the latest release](https://github.com/cosmo0/retropie-overlays/releases)
- Open the `configs` shared folder on you retropie installation (`\\retropie\configs\` on Windows, `smb://retropie/configs` on Mac)
- **Recommended:** backup the folder content!
- Copy the content of the chosen overlays folder into the share, and overwrite the files.

## Modification

- If you want to remove the shader, open the file `all/retroarch/overlay_cfg/common_crt.cfg` and `common_lcd.cfg` and set `video_shader_enable` to `false`
- If you want to change the image, replace the one you want in `all/retroarch/overlay/systems/`. There are a lot of alternative images in the [_sources](https://github.com/cosmo0/retropie-overlays/tree/master/_sources) folder.
- If you want to create a new overlay yourself, use the [PSD template](https://github.com/cosmo0/retropie-overlays/tree/master/_sources/systems-custom/cutout.psd) using Photoshop or Photopea (free online editor).

## Screenshots

Click for a larger version.  
The screenshots are frankly not as good-looking as on the TV.

### Shader version

[![screenshot](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/thumb-shader-gba.jpg)](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/shader-gba.png) [![screenshot](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/thumb-shader-ms.jpg)](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/shader-ms.png) [![screenshot](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/thumb-shader-neogeo.jpg)](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/shader-neogeo.png) [![screenshot](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/thumb-shader-nes.jpg)](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/shader-nes.png)


### Grid version

[![screenshot](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/thumb-grid-gbc.jpg)](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/grid-gbc.png) [![screenshot](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/thumb-grid-gg.jpg)](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/grid-gg.png) [![screenshot](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/thumb-grid-pce.jpg)](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/grid-pce.png) [![screenshot](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/thumb-grid-castle.jpg)](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/grid-snes.png)
