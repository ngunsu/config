#!/bin/bash

# Install requirements
brew install fzy curl
brew install nodejs
brew install python3
alias python3="/usr/local/bin/python3"
brew install ag
brew install neovim
npm -g install neovim

# Install neovim
brew install neovim

# Install neovim plugins and config
mkdir -p $HOME/.config/nvim
ln -s $PWD/init.vim $HOME/.config/nvim/init.vim
ln -s $PWD/coc-settings.json $HOME/.config/nvim/coc-settings.json
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
python3 -m pip install flake8 pynvim jedi
nvim +PlugInstall +qall
ln -s $HOME/.config/nvim/plugged/tender.vim/colors $HOME/.config/nvim/colors
nvim +'CocInstall -sync coc-python' +qall
nvim +'CocInstall -sync coc-markdownlint' +qall

# Install tmux
brew install tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Install zsh
brew install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && echo 'export PATH=$PATH:~/.local/bin' >> $HOME/.zshrc

