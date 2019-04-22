" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Change esc as default key to leave environment
inoremap jk <esc>
cnoremap jk <C-C>

"  Move through jedi with j and k
inoremap <expr> <C-j> ((pumvisible())?("\<C-n>"):("Ctrl-j"))
inoremap <expr> <C-k> ((pumvisible())?("\<C-p>"):("Ctrl-k"))

" Force me to use vim as should be used
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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
"set spell
set spelllang=en_us

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

" Exit Terminal mode
:tnoremap <Esc> <C-\><C-n>

" ----------------------------------------------------------------------------------------------------------------------
" Plugins config 
" ----------------------------------------------------------------------------------------------------------------------
" Change font

"brew tap caskroom/fonts
"brew cask install font-iosevka
set guifont=Iosevka

" Utilsnips
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<c-w>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:ultisnips_python_style = 'numpy' 

" Vimtex
let g:vimtex_latexmk_progname = 'nvr'

" Deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#max_list = 10
let g:deoplete#enable_refresh_always = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif

" Toggle spelling
nnoremap <leader>c :set invspell<CR>


" Tender theme
if has('macunix')
    if (has("termguicolors"))
        set termguicolors
    endif
endif

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
nnoremap <leader>e :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.pyc$','\.aux$', '\.log$']

" Nerdtree
nnoremap <leader>s :TagbarToggle<cr>

" Syntastic
" pip3 install flake8
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_python_exec = 'python3'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'passive_filetypes': ['tex','html','css','md', 'cpp'] }
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_python_checkers = ['flake8']


"Fix weird symbols
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

" Fuzzy search
" sudo apt install fzy
" Install https://github.com/BurntSushi/ripgrep
 nnoremap <C-p> :FuzzyOpen<CR>

" Plugins
" Need to install this before
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then to load :PlugInstall 
call plug#begin('~/.config/nvim/plugged')
" Plugins will go here in the middle.
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'lervag/vimtex'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'Shougo/neoinclude.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/goyo.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jacoborus/tender.vim'
Plug 'vim-syntastic/syntastic'
Plug 'cloudhead/neovim-fuzzy'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
call plug#end()
