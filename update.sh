DOTFILES=(
    "$HOME/.bashrc"
    "$HOME/.bash_profile"
    "$HOME/.bash_prompt"
    "$HOME/.profile"
    "$HOME/.path"
    "$HOME/.exports"
    "$HOME/.aliases"
    "$HOME/.functions"
    "$HOME/.extra"
    "$HOME/.gitconfig"
    "$HOME/.githooks/"
    "$HOME/.gitignore"
    "$HOME/.editorconfig"
)

REPO_PATH=$(dirname $BASH_SOURCE[0])
REPO_GIT_PATH="$REPO_PATH/.git"

for dotfile in "${DOTFILES[@]}"
do
    if [ -z "$dotfile" ]
    then
        cp -R "$dotfile" $REPO_PATH
    fi
done

git --git-dir="$REPO_GIT_PATH" add .
git --git-dir="$REPO_GIT_PATH" commit -m "[auto] update repository"
git --git-dir="$REPO_GIT_PATH" push origin master
