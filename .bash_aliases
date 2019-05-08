# custom
alias aliasedit='vim ~/.bash_aliases && source ~/.bash_aliases'
alias bashrc='vim ~/.bashrc && source ~/.bashrc'
alias vimrc='vim ~/.vim_runtime/my_configs.vim'

# gnu
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'

# vim
alias goyo='vim +Goyo'
vimplug () {
    git -C $VIM_PLUGIN_PATH clone $1
}
