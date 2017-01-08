" Map the leader key to SPACE
let mapleader="\<SPACE>"

" ----------------------------------------------------------------------------------------------------------------------
" Editor
" ----------------------------------------------------------------------------------------------------------------------

set number " Show line numbers
set showcmd " Show command line
set showmode " Show current mode
set ruler " Show the line and column number of the cursor
set background=dark " Set dark background
set expandtab " Insert spaces when tab is pressed
set tabstop=4 " Each tabe is equivalent to 4 spaces 
set shiftwidth=4
" Language
set spell
set spelllang=en_us

" Vertical line at column 120
":set colorcolumn=+1        " highlight column after 'textwidth'
":set colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'
":highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
":set colorcolumn=121

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" ----------------------------------------------------------------------------------------------------------------------
" Plugins config 
" ----------------------------------------------------------------------------------------------------------------------
" youcompleteme
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" Tender theme
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
colorscheme tender

" set airline theme
let g:airline_theme = 'tender'

" Goyo
let g:goyo_width = 120
let g:goyo_height = 95
let g:goyo_linenr = 1

" Nerdtree
nnoremap <leader><Tab> :NERDTreeToggle<cr>

" Plugins
" Need to install this before
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then to load :PlugInstall 
call plug#begin('~/.config/nvim/plugged')
" Plugins will go here in the middle.
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'lervag/vimtex'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jacoborus/tender.vim'
call plug#end()
