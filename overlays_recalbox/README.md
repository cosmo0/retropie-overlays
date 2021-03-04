# Recalbox full screen overlays

## Installation

- Download [the latest release](https://github.com/cosmo0/retropie-overlays/releases)
- Open the shared folder on you Recalbox installation (`\\recalbox\` on Windows, `smb://recalbox/` on Mac)
- Navigate to `/recalbox/system/configs/retroarch`
- **Recommended:** backup the folder content!
- Copy the content of the overlays folder into the share, and overwrite the files.
- In the Recalbox main menu, open the settings (start) > games settings > make sure "integer scale (pixel perfect)" is unchecked.

## Content

Each system has an appropriate overlay configured to look the most like what the original systems did, while maintaining proper speed on a raspberry pi 3.

## Credits

Most overlays have been created by [Marblemad & Kam3leon](https://screenscraper.fr/forumsujet.php?frub=43&fsuj=182), [OrionsAngel](https://www.youtube.com/channel/UCG1g7PE9yzd4MboQQa9OYWA) and [Duimon](https://github.com/Duimon/HSM-Reflection-Shader-Graphics).

## Shaders

I recommend you use the "retro" shader: in the Recalbox main menu, open the settings (start) > games settings:

- uncheck "smooth games"
- select "retro" in "shaders set"
- make sure "integer scale (pixel perfect)" is unchecked

If you use it, check that Vectrex uses the proper shader: in `/recalbox/systems/configs/shadersets`, edit the `retro.cfg` file, and check that the `vectrex` line is `vectrex=/recalbox/share/shaders/phosphor.glslp`.
