[[ -f ~/.config/Xresources/Xresources ]] && xrdb -merge -I$HOME ~/.config/Xresources/Xresources
xmodmap ~/.Xmodmap

# changing display refresh rate
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144 &

exec i3
