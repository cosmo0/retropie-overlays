# Retropie / Recalbox / Batocera overlays packs

Overlays (or bezels) are images added "above" the emulator, to mask the black borders around the image.

This pack adds overlays for most systems emulated by Retropie, Recalbox & Batocera. The overlays are selected to be **subtle**, and to represent the original hardware in some way. So, no bright logos or colorful mascots.

If you prefer brighter overlays, browse the [_sources](https://github.com/cosmo0/retropie-overlays/tree/master/_sources) folder, there are a LOT of them.

Note that Recalbox already has [a system-complete overlays pack](https://forum.recalbox.com/topic/22321/recalbox-7-x-overlays-complets), but it has a few choices that I don't like.

**Usage of the pack in a commercial product is strictly forbidden.** But if you want to use this pack as a basis for your own personnal project, cool!

## Credits

Most overlays have been created by [Marblemad & Kam3leon](https://screenscraper.fr/forumsujet.php?frub=43&fsuj=182), [OrionsAngel](https://www.youtube.com/channel/UCG1g7PE9yzd4MboQQa9OYWA) and [Duimon](https://github.com/Duimon/HSM-Reflection-Shader-Graphics).

The shaders have been created by [ghogan42](https://retropie.org.uk/forum/topic/13356/).

Please see [credits](CREDITS.md) to check out the awesome original packs I picked from.  
I did mostly nothing except move files around and edit config files.

If one of your file is here and you want me to remove it, or want to be credited, please [file an issue](https://github.com/cosmo0/retropie-overlays/issues) and I will remove it as soon as possible.

## Contents

Full screen emulators, full set:

- [Batocera](overlays_batocera): simple overlays
- [Recalbox](overlays_recalbox): simple overlays
- [Retropie](overlays_retropie): overlays with shaders applied to simulate CRT scanlines and LCD grids

## Requirements

- A Raspberry Pi 3/4 - not tested on another hardware, but there's no reason it shouldn't work.
- Retropie 4.7+ or Recalbox 7.1.1+ - not tested on another version.
- A 16:9 screen in 1080p. This pack will be wrong in any other resolution. And it's useless on a 4:3 screen, since you don't have black borders.
- The configuration is optimized to work on a Raspbery Pi 3/4. It will work on more powerful hardware, but maybe not on less.

## Installation on Retropie

- Download [the latest release](https://github.com/cosmo0/retropie-overlays/releases)
- Open the `configs` shared folder on you Retropie installation (`\\retropie\configs\` on Windows, `smb://retropie/configs` on Mac)
- **Recommended:** backup the folder content!
- Copy the folders into the share, and overwrite the files.

## Installation on Recalbox

- Download [the latest release](https://github.com/cosmo0/retropie-overlays/releases)
- Open the shared folder on you Recalbox installation (`\\recalbox\` on Windows, `smb://recalbox/` on Mac)
- Navigate to `recalbox/system/configs/retroarch`
- **Recommended:** backup the folder content!
- Copy the overlays (cfg files) into the folder; no file should be overwritten, unless you already installed an overlay pack.
- In the Recalbox main menu, open the settings (start) > games settings > make sure "integer scale (pixel perfect)" is unchecked.
- If you have installation issues, check the doc: [EN](https://recalbox.gitbook.io/documentation/advanced-user/configuration/configuration-overload/retroarch-overloads#overlays) / [FR](https://recalbox.gitbook.io/documentation/v/francais/tutoriels/personnalisation-du-frontend/configurer-des-overlays-4.1#overlays-par-systeme)

## Installation on Batocera

- Download [the latest release](https://github.com/cosmo0/retropie-overlays/releases)
- Open the shared folder on you Batocera installation (`\\batocera\` on Windows, `smb://batocera/` on Mac)
- Navigate to `/decorations/` and create a new folder; name it whatever you want, let's say `cosmo0`, then create a `systems` sub-folder.
- Copy the cfg files into the new sub-folder (`/decorations/cosmo0/systems/`).
- In the Batocera main menu, open the settings (start) > games settings > integer scale = OFF, decoration = cosmo0.
- If you have installation issues, [follow the docs](https://wiki.batocera.org/customize_decorations_bezels)

## Modification

- If you want to remove the Retropie shader, open the files `all/retroarch/overlay_cfg/common_crt.cfg` and `common_lcd.cfg` and set `video_shader_enable` to `false`
- If you want to change the image, replace the one you want in `all/retroarch/overlay/systems/` (Retropie) or in `overlays/` (Recalbox). There are a lot of alternative images in the [_sources](https://github.com/cosmo0/retropie-overlays/tree/master/_sources) folder.
- If you want to create a new overlay yourself, use the [PSD template](https://github.com/cosmo0/retropie-overlays/tree/master/_sources/systems-custom/cutout.psd) using Photoshop or Photopea (free online editor).

## Screenshots

Click for a larger version.  
The screenshots are frankly not as good-looking as on the TV.

[![screenshot](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/thumb-shader-gba.jpg)](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/shader-gba.png) [![screenshot](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/thumb-shader-ms.jpg)](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/shader-ms.png) [![screenshot](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/thumb-shader-neogeo.jpg)](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/shader-neogeo.png) [![screenshot](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/thumb-shader-nes.jpg)](https://raw.githubusercontent.com/cosmo0/retropie-overlays/docs/screenshots/shader-nes.png)
