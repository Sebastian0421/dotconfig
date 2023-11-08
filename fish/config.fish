set -g -x RANGER_LOAD_DEFAULT_RC FALSE
set -g -x PATH /usr/local/matlab/R2020a/bin/ $PATH
#set -g -x DISPLAY  10.192.130.199:0
#set -g -x DISPLAY (ifconfig | grep inet | awk '{print $2}' | head -n 1 | awk '{print $0":0"}')
set -g fish_greeting
set -g -x PATH /usr/local/matlab/R2020a/bin/glnxa64/ $PATH

# wsl启动fish时自动启动tmux
if status --is-login
  if test -z "$TMUX"
    exec tmux
  end
end

# ubuntu启动fish时自动启动tmux
#if status --is-interactive
#  if test -z "$TMUX"
#    exec tmux
#  end
#end

# cuda
set -g -x PATH /usr/local/cuda/bin $PATH
set -g -x LD_LIBRARY_PATH /usr/local/cuda-11/lib64 $LD_LIBRARY_PATH


