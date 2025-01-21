# Load Oh My Zsh
export ZSH=/Users/johnshen/.oh-my-zsh
ZSH_THEME="mortalscumbag"
plugins=(git colored-man-pages copypath history sublime rsync safe-paste docker github heroku vagrant npm)

# Load environment variables early
[[ -f ~/.env ]] && source ~/.env

source $ZSH/oh-my-zsh.sh

# Initialize Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Initialize asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# Aliases for frequent commands
alias ll="ls -lah"
alias be="bundle exec"

# Git aliases
alias ga="git add"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gpr="git pull upstream main"
alias gprm="git checkout main && git pull && git checkout - && git rebase main"
alias gl="git log"
alias gco="git checkout"
alias gcom="git checkout main"
alias grm="git rebase -i main"
alias grc="git rebase --continue"
alias gs="git status"
alias gd="git diff"
alias pick="git cherry-pick"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias clean_branches="for branch in \$(git branch --merged); do; git branch -d \"\$branch\"; done"

# Node.js aliases
alias ytw='yarn test --watch'

# Python and Stable Diffusion aliases
alias sd_start='cd ~/src/ml-stable-diffusion && conda activate coreml_stable_diffusion'
export SD_SEED=1111
alias sd_gen="python -m python_coreml_stable_diffusion.pipeline -i output -o image_outputs --compute-unit ALL --seed ${SD_SEED} --prompt"

# Everlane aliases
alias rc_admin='heroku run rails c --app=everlane-admin'
alias ss='script/start -c2 -w'
alias stw='script/test watch'
alias everlane_mix='bundle exec rake db:drop db:create db:schema:load mix util:create_review_app_users util:create_review_app_orders util:create_review_app_pos_roles cache:schedule_collection_refresh util:prepare_reach_env'
alias review_app_mix='heroku run bundle exec rake db:drop db:create db:schema:load mix util:create_review_app_users cache:schedule_collection_refresh util:prepare_reach_env'
alias start_workers='bundle exec foreman start --port 3000 --color --formation all=0,web=1,webpack=1,low=1'
