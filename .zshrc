# If you come from bash you might have to change your $PATH.
export PATH=/usr/local/bin:$PATH

# add path to conda
# export PATH="$HOME/miniconda3/bin:$PATH"  # commented out by conda initialize
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/john/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/john/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/john/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/john/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# deactivate conda by default
conda deactivate

# Path to your oh-my-zsh installation.
export ZSH=/Users/john/.oh-my-zsh
export GOPATH=/Users/john/
export PGDATA=/usr/local/var/postgres

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
plugins=(git colored-man-pages copypath history sublime rsync safe-paste docker github heroku vagrant npm)

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
export SSH_KEY_PATH="~/.ssh/id_rsa"

# env vars eg. NPM_TOKEN
source ~/.env

# Custom functions

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# yarn global path
export PATH="$(yarn global bin):$PATH"

# local script path
export PATH=~/src/bin:$PATH

# mysql2 gem
# https://stackoverflow.com/questions/71565375/mysql2-gem-is-failing-following-a-macbookpro-os-upgrade
export LDFLAGS="-L/opt/homebrew/lib $LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/include $CPPFLAGS"

# system
alias ll="ls -lah"
alias be="bundle exec"

# git
alias ga="git add"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gpr="git pull upstream main"
alias gl="git log"
alias gco="git checkout"
alias gcom="git checkout main"
alias grm="git rebase -i main"
alias grc="git rebase --continue"
alias gprm="git checkout main && git pull && git checkout - && git rebase main"
alias gs="git status"
alias gd="git diff"
alias pick="git cherry-pick"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias clean_branches="for branch in \$(git branch --merged); do; git branch -d \"\$branch\"; done"
# - git branch | grep -v “main” |  grep -v “code-freeze-2022” | xargs git branch -D

# nodejs
alias ytw='yarn test --watch'

# python
alias sd_start='cd ~/src/ml-stable-diffusion && conda activate coreml_stable_diffusion'
export SD_SEED=1111
alias sd_gen="python -m python_coreml_stable_diffusion.pipeline -i output -o image_outputs --compute-unit ALL --seed ${SD_SEED} --prompt"

# asdf version control
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# everlane
source ~/.everlane
alias rc_admin='heroku run rails c --app=everlane-admin'
alias ss='script/start -c2 -w'
alias stw='script/test watch'
# alias hra='heroku repo:gc --app=everlane-admin && heroku repo:purge_cache --app=everlane-admin'
# alias hrp='heroku repo:gc --app=everlane && heroku repo:purge_cache --app=everlane'
alias everlane_mix='bundle exec rake db:drop db:create db:schema:load mix util:create_review_app_users util:create_review_app_orders util:create_review_app_pos_roles cache:schedule_collection_refresh util:prepare_reach_env'
alias review_app_mix='heroku run bundle exec rake db:drop db:create db:schema:load mix util:create_review_app_users cache:schedule_collection_refresh util:prepare_reach_env'
alias start_workers='bundle exec foreman start --port 3000 --color --formation all=0,web=1,webpack=1,low=1'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
