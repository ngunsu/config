#!/bin/bash

# Install requirements
sudo apt update
sudo apt install -y curl fzy python3-pip silversearcher-ag
sudo snap install node --classic
sudo npm -g install neovim
sudo apt install -y ruby-dev
sudo gem install neovim

# Install neovim
sudo snap install nvim --classic

# Install neovim plugins and config
mkdir -p $HOME/.config/nvim
ln -s $PWD/init.vim $HOME/.config/nvim/init.vim
ln -s $PWD/coc-settings.json $HOME/.config/nvim/coc-settings.json
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
python3 -m pip install flake8 pynvim jedi
# Install fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts
chmod +x install.sh
./install.sh
cd ..
rm nerd-fonts
# Install Plugs
nvim +PlugInstall +qall
ln -s $HOME/.config/nvim/plugged/tender.vim/colors $HOME/.config/nvim/colors
nvim +'CocInstall -sync coc-python' +qall
nvim +'CocInstall -sync coc-markdownlint' +qall

# Install tmux
sudo apt install tmux
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# Install zsh
sudo apt install -y zsh
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && echo 'export PATH=$PATH:~/.local/bin' >> $HOME/.zshrc

