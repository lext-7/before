CURRENT_DIR=$(dirname $0)

install_zip () {
  sudo unzip $0 -d /Applications/
}


# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# git
brew install git
git config --global core.editor "vim"

# vim
brew install vim --override-system-vim
git clone https://github.com/lext-7/vimx.git && cd vimx && sh -x ./install.sh && rm -r vimx

# zsh
brew install zsh
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# xxf zsh theme
curl -o ~/.oh-my-zsh/themes/xxf.zsh-theme https://gist.githubusercontent.com/xfanwu/18fd7c24360c68bab884/raw/f09340ac2b0ca790b6059695de0873da8ca0c5e5/xxf.zsh-theme
sed -i '' 's/ZSH_THEME=".*"/ZSH_THEME="xxf"/' ~/.zshrc

# nginx
brew install nginx

# ssh key-gen
"$CURRENT_DIR/../ssh-keygen.sh"

# tomorrow theme
git clone https://github.com/chriskempson/tomorrow-theme.git ~/Documents/
$lastest_iterm = $(curl https://www.iterm2.com/downloads.html | sed -n 's/.*\(https:\/\/iterm2.com\/downloads\/stable\/.*.zip\).*/\1/p' | head -1)
curl -o ~/Downloads/iterm.zip $lastest_iterm 
install_zip ~/Downloads/iterm.zip

# vscode
curl -o ~/Downloads/VisualCode.zip https://go.microsoft.com/fwlink/?LinkID=620882
install_zip ~/Downloads/VisualCode.zip
# code shell install in vs code
# "$CURRENT_DIR/../softwares/vscode.sh"

# 微信、qq
# photoshop
# Balsamiq Mockups 3.app
# charlse
# dash
# clion
# cleanmymac 
# Sip
# flux
# evernote
# istat menu
# latern
# office
# leaf
# licecap
# typora
# source tree
# Skim
# sketch 
