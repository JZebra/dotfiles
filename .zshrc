# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/johnshen/.oh-my-zsh
export GOPATH=/Users/johnshen/
export PATH="/Users/johnshen/miniconda3/bin:$PATH"
export PGDATA=/usr/local/var/postgres

# Tensorflow GPU settings
export CUDA_HOME=/usr/local/cuda
export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:$CUDA_HOME/lib"
export PATH="$CUDA_HOME/bin:$PATH"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="mortalscumbag"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git colored-man-pages copydir history sublime rsync safe-paste docker github heroku vagrant npm)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Custom functions

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
export WORKON_HOME=$HOME/.virtualenvs
pyenv virtualenvwrapper
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

# workaround for matplotlib graphing
# http://matplotlib.org/faq/virtualenv_faq.html
function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/bin/python "$@"
    else
        /usr/local/bin/python "$@"
    fi
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# system
alias ll="ls -lah"
alias venv ="virtualenv"
alias venv activate="virtualenv bin/activate"
alias sa="source activate"

# git
alias ga="git add"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gpr="git pull upstream master"
alias gl="git log"
alias gco="git checkout"
alias gcom="git checkout master"
alias gs="git status"
alias pick="git cherry-pick"

# shadowverse-api
alias sapi="source ~/.virtualenvs/shadowverse-api/bin/activate && cd ~/src/shadowverse-api"

# benjamin
# activates python venv, moves to folder"
alias ben="source ~/.virtualenvs/benjamin/bin/activate && cd ~/src/benjamin"
alias flow="./node_modules/.bin/flow"

# coding_challenges
alias cc="cd ~/src/coding_challenges && source ~/.virtualenvs/coding_challenges/bin/activate"

# ether_bet
alias eb="cd ~/src/ether_bet && source ~/.virtualenvs/ether_bet/bin/activate"
# alias geth_start="geth console --unlock 0 --rpc --rpcapi "eth, net, web3" --rpccorsdomain "*" --etherbase=0x0000000000000000000000000000000000000000"
alias geth_mine="geth console --nodiscover --mine --minerthreads=1 --etherbase=0x0000000000000000000000000000000000000000"

# asdf version control
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# everlane
source ~/.everlane
