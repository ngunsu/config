" Map the leader key to SPACE
let mapleader="\<SPACE>"
    
" Editor
set number " Show line numbers
set showcmd " Show command line
set showmode " Show current mode
set ruler " Show the line and column number of the cursor
set background=dark " Set dark background

set expandtab " Insert spaces when tab is pressed
set tabstop=4 " Each tabe is equivalent to 4 spaces 
set shiftwidth=4

" Term mode keys
:tnoremap <Esc> <C-\><C-n>
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l


" Plugins
" Need to install this before
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then to load :PlugInstall 
call plug#begin('~/.config/nvim/plugged')
" Plugins will go here in the middle.
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'lervag/vimtex'
call plug#end()
