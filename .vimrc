set hidden
set number
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<CR>



set wrap
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell           " don't beep
set noerrorbells         " don't beep


filetype plugin indent on
syntax enable
set background=dark

set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set showcmd
set cursorline
set wildmode=longest,list,full
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
Plug 'bling/vim-airline'
Plug 'ap/vim-buftabline'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'tpope/vim-vinegar'
Plug 'jeetsukumaran/vim-filebeagle'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

imap <c-x><c-o> <plug>(fzf-complete-line)
map <leader>b :Buffers<cr>
map <leader>f :Files<cr>
map <leader>g :GFiles<cr>
map <leader>t :Tags<cr>


colorscheme gruvbox


" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"nnoremap <Tab> :bnext<CR>
"nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==


let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

"use c for closing current buffer only
nnoremap c :bp\|bd #<CR>

set pastetoggle=<F2>

augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
    noremap <buffer> c :bd<CR>
endfunction


autocmd BufEnter * silent! lcd %:p:h

