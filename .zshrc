export ZSH="/home/utku/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export XDEBUG_CONFIG="idekey=VSCODE"
export BAT_THEME="Dracula"


# git aliases
alias glh='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias gph='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gc='git commit -v --no-verify' 
alias gs=gss
alias gd='git diff --minimal'
alias gdst='gd --staged'

# other aliases
alias vim=nvim
alias cat=bat
alias l='exa -lah'
alias diff=icdiff

export PYENV_ROOT="$HOME/.pyenv"

export PATH="/usr/local/bin:$HOME/.local/bin:$HOME/bin:$PYENV_ROOT/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(pyenv init -)"
