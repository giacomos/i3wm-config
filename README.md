# i3 Configuration

## Requirements
### general
* i3 - window manager
* i3status - status bar
* feh - setting bg, also nice image viewer
* pulseaudio - audio managment
* dmenu - Super-P launcher
* pavucontrol - pulseaudio mixer
* alsamixer
* scrot - screenshots
* acpi - for volume infos
* conky - better sys informations
* jq - for parse weather info
* bc - for calculating current brightness level
### from xorg
* setxkbmap - setting keyboard layout


##Installation
It's as simple as that:

```bash
cd ~
git clone https://github.com/giacomos/i3wm-config.git .i3
ln -s .i3/i3status.conf ~/.i3status.conf
ln -s .i3/xinitrc ~/.xinitrc
ln -s .i3/xinitrc ~/.xsession
cd .i3
ln -s config_work_laptop config
```

Create a new file /usr/share/xsessions/custom.desktop with:
```
[Desktop Entry]
Name=Xsession
Exec=/etc/X11/Xsession
```
You should now have a new session option during login, Xsession will load the user's ~/.xsession file 
