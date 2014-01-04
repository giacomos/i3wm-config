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
### from xorg
* setxkbmap - setting keyboard layout


##Installation
It's as simple as that:

```bash
cd
git clone https://github.com/ivyl/i3-config.git .i3
ln -s .i3/i3status.conf ~/.i3status.conf
ln -s .i3/xinitrc ~/.xinitrc
ln -s .i3/xinitrc ~/.xsession
```
