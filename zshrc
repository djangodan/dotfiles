# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
GOPATH="$HOME"
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
alias vim="/usr/local/bin/vim"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"
# ZSH_THEME="kardan"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# My settings

# new project
function newproj() { mkdir $1 ; cd $1 ; mkdir build ; }

# VPS pull and build
function danwilson() { git pull ; jekyll build ; }


alias bjl="cd ~/BJL"

# bower
alias bower="noglob bower"
# tmux
alias tma="tmux attach -t"
alias tmd="tmux detach"
alias tml="tmux ls"
alias tmk='tmux ls | awk '{print $1}' | sed 's/://g' | xargs -I{} tmux kill-session -t {}'


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
alias github="cd ~/Dropbox/GitHub\ repos/"

# Ezpz
alias c="clear"
alias purge="sudo purge"

# Easy heroku
function gph() { rake assets:precompile ; git aa ; git c 'Precompile for heroku push' ; git ps ; git ph ; }

# Make boilerplate files
function sitedir() { mkdir js images; touch index.html js/main.js ;}

# Get base sass files
function getbase() {
  git clone http://github.com/wilsonand1/base.git . ;
  rm -rf README.md .git;
}

# Make new site function
function newsite(){
  mkdir $1;
  cd $1;
  getbase;
  sitedir;
  touch README.md;
  echo "# $1" > README.md;
  echo $(date +%d.%m.%y-%H:%M:%S) >> README.md;
  git init;
  git aa;
  git commit -am 'Initial commit'
  git nb 'dev';
  sublime .;
}

# New vagrant install
function clonevag(){
  git clone https://github.com/chad-thompson/vagrantpress.git;
  mv vagrantpress $1;
  cd $1;
  rm -rf .git;
  git init;
  touch README.md;
  echo "# $1" > README.md;
  echo $(date +%d.%m.%y-%H:%M:%S) >> README.md;
  vagrant up;
  cd wordpress/wp-content/themes;
  mkdir $1;
  cd $1;
  sublime .;
}

# Navigate to and open dissertation files
function dissertation() { cd ~/Dropbox/University/Year\ 3/Project/Daniel\ Wilson/Dissertation/ ; open dissertation.tex bib.bib chapters/*.tex ;}
# Wordcount
function wordcount() { perl texcount.pl chapters/*.tex ; }

# Navigate to Sublime git repo
function gitsublime() { cd /Users/wilson/Library/Application\ Support/Sublime\ Text\ 3 ;}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
