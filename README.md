# PicoCalc

Some notes on and programs for the PicoCalc.


## Hardware

- Screen Resolution: 320x320px
  

## Firmware 

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
