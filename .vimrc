set hidden
set number
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<CR>



set nowrap
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep


syntax enable
set background=dark

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

set showcmd
set cursorline
set wildmenu
set lazyredraw
set showmatch

set foldenable
set foldnestmax=10
set foldmethod=manual
set foldlevelstart=1


inoremap jk <esc>

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'ap/vim-buftabline'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'easymotion/vim-easymotion'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()



colorscheme gruvbox



" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'


autocmd BufEnter * lcd %:p:h



function NerdFocus()
  :NERDTreeFind
  wincmd p
endfunction  

function NerdToggleFocus()
  :NERDTreeToggle
  wincmd p
endfunction  

map <leader>; :call NerdFocus()<cr>
map <leader>' :call NerdToggleFocus()<cr>


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==




let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

filetype plugin indent on
syntax enable


