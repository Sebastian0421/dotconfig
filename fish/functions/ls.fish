# Defined in - @ line 1
function ls --wraps='ls -la' --description 'alias ls ls -la'
 command ls -la $argv;
end
