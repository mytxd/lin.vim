#!/usr/bin/env bash

sudo echo "[lin.vim] Install for MacOS" || { echo "[lin.vim] sudo not found"; exit 1; }

# Prepare Environment
if [ -f ~/.linvimrc ]; then
    mv ~/.linvimrc ~/.linvimrc.bak
fi
touch ~/.linvimrc
touch ~/.zshrc

# Software Dependency
brew upgrade
brew install macvim zsh curl wget llvm autoconf automake cmake clang-format
brew install openssl openssh cryptopp the_silver_searcher ripgrep python3 unzip zip p7zip node
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
sudo pip3 install pyOpenSSL pep8 flake8 pylint autopep8 yapf cpplint chardet jedi

# Vim Plugin
cp ~/.vim/lin.vim ~/.vimrc
vim -c "PlugInstall" -c "qall"

# Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# User Custom
cp ~/.vim/setting-vim/user-template.vim ~/.vim/user.vim
cp ~/.vim/setting-vim/coc-settings-template.json ~/.vim/coc-settings.json

# Commands
cd ~/.vim/command
chmod +x *

# Path Variable
echo "#! /usr/bin/env bash" >> ~/.linvimrc
echo "setopt HIST_IGNORE_ALL_DUPS" >> ~/.linvimrc
echo "export LANGUAGE='en_US.UTF-8'" >> ~/.linvimrc
echo "ulimit -c unlimited" >> ~/.linvimrc
echo "defaults write com.apple.finder AppleShowAllFiles TRUE" >> ~/.linvimrc
echo "alias vim=/usr/local/bin/vim" >> ~/.linvimrc
echo "alias l=\"ls -lh\"" >> ~/.linvimrc
echo "alias ll=\"ls -lah\"" >> ~/.linvimrc
echo "export PATH=\$PATH:~/.vim/command" >> ~/.linvimrc
echo "export PATH=/usr/local/opt/universal-ctags/bin:\$PATH" >> ~/.linvimrc

echo "source ~/.linvimrc" >> ~/.zshrc
source ~/.zshrc 1>/dev/null 2>&1
