set -g -x RANGER_LOAD_DEFAULT_RC FALSE
set -g -x PATH /usr/local/matlab/R2020a/bin/ $PATH
#set -g -x DISPLAY 192.168.1.102:0
set -g -x DISPLAY 192.168.1.121:0
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
