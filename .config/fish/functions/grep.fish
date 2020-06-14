# Defined in - @ line 1
function grep --wraps=rg --description 'alias grep rg'
  rg  $argv;
end
