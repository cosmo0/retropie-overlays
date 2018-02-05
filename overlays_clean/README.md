# Full screen overlays without shaders

## Content

Each system has an appropriate overlay configured.

They are the same as the `overlays_shaders` pack but no shaders are configured.

## Credits

Most overlays have been created by [Marblemad & Kam3leon](https://screenscraper.fr/forumsujet.php?frub=43&fsuj=182) and [OrionsAngel](https://www.youtube.com/channel/UCG1g7PE9yzd4MboQQa9OYWA).

## Using a 720p resolution in the emulators

By default the emulators will display at a 1080p resolution (the actual emulator is smaller but the whole screen is 1080p).

If you want better performance, you can configure the emulators to run in 720p:

- Open the folder `all/retroarch/overlay_cfg/`
- Edit `common.cfg` and change the `video_fullscreen_x` and `video_fullscreen_y` to match 720p (1280x720).
- Edit `common_crt.cfg`, comment the `custom_viewport_xxx` parameters and un-comment the 720p ones.
- Do the same for all config files for handheld (atarilynx, gamegear, gb, etc) and do the same.
