# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"

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

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# My settings
# tmux
alias tm a="tmux attach -t"
alias tm d="tmux detach"
# Move to Github folder
function github() { cd ~/Dropbox/GitHub\ repos/ ;}

# Move boilerplate files
function newsite() { cp ~/Dropbox/GitHub\ repos/gruntfile/Gruntfile.js . ; cp ~/Dropbox/GitHub\ repos/gruntfile/package.json . ; mkdir js sass ; touch README.md index.html js/main.js sass/style.scss ;}

function mkns(){
	mkdir $1;
	cd $1;
	newsite;
	echo "# $1" > README.md;
	echo $(date +%d.%m.%y-%H:%M:%S) >> README.md;
	git init;
	git aa;
	git commit -am 'Initial commit'
	git nb 'dev';
	sublime .;
}

# Navigate to and open dissertation files
function dissertation() { cd ~/Dropbox/University/Year\ 3/Project/Daniel\ Wilson/Dissertation/ ; open dissertation.tex bib.bib chapters/*.tex ;}
# Wordcount
function wordcount() { perl texcount.pl chapters/*.tex ; }

# Navigate to Sublime git repo
function gitsublime() { cd /Users/wilson/Library/Application\ Support/Sublime\ Text\ 3 ;}


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
