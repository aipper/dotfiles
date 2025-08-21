# -------------------------------------------------------------------
# Oh My Zsh Configuration
# -------------------------------------------------------------------

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="random"

# Standard plugins can be found in $ZSH/plugins/
plugins=(git)

# Source Oh My Zsh. This must be done before custom configurations that
# might override its settings.
source $ZSH/oh-my-zsh.sh


# -------------------------------------------------------------------
# User Environment & Aliases
# -------------------------------------------------------------------

# Set preferred editor
export EDITOR='nvim'

# Go proxy for mainland China users
export GOPROXY=https://proxy.golang.com.cn,direct

# Terminal settings for better compatibility (especially inside tmux)
export TERMINFO=/usr/share/terminfo
export TERM=screen-256color

# Custom environment variables
export AWS_PAAS_HOME_HFKYSC=/data/aws

# Aliases for convenience
alias gtt="git config credential.helper 'cache --timeout=3600000'"
alias vim='nvim'
alias tmux='tmux -2'
alias sho='ssh -o ServerAliveInterval=60'
alias proxy='export all_proxy=socks5://localhost:1080'
alias unproxy='unset all_proxy'


# -------------------------------------------------------------------
# PATH Configuration
# This is a critical section. Order matters.
# -------------------------------------------------------------------

# Define paths for various tools
export MAVEN_HOME=~/soft/maven
export PNPM_HOME="$HOME/.local/share/pnpm"
export CARGO_HOME="$HOME/.cargo"

# Prepend tool paths to the system PATH.
# This ensures that user-installed versions are used before system versions.
# We will let conda and fnm manage their own paths later.
PATH="$CARGO_HOME/bin:$PNPM_HOME:$MAVEN_HOME/bin:$HOME/.console-ninja/.bin:$PATH"
export PATH


# -------------------------------------------------------------------
# Conda Initialization
# (Managed by 'conda init')
# -------------------------------------------------------------------
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# -------------------------------------------------------------------
# FNM (Fast Node Manager) Initialization
# IMPORTANT: This MUST be placed at or near the end of the file
# to ensure it can correctly manipulate the PATH.
# -------------------------------------------------------------------
# Set FNM to use a faster mirror for downloading Node.js
export FNM_NODE_DIST_MIRROR=https://npmmirror.com/mirrors/node

# Initialize FNM environment. This command sets up the necessary PATH
# and shell functions for fnm to work.
# --use-on-cd: Automatically switch Node version when entering a directory
#              with a .node-version or .nvmrc file.
# --shell=zsh:   Generate setup script specifically for Zsh.
eval "$(fnm env --use-on-cd --shell=zsh)"
