[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xmodmap ~/.Xmodmap

# changing display refresh rate
xrandr --output DVI-D-0 --mode 1920x1080 --rate 144 &

# starting picom
# picom -b

# forcing programs to use .Xresources
~/.local/bin/xresources/xresources-kitty &

exec i3
