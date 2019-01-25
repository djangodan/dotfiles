# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
GOPATH="$HOME"
export PATH=/usr/local/bin:$PATH
export PROJECT_HOME=$HOME/_dev

# Set name of the theme to load.
ZSH_THEME="ys"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git npm sudo django)

source $ZSH/oh-my-zsh.sh

# iTerm colours
export CLICOLOR=1
export TERM=xterm-256color

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# emacs
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs "$@"'

# python
alias python="python3"
alias pip="pip3"
export PIP_REQUIRE_VIRTUALENV=false

# File system shortcuts
alias dev="cd ~/dev"
alias bjl="cd ~/dev/_clients/bjl"
alias hala="cd ~/dev/hala"
alias writing="cd ~/Google\ Drive/writting"

# Email shortcuts
alias cemail="cat dist/index.html | pbcopy"

# bower
alias bower="noglob bower"

# Vim
# alias vim="/usr/local/bin/vim"
alias vim="mvim -v"

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

# Rpi alias
alias pacin="sudo pacman -S"
alias pacser="pacman -Ss"
alias aptin="sudo apt-get install"
alias aptser="sduo apt-cache search"

# Ezpz
alias c="clear"
alias purge="sudo purge"


# Paths
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Node modules
export NODE_PATH="/usr/local/lib/node_modules/:/Users/dannywilson/.node/lib/node_modules"
export PATH="/Users/dannywilson/.node/bin:$PATH"

# Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/base16-solarized-dark.sh"
# [[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

export ANDROID_HOME=/Users/dannywilson/Library/Android/sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"


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
