# Retropie overlays pack

Overlays (or bezels) are images added "above" the emulator, to mask the black borders around the image.

This pack adds overlays for most common systems emulated by Retropie.

## Contents

- `overlays_clean_1080p`: just the overlays, no shaders.
- TODO: `overlays_clean_integer_1080p`: just the overlays, with integer-scaled emulator size
- TODO: `overlays_grid_integer_1080p`: overlays with an included grid to simulate scanlines, with integer-scaled emulator size
- `overlays_shaders_720p`: overlays with maximum emulator size, with shaders applied to simulate scanlines
- TODO: `overlays_shaders_integer_720p`: overlays with integer-scaled emulator size, with shaders applied to simulate scanlines
- TODO: `overlays_shaders_integer_1080p`: overlays with integer-scaled emulator size, with shaders applied to simulate scanlines

What is integer-scaling? It's when the displayed resolution is a multiple of the original console resolution.  
Why does it matter? It looks better. Shaders applied to it are faster.  
However, the image does not take the whole screen. So if you prefer a large to a crisp image, use a non-integer-scaled version.

## Requirements

- Retropie 4.3 - not tested on another version.
- A 16:9 screen doing at least 720p. This pack is useless on a 4:3 screen, since you don't have black borders.
- The configuration is optimized to work on a Raspbery Pi 3. It will work on more powerful hardware, but maybe not on less.

## Installation

- Open the `configs` shared folder on you retropie installation (`\\retropie\configs\` on Windows, `smb://retropie/configs` on Mac)
- **Recommended:** backup the folder content!
- Copy the content of the chosen overlays folder into the share, and overwrite the files.

## Credits

Please see [credits](CREDITS.md) to check out the awesome original packs I picked from.

Usage of the pack in a commercial product is strictly forbidden.
