# Batocera full screen overlays

## Installation

- Download [the latest release](https://github.com/cosmo0/retropie-overlays/releases)
- Open the shared folder on you Batocera installation (`\\batocera\` on Windows, `smb://batocera/` on Mac)
- Navigate to `/decorations/` and create a new folder; name it whatever you want, let's say `cosmo0`, then create a `systems` sub-folder.
- Copy the content of the overlays folder into the new sub-folder (`/decorations/cosmo0/systems/`).
- In the Batocera main menu, open the settings (start) > games settings > Integer scale = OFF, decoration = cosmo0.
- If you have installation issues, [follow the docs](https://wiki.batocera.org/customize_decorations_bezels)

## Credits

Most overlays have been created by [Marblemad & Kam3leon](https://screenscraper.fr/forumsujet.php?frub=43&fsuj=182), [OrionsAngel](https://www.youtube.com/channel/UCG1g7PE9yzd4MboQQa9OYWA) and [Duimon](https://github.com/Duimon/HSM-Reflection-Shader-Graphics).

## Shaders

I recommend you use a retro shader: in the Batocera main menu, open the settings (start) > games settings:

- Smooth games = Off
- Shaders set = Zfast or Retro or Curvature

If you use Vectrex

- Go to "Per system advanced configuration"
- Open Vectrex
- Shaders set = Retro or Flatten-Glow

## Emulators

If you want the overlays, you need to make sure Libretro emulators are selected.

In the main menu, open the settings (start) > Game settings > Per system advanced configuration > then check each of them, in "Emulator" select a "Libretro" one. If there isn't one, the overlays won't be displayed.
