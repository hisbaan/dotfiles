# Defined in - @ line 1
function df --wraps='df -h' --description 'alias df df -h'
 command df -h $argv;
end
