abbr --add sp 'sudo pacman'

#bobthefish
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes

set PATH $PATH:/home/hisbaan/.local/bin/:/home/hisbaan/.local/bin/color-scripts/:/home/hisbaan/.local/bin/xresources/
set EDITOR '/usr/bin/nvim'
set DISPLAY localhost:0.0

#sudo !!
function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
