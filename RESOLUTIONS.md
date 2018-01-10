# List of resolutions for all systems

The goal is to calculate maximum resolution, integer-scaled (multiplied by an integer), to fit a modern 1080p (1920 x 1080) or 720p (1280 x 720) TV screen.  
Why? Because it's better-looking to have the "resized emulator pixels" be multiples of actual TV pixels, it's easier to create an overlay with scanlines, and when you are using a shader, it's usually faster.

## What is not covered

- Arcade: each system has its own resolution
- Atari 2600: has a weird resolution that is stretched for display
- Computers (Amstrad CPC and ZX Spectrum): too many resolutions are possible
- Vectrex: does not really have a resolution

Except handheld systems (which have their own attached screen) most systems are capable of outputting a great number of resolutions : between progressive and interlaced, PAL and NTSC, and various resolutions from 240p to 576i, the combinations are endless.  
The tables below use the most common resolutions for each system.

## Calculations for integer-scaled emulators

My table: https://docs.google.com/spreadsheets/d/1Un2a9OwGAxn7u5nEPxMSxaoqe5MzzcxDTu0fo5UJEPc/edit#gid=0

### 1080p

System                | hres | vres | ratio | viewport width | viewport height | viewport x | viewport y
----------------------|------|------|-------|----------------|-----------------|------------|------------
Atari 7800            | 320  | 240  | 4     | 1280           | 960             | 320        | 60
Atari Lynx            | 160  | 102  | 10    | 1600           | 1020            | 160        | 30
Dreamcast             | 640  | 480  | 2     | 1280           | 960             | 320        | 60
Game Gear             | 160  | 144  | 7     | 1120           | 1008            | 400        | 36
Gameboy / Color       | 160  | 144  | 7     | 1120           | 1008            | 400        | 36
Gameboy Advance       | 240  | 160  | 6     | 1440           | 960             | 240        | 60
Master System         | 256  | 192  | 5     | 1280           | 960             | 320        | 60
Megadrive / 32X / CD  | 320  | 240  | 4     | 1280           | 960             | 320        | 60
NeoGeo                | 320  | 224  | 4     | 1280           | 896             | 320        | 92
NeoGeo Pocket / Color | 160  | 152  | 7     | 1120           | 1064            | 400        | 8
NES / Famicom         | 256  | 240  | 4     | 1024           | 960             | 448        | 60
Nintendo 64           | 320  | 240  | 4     | 1280           | 960             | 320        | 60
PC Engine             | 256  | 240  | 4     | 1024           | 960             | 448        | 60
Playstation           | 320  | 240  | 4     | 1280           | 960             | 320        | 60
PSP                   | 480  | 272  | 3     | 1440           | 816             | 240        | 132
SG-1000               | 256  | 192  | 5     | 1280           | 960             | 320        | 60
SNES                  | 256  | 224  | 4     | 1024           | 896             | 448        | 92
WonderSwan            | 224  | 144  | 7     | 1568           | 1008            | 176        | 36

### 720p

System                | hres | vres | ratio | viewport width | viewport height | viewport x | viewport y
----------------------|------|------|-------|----------------|-----------------|------------|------------
Atari 7800            | 320  | 240  | 3     | 960            | 720             | 160        | 0
Atari Lynx            | 160  | 102  | 7     | 1120           | 714             | 80         | 3
Dreamcast             | 640  | 480  | 1     | 640            | 480             | 320        | 120
Game Gear             | 160  | 144  | 5     | 800            | 720             | 240        | 0
Gameboy / Color       | 160  | 144  | 5     | 800            | 720             | 240        | 0
Gameboy Advance       | 240  | 160  | 4     | 960            | 640             | 160        | 40
Master System         | 256  | 192  | 3     | 768            | 576             | 256        | 72
Megadrive / 32X / CD  | 320  | 240  | 3     | 960            | 720             | 160        | 0
NeoGeo                | 320  | 224  | 3     | 960            | 672             | 160        | 24
NeoGeo Pocket / Color | 160  | 152  | 4     | 640            | 608             | 320        | 56
NES / Famicom         | 256  | 240  | 3     | 768            | 720             | 256        | 0
Nintendo 64           | 320  | 240  | 3     | 960            | 720             | 160        | 0
PC Engine             | 256  | 240  | 3     | 768            | 720             | 256        | 0
Playstation           | 320  | 240  | 3     | 960            | 720             | 160        | 0
PSP                   | 480  | 272  | 2     | 960            | 544             | 160        | 88
SG-1000               | 256  | 192  | 3     | 768            | 576             | 256        | 72
SNES                  | 256  | 224  | 3     | 768            | 672             | 256        | 24
WonderSwan            | 224  | 144  | 5     | 1120           | 720             | 80         | 0