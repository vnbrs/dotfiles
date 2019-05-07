if test -z "$1"
then
    echo "Inform the destination. Example: source update_repo.sh /path/to/root"
    return 1
fi

cp $HOME/.profile "$1"
cp $HOME/.bashrc "$1"
cp $HOME/.bash_aliases "$1"

cp $HOME/.gitconfig "$1"
cp $HOME/.gitignore "$1"
cp -a $HOME/.githooks "$1"

cp $HOME/.vimrc "$1"
cp -a $HOME/.vim_runtime "$1"

rm -rf $1/.vim_runtime/.git

return 0
