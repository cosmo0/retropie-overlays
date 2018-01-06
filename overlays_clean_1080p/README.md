# Overlays with shaders

## Content

Each system has an appropriate overlay configured.

They are the same as the `overlays_shaders` pack but since no shader is configured, it can run at 1080p by default.

## Customization

### Using a 720p resolution in the emulators

By default the emulators will display at a 1080p resolution (the actual emulator is smaller but the whole screen is 1080p).

If you want better performances, you can configure the emulators to run in 720p:

- Open the `all/retroarch/overlay_cfg/resolution_xxx.cfg` file
- Change the include of "720p.cfg" to "1080p.cfg"
