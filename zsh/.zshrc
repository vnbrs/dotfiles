export ZSH=$HOME/.oh-my-zsh
eval "$(rbenv init -)"

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

plugins=(
  git
)

fpath=(/usr/local/share/zsh-completions $fpath)

source $ZSH/oh-my-zsh.sh
source ~/.inputrc
source ~/.config/aliases

export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/rsa_id"
export LC_CTYPE="en_US.UTF-8"
export LANG="en_US.UTF-8"

# prompt
source $HOME/.zsh_prompt

# Update PATH for the Google Cloud SDK
source $HOME/google-cloud-sdk/path.zsh.inc

# gcloud completion
source $HOME/google-cloud-sdk/completion.zsh.inc

# googler completion
source $HOME/google-cloud-sdk/completion.zsh.inc

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
