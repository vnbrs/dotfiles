DOTFILES=(
    "$HOME/.bash_aliases"
    "$HOME/.profile"
    "$HOME/.bashrc"
    "$HOME/.gitconfig"
    "$HOME/.githooks/"
    "$HOME/.gitignore"
    "$HOME/.editorconfig"
)

REPO_PATH=$(dirname $BASH_SOURCE[0])
REPO_GIT_PATH="$REPO_PATH/.git"

for dotfile in "${DOTFILES[@]}"
do
    cp -R "$dotfile" $REPO_PATH
done

git --git-dir="$REPO_GIT_PATH" add .
git --git-dir="$REPO_GIT_PATH" commit -m "[auto] update repository"
git --git-dir="$REPO_GIT_PATH" push origin master
