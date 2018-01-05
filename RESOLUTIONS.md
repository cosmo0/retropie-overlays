# List of resolutions for all systems

The goal is to calculate maximum resolution, integer-scaled (multiplied by an integer), to fit a modern 1080p (1920 x 1080) or 720p (1280 x 720) TV screen.  
Why? Because it's better-looking to have the "resized emulator pixels" be multiples of actual TV pixels, it's easier to create an overlay with scanlines, and when you are using a shader, it's usually faster.

## What is not covered

- Arcade: each system has its own resolution
- Atari 2600: has a weird resolution that is stretched for display
- Computers (Amstrad CPC and ZX Spectrum): too many resolutions are possible
- Vectrex: does not really have a resolution

## Calculations

My table: https://docs.google.com/spreadsheets/d/1Un2a9OwGAxn7u5nEPxMSxaoqe5MzzcxDTu0fo5UJEPc/edit#gid=0

System                  | hres | vres | 1080p max ratio | 1080p hres | 1080p vres | 720p max ratio | 720p hres | 720p vres
------------------------|------|------|-----------------|------------|------------|----------------|-----------|-----------
Atari 7800              | 320  | 240  | 4               | 1280       | 960        | 3              | 960       | 720
Atari Lynx              | 160  | 102  | 10              | 1600       | 1020       | 7              | 1120      | 714
Dreamcast               | 640  | 480  | 2               | 1280       | 960        | 1              | 640       | 480
Game Gear               | 160  | 144  | 7               | 1120       | 1008       | 5              | 800       | 720
Gameboy / Color         | 160  | 144  | 7               | 1120       | 1008       | 5              | 800       | 720
Gameboy Advance         | 240  | 160  | 6               | 1440       | 960        | 4              | 960       | 640
Master System / SG-1000 | 256  | 192  | 5               | 1280       | 960        | 3              | 768       | 576
Megadrive / 32X / CD    | 320  | 240  | 4               | 1280       | 960        | 3              | 960       | 720
Nintendo 64             | 320  | 240  | 4               | 1280       | 960        | 3              | 960       | 720
NeoGeo                  | 320  | 224  | 4               | 1280       | 896        | 3              | 960       | 672
NeoGeo Pocket/Color     | 160  | 152  | 7               | 1120       | 1064       | 4              | 640       | 608
NES / Famicom           | 256  | 240  | 4               | 1024       | 960        | 3              | 768       | 720
PC Engine               | 256  | 240  | 4               | 1024       | 960        | 3              | 768       | 720
Playstation             | 320  | 240  | 4               | 1280       | 960        | 3              | 960       | 720
SNES                    | 256  | 224  | 4               | 1024       | 896        | 3              | 768       | 672
