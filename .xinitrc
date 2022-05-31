#!/bin/sh

####################################
### Merging Defaults and Keymaps ###
####################################

userresources=$HOME/.config/Xresources/Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

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

###############
### Display ###
###############

xrandr --output DP-0 --mode 1920x1080 --rate 120

##################
### Key Repeat ###
##################

xset r rate 300 50

############
### Exec ###
############

session=${1:bspwm}
case $session in
    awesome ) exec awesome;;
    bspwm   ) exec bspwm;;
    *       ) exec bspwm;;
esac

# exec bspwm
