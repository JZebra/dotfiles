# Path configurations needed for all shells
# Homebrew path (M1/ARM Mac)
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add user bin directory
export PATH="$HOME/src/bin:$PATH"

# asdf version control (initialize for login shells)
. /opt/homebrew/opt/asdf/libexec/asdf.sh
export PATH="$HOME/.asdf/shims:$PATH"

# Conda initialization for login shells
__conda_setup="$('/Users/johnshen/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/johnshen/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/johnshen/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/johnshen/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# Deactivate Conda by default
conda deactivate

# Environment variables
export LANG=en_US.UTF-8
export GOPATH=/Users/johnshen/
export PGDATA=/usr/local/var/postgres
export SSH_KEY_PATH="~/.ssh/id_rsa"

# Node.js and Yarn
export PATH="/opt/homebrew/opt/node/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# LDFLAGS and CPPFLAGS for system libraries
export LDFLAGS="-L/opt/homebrew/lib $LDFLAGS"
export CPPFLAGS="-I/opt/homebrew/include $CPPFLAGS"

# Source custom environment variables
test -f ~/.env && source ~/.env

# Source Everlane-specific environment variables
test -f ~/.everlane && source ~/.everlane