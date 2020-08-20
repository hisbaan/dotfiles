# Defined in - @ line 1
function grep --wraps='grep --color=auto' --wraps=rg --description 'alias grep rg'
  rg  $argv;
end
