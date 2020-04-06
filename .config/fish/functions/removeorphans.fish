# Defined in - @ line 1
function removeorphans --description 'alias removeorphans=sudo pacman -R (pacman -Qtdq)'
	sudo pacman -R (pacman -Qtdq) $argv;
end
