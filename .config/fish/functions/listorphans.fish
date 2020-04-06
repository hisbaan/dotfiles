# Defined in - @ line 1
function listorphans --description 'alias listorphans=sudo pacman -Qtdq'
	sudo pacman -Qtdq $argv;
end
