set -g -x RANGER_LOAD_DEFAULT_RC FALSE
set -g -x PATH /usr/local/matlab/R2020a/bin/ $PATH
#set -g -x DISPLAY 192.168.0.101:0
#set -g -x DISPLAY 10.192.214.67:0
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


