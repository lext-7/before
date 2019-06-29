
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

mkdir -p ~/bin

curl -L git.io/antigen > ~/bin/antigen.zsh

echo 'antigen use oh-my-zsh' >>> ~/.zshrc
echo 'antigen bundle zsh-users/zsh-syntax-highlighting' >> ~/.zshrc
echo 'antigen bundle zsh-users/zsh-completions' >> ~/.zshrc
echo 'antigen bundle zsh-users/zsh-autosuggestions' >> ~/.zshrc
echo 'antigen bundle git' >> ~/.zshrc
echo 'antigen bundle extract' >> ~/.zshrc
echo 'antigen bundle wting/autojump' >> ~/.zshrc
echo 'antigen bundle walesmd/caniuse.plugin.zsh' >> ~/.zshrc
echo 'antigen bundle voronkovich/gitignore.plugin.zsh' >> ~/.zshrc

curl -o ~/.oh-my-zsh/themes/xxf.zsh-theme https://gist.githubusercontent.com/xfanwu/18fd7c24360c68bab884/raw/f09340ac2b0ca790b6059695de0873da8ca0c5e5/xxf.zsh-theme
echo 'antigen theme xxf' >> ~/.zshrc

boxname=""

read -p "set your box name for zsh: " boxname

if [ -n "$boxname" ]; then
    echo "$boxname" > ~/.box-name
fi
