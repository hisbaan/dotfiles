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

xrandr --output eDP-1 --mode 3840x2400 --rate 60 --dpi 220
# xrandr --output eDP-1 --mode 3840x2400 --rate 60 --dpi 110

##################
### Key Repeat ###
##################

xset r rate 300 50

###############
### Env Var ###
###############

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export MOZ_USE_XINPUT2=1
export MOZ_X11_EGL=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1

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
