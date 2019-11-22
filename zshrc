# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
GOPATH="$HOME"
export PATH=/usr/local/bin:$PATH
export PROJECT_HOME=$HOME/_dev

# Set name of the theme to load.
if [[ $TERM = dumb ]]; then
  unset zle_bracketed_paste
  prompt walters
  unsetopt zle
fi

export ZSH_THEME="bureau"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(django docker docker-compose git heroku kubectl npm pipenv python pip ubuntu)

source $ZSH/oh-my-zsh.sh

# iTerm colours
export CLICOLOR=1
export TERM=xterm-256color

# ruby
eval "$(rbenv init -)"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# emacs
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs "$@"'

# python
export PIP_REQUIRE_VIRTUALENV=false
export WORKON_HOME=~/.local/share/virtualenvs

# bower
alias bower="noglob bower"

# TODO: fix vim between linux and macos
# Vim
# alias vim="/usr/local/bin/vim"
# alias vim="mvim -v"

# tmux
alias tnew="new-tmux-from-dir-name"
alias tatt="tmux attach-session -t "
alias td="tmux detach"
alias tls="tmux ls"
alias tkill="tmux kill-session -t "
alias tmk='tmux ls | awk '{print $1}' | sed 's/://g' | xargs -I{} tmux kill-session -t {}'
alias open='reattach-to-user-namespace open'

function new-tmux-from-dir-name {
  tmux new-session -As `basename $PWD`
}

# Ezpz
alias c="clear"
alias purge="sudo purge"

# pyenv
eval "$(pyenv init -)"

# direnv
eval "$(direnv hook zsh)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Docker
function docker-start {
  typeset vm=${1:-default} sts
  case $vm in
    -h|--help)
      echo $'usage: docker-start [<vm>]\n\nEnsures that the specified/default Docker VM is started\nand the environment is initialized.'
      return 0
      ;;
  esac
  sts=$(docker-machine status "$vm") || return
  [[ $sts == 'Running' ]] && echo "(Docker VM '$vm' is already running.)" || { 
    echo "-- Starting Docker VM '$vm' (\`docker-machine start "$vm"\`; this will take a while)..."; 
    docker-machine start "$vm" || return
  }
  echo "-- Setting DOCKER_* environment variables (\`eval \"\$(docker-machine env "$vm")\"\`)..."
  eval "$(docker-machine env "$vm")" || return
  export | grep -o 'DOCKER_.*'
  echo "-- Docker VM '$vm' is running."
}
function docker-stop {
  typeset vm=${1:-default} sts envVarNames fndx
  case $vm in
    -h|--help)
      echo $'usage: docker-stop [<vm>]\n\nEnsures that the specified/default Docker VM is stopped\nand the environment is cleaned up.'
      return 0
      ;;
  esac
  sts=$(docker-machine status "$vm") || return
  [[ $sts == 'Running' ]] && { 
    echo "-- Stopping Docker VM '$vm' (\`docker-machine stop "$vm"\`)...";
    docker-machine stop "$vm" || return
  } || echo "(Docker VM '$vm' is not running.)"
  [[ -n $BASH_VERSION ]] && fndx=3 || fndx=1 # Bash prefixes defs. wit 'declare -x '
  envVarNames=( $(export | awk -v fndx="$fndx" '$fndx ~ /^DOCKER_/ { sub(/=.*/,"", $fndx); print $fndx }') )
  if [[ -n $envVarNames ]]; then
    echo "-- Unsetting DOCKER_* environment variables ($(echo "${envVarNames[@]}" | sed 's/ /, /g'))..."
    unset "${envVarNames[@]}"
  else
    echo "(No DOCKER_* environment variables to unset.)"
  fi
  echo "-- Docker VM '$vm' is stopped."
}

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
