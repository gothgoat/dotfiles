set hidden
set number relativenumber
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<CR>

set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

set clipboard=unnamed

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
"set mouse=a

syntax enable
set background=dark
filetype plugin indent on
" show existing tab with 2 spaces width
set tabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
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
Plug 'ap/vim-buftabline'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jeetsukumaran/vim-filebeagle'
"Plug 'wincent/terminus'
Plug 'mattn/emmet-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier'
Plug 'w0rp/ale'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'



Plug 'Shougo/deoplete.nvim'

"Javascript Plugins
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx', 'typescript'] }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' , 'for': ['javascript', 'javascript.jsx', 'typescript']}

"Typescript Plugins
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])

inoremap <expr> <C-Q> deoplete#manual_complete()

let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
let g:deoplete#sources#tss#javascript_support = 1
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1

"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]


imap <c-q> <plug>(fzf-complete-line)
map <leader>b :Buffers<cr>
map <leader>' :Files<cr>
map <leader>g :GFiles<cr>
map <leader>t :Tags<cr>


colorscheme gruvbox


" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" " Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==


let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

"use c for closing current buffer only
nnoremap c :bp\|bd #<CR>


set pastetoggle=<F2>

autocmd BufEnter * silent! lcd %:p:h

"let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

hi! link jsFuncCall GruvboxFg2


autocmd FileType javascript set formatprg=prettier\ --stdin
let g:prettier#config#tab_width = 2
let g:prettier#config#print_width = 100
" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'false'
let g:prettier#config#trailing_comma = 'none'


let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

set updatetime=100



let g:surround_no_mappings = 1
nmap ds  <Plug>Dsurround
nmap Cs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap S   <Plug>VSurround






autocmd InsertEnter * :setlocal nohlsearch
