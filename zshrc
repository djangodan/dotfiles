# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
GOPATH="$HOME"
alias vim="/usr/local/bin/vim"
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/directory-you-do-development-in
source /usr/local/bin/virtualenvwrapper.sh

# Set name of the theme to load.
ZSH_THEME="terminalparty"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git bower brew gem npm osx pip sudo vagrant virtualenvwrapper web-search django cp)

source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# activate venv
alias activate="source venv/bin/activate"

# My settings
# VPS pull and build
function danwilson() { git pull ; jekyll build ; }

alias bjl="cd ~/_bjl"
alias tools="cd ~/_bjl/_tools"
alias npmdev="nodemon ./bin/www"
alias cemail="cat dist/index.html | pbcopy"
alias prcheck="lpr ~/_bjl/asda/_docs/Developer-Email-QA-Checklist.pdf"

# bower
alias bower="noglob bower"
# tmux
alias tnew="new-tmux-from-dir-name"
alias tatt="tmux attach-session -t "
alias td="tmux detach"
alias tls="tmux ls"
alias tkill="tmux kill-session -t "
alias tmk='tmux ls | awk '{print $1}' | sed 's/://g' | xargs -I{} tmux kill-session -t {}'

function new-tmux-from-dir-name {
  tmux new-session -As `basename $PWD`
}

alias vi="open -a vimr.app $*"

# python stuffs
alias py="python"
alias py2="python2"
alias newvenv="virtualenv venv"
alias actv="source venv/bin/activate"
alias deactv="deactivate"

# Rpi alias
alias pacin="sudo pacman -S"
alias pacser="pacman -Ss"
alias aptin="sudo apt-get install"
alias aptser="sduo apt-cache search"

# dotfiles
alias gitdot="cd ~/dotfiles"
alias subdot="sublime ~/dotfiles"

# github local repos
alias github="cd ~/_dev"

# Ezpz
alias c="clear"
alias purge="sudo purge"

# Easy heroku
function gph() { rake assets:precompile ; git aa ; git c 'Precompile for heroku push' ; git ps ; git ph ; }

# RVM Stuffs
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Navigate to Sublime git repo
function gitsublime() { cd /Users/wilson/Library/Application\ Support/Sublime\ Text\ 3 ;}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

export ANDROID_HOME=/Users/dannywilson/Library/Android/sdk
export PATH="$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
