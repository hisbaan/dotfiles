#!/bin/sh

userresources=$HOME/.config/Xresources/Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

xrandr --output eDP-1 --mode 3840x2400 --rate 60 --dpi 220

xset r rate 300 50

# session=${1:bspwm}
# case $session in
    # awesome ) exec awesome;;
    # # bspwm   ) exec bspwm;;
    # *       ) exec $1;;
# esac

exec bspwm
