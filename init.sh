#!/bin/sh

echo "Installing Homebrew"
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
echo "Installing Homebrew Packages"
brew tap homebrew/bundle
brew bundle

echo "Install XCode CLI Tool"
xcode-select --install

echo "Installing Oh My Zsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
echo "source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

sed -io 's/^plugins=.*/plugins=(autojump git zsh-autosuggestions node osx xcode docker)/' ~/.zshrc
sed -io 's/^ZSH_THEME.*/ZSH_THEME="avit"/' ~/.zshrc

