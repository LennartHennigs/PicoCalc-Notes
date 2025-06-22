# PicoCalc

Some notes on and programs for the PicoCalc.


## Hardware

- comes with a Pi Pico
- Pin-compatible devices can also be used, but need a new firmware, e.g.
  - Pico 2W
  - [Luckfox Lyra](https://wiki.luckfox.com/Luckfox-Lyra/Introduction/)

### Pico Pinout
- for the Pico pinout see [pico.pinout.xyz](https://pico.pinout.xyz/)
- IC2: GP6, GP7 (hardwired to built-in keyboard)
- SPI (for the LCD): GP10, GP11, GP12
- SD Card: GP17, GP18, GP19, GP16
- Audio (PWM): GP26, GP27
- available via pin headers
  -   GP2, GP3, GP4, GP5, GP21, GP28

### LCD

  - ILI9488P, controlled via SPI
  - Screen Resolution: 320x320px

### Hardware Hacks

- [RGB LED Stick](https://steinlaus.de/rgb-led-stick-fuer-den-picocalc/)
- [RTC](https://forum.clockworkpi.com/t/rtc-inside-the-case/16484) (Real-time Clock)
- [LoRa](https://forum.clockworkpi.com/t/picocalc-with-lora/16773) via a ESP32 LoRa board
- [Pi Zero2](https://forum.clockworkpi.com/t/raspberry-pi-zero-2-on-picocalc/17946) replacement

## Firmware 

- [Luckfox Lyra Linux](https://forum.clockworkpi.com/t/luckfox-lyra-on-picocalc/16280)


### MMBasic

- [MMBasic](https://github.com/madcock/PicoMiteAllVersions) branch for PicoCalc
- [MMBasic Manual](https://geoffg.net/Downloads/picomite/PicoMite_User_Manual.pdf) (current version)


#### Updating the Firmware

- Press Bootsel on Pi Pico
- Plug in the Device using the **Mini USB** connector
- You will now see the PicoCalc as a drive
- Copy the .u2f file
- Eject the drive
- Unplug the PicoCalc
- Reboot

## Connecting via Serial 

- Use the **USB C** connector
- Use a terminal program (e.g., [tio](https://github.com/tio/tio) or [minicom](https://formulae.brew.sh/formula/minicom) on a Mac) to connect to device
  - `tio /dev/tty.usberial-110`
  - `minicom -D /dev/tty.usberial-110 -b 115200 -c`
- Settings:
  - 115200 baud
  - 8N1
  - Emulation VT102
  - Backspace key: BS
  - Enable VT102 color mode

### File Transfer via Serial

- Enter `XMODEM RECEIVE` via console on the PicoCalc
- In Terminal Program use: XModem Send

## MMBasic

### Pre-defined Shortcuts

| Key | Command |
|--|--|
| F2 | run  |
| F3 | list |
| F4 | edit |
| F10 | autosave |
| CTRL + C| Exit program |

### Defining additional Shortcuts ( F1, F5 - F9)

``` BASIC
option f5 "DRIVE " + chr$(34) + "B:" + chr$(13)
```

 ### MMBasic Options

``` BASIC
' show current options
OPTION list

' will automatically run the program in program memory
OPTION autorun on

' disable Pico LED blinking
OPTION heartbeat off
```

### Editor Options

``` BASIC
' keyword display in edit [lower|upper|title]
OPTION case lower

' colors in edit
OPTION colorcode on

' line wrap in edit (needs MMBasic >= 6.x)
OPTION continuation lines on
```
