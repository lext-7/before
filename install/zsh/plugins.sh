
CURRENT_DIR=$(cd "$(dirname "$0")"; pwd)

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir -p ~/bin

curl -L git.io/antigen > ~/bin/antigen.zsh

curl -o ~/.oh-my-zsh/themes/xxf.zsh-theme https://gist.githubusercontent.com/xfanwu/18fd7c24360c68bab884/raw/f09340ac2b0ca790b6059695de0873da8ca0c5e5/xxf.zsh-theme

cat $CURRENT_DIR/zshrc >> ~/.zshrc

boxname=""

read -p "set your box name for zsh: " boxname

if [ -n "$boxname" ]; then
    echo "$boxname" > ~/.box-name
fi
