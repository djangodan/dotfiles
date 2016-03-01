# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
GOPATH="$HOME"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/directory-you-do-development-in
source /usr/local/bin/virtualenvwrapper.sh

# Set name of the theme to load.
ZSH_THEME="avit"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bower brew gem npm osx pip sudo vagrant virtualenvwrapper web-search django cp zsh-snippets)

source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# File system shortcuts
alias dev="cd ~/_dev"
alias bjl="cd ~/_bjl"
alias writing="cd ~/Dropbox/writting"

# Email shortcuts
alias cemail="cat dist/index.html | pbcopy"

# bower
alias bower="noglob bower"

# Vim
alias vim="/usr/local/bin/vim"

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

# Watson shortcuts and functions
alias wat="start-watson-from-dir-name"

function start-watson-from-dir-name {
  watson start `basename $PWD`
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
export PATH="/Users/dannywilson/.node/bin/:$PATH"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export ANDROID_HOME=/Users/dannywilson/Library/Android/sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

eval "$(docker-machine env default)"
