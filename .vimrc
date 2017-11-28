set number
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
set incsearch

syntax enable
set background=dark

"set tabstop=4
"set softtabstop=4
"set expandtab

set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch

set foldenable
set foldnestmax=10
set foldmethod=manual
set foldlevelstart=1

"filetype plugin indent on

inoremap jk <esc>

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
"Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-buftabline'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()



colorscheme gruvbox



" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
