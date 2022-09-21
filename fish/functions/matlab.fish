# Defined in - @ line 1
function matlab --wraps='matlab -nodesktop -nodisplay' --description 'alias matlab matlab -nodesktop -nodisplay'
 command matlab -nodesktop -nodisplay $argv;
end
