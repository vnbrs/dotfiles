# Edit and refresh aliases
alias aliasedit='vim ~/.bash_aliases && source ~/.bash_aliases'

# Edit and refresh bash configuration file
alias bashrc='vim ~/.bashrc && source ~/.bashrc'

# Edit and refresh vim configuration file
alias vimrc='vim ~/.vim_runtime/my_configs.vim'

# Default flags for programs
alias ls='ls -a --color=auto'
alias grep='grep --color=auto'

# Launch vim in zen mode (Goyo)
alias goyo='vim +Goyo'

# Install a vim plugin
vimplug () {
    if [ -z $1 ]
    then
        echo "Please inform the repository, e.g. vimplug https://github.com/vnbrs/vim-plugin.git"
        return 1
    fi

    git -C $VIM_PLUGIN_PATH clone $1
}

# Update my dotfiles repository
dotfilesupdate () {
    DOTFILES_REPO_DIR="$HOME/projects/vnbrs/dotfiles"
    source $DOTFILES_REPO_DIR/utility/update_repo.sh $DOTFILES_REPO_DIR
    git --git-dir="$DOTFILES_REPO_DIR/.git" add .
    git --git-dir="$DOTFILES_REPO_DIR/.git" commit -m "(auto) Syncronize dotfiles"
    git --git-dir="$DOTFILES_REPO_DIR/.git" push origin master
}
