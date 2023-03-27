#!/bin/sh

echo "Installing Homebrew"
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew update
echo "Installing Homebrew Packages"
brew install mas
brew tap homebrew/bundle
brew bundle

echo "Install XCode CLI Tool"
xcode-select --install

echo "Backing up existing ~/.zshrc to ~/.zshrc.old"
cp ~/.zshrc ~/.zshrc.old

echo "Installing Oh My Zsh"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
echo "source ~/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

sed -io 's/^plugins=.*/plugins=(git npm multipass minikube kubectl terraform zsh-syntax-highlighting autojump)/' ~/.zshrc
sed -io 's/^ZSH_THEME.*/ZSH_THEME="avit"/' ~/.zshrc

