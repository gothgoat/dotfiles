" GLOBAL SETTINGS
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

set clipboard=unnamed
set number relativenumber
set hidden
set hlsearch
set incsearch
set wrap
set autoindent
set copyindent
set backspace=indent,eol,start
set ignorecase
set smartcase
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell
set noerrorbells
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set wildmode=longest,list,full
set wildmenu
set lazyredraw
set showmatch
set foldenable
set foldnestmax=10
set foldmethod=manual
set foldlevelstart=1
set pastetoggle=<F2>
set updatetime=100
set whichwrap+=<,>,h,l,[,]

"minimal vim
set noshowmode
set noruler
set laststatus=0
set noshowcmd

filetype plugin indent on

" PLUGINS
call plug#begin('~/.vim/plugged')
  Plug 'andreypopp/vim-colors-plain'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'jeetsukumaran/vim-filebeagle'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-surround'
  Plug 'w0rp/ale'
  Plug 'airblade/vim-gitgutter'
  Plug 'easymotion/vim-easymotion'
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html', 'vue'] }
  Plug 'mxw/vim-jsx'
  Plug 'elzr/vim-json'
  Plug 'posva/vim-vue'
  Plug 'mattn/emmet-vim'
  Plug 'romainl/vim-qf'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'sjl/gundo.vim'
  Plug 'michaeljsmith/vim-indent-object'
call plug#end()


let g:dracula_colorterm = 0
let g:dracula_italic = 0
syntax on
color dracula
highlight Normal ctermbg=None

if (has("termguicolors"))
 set termguicolors
endif

" PLUGIN SETTINGS
" emmet
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
" jsx
let g:jsx_ext_required = 0
" surround
let g:surround_no_mappings = 1
" fzf
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'Normal'],
\ 'hl':      ['fg', 'Comment'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Statement'],
\ 'info':    ['fg', 'PreProc'],
\ 'border':  ['fg', 'Ignore'],
\ 'prompt':  ['fg', 'Conditional'],
\ 'pointer': ['fg', 'Exception'],
\ 'marker':  ['fg', 'Keyword'],
\ 'spinner': ['fg', 'Label'],
\ 'header':  ['fg', 'Comment'] }

" AUTOCMD
autocmd BufEnter * silent! lcd %:p:h
autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType vue syntax sync fromstart
autocmd! FileType fzf

" KEYBINDS
inoremap jk <esc>
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-h> :bprevious<CR>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
nnoremap <C-c> :bp\|bd #<CR>
nnoremap <leader><space> :nohlsearch<CR>
map <leader>s :syntax sync fromstart<CR>
map <leader>b :Buffers<cr>
map <leader>' :Files<cr>
map <leader>g :GFiles<cr>
map <leader>t :Tags<cr>
imap <c-q> <plug>(fzf-complete-line)
nmap ds  <Plug>Dsurround
nmap Cs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap S   <Plug>VSurround
map <leader>l :lop 2<CR>
map <leader>c :lcl<CR>
nnoremap <leader>u :GundoToggle<CR>
