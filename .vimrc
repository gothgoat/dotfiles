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
set pastetoggle=<F2>
set updatetime=100

filetype plugin indent on
syntax enable

" PLUGINS
call plug#begin('~/.vim/plugged')
  Plug 'jeetsukumaran/vim-filebeagle'
  Plug 'ap/vim-buftabline'
  Plug 'arcticicestudio/nord-vim'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'scrooloose/nerdcommenter'
  Plug 'tpope/vim-obsession'
  Plug 'tpope/vim-surround'
  Plug 'w0rp/ale'
  Plug 'airblade/vim-gitgutter'
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
  Plug 'morhetz/gruvbox'
  Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html', 'vue'] }
  Plug 'mxw/vim-jsx'
  Plug 'elzr/vim-json'
  Plug 'posva/vim-vue'
  Plug 'mattn/emmet-vim'
  Plug 'romainl/vim-qf'
  Plug 'Shougo/deoplete.nvim'
  Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx', 'typescript'] }
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' , 'for': ['javascript', 'javascript.jsx', 'typescript']}
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Quramy/tsuquyomi', { 'do': 'npm install -g typescript' }
  Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
call plug#end()

colorscheme nord

" PLUGIN SETTINGS
" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#source('_', 'matchers', ['matcher_full_fuzzy'])
let g:deoplete#sources#tss#javascript_support = 1
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]
" tern 
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
" tsuquyomi 
let g:tsuquyomi_javascript_support = 1
let g:tsuquyomi_auto_open = 1
let g:tsuquyomi_disable_quickfix = 1
" emmet
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
" ale
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\   'vue': ['eslint'],
\}
let g:ale_open_list = 1
let g:ale_list_window_size = 2
" jsx
let g:jsx_ext_required = 0
" surround 
let g:surround_no_mappings = 1

" AUTOCMD
autocmd BufEnter * silent! lcd %:p:h
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.less.pug
autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType vue syntax sync fromstart

" KEYBINDS
inoremap jk <esc>
inoremap <expr> <C-Q> deoplete#manual_complete()
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprevious<CR>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
nnoremap c :bp\|bd #<CR>
nnoremap <leader><space> :nohlsearch<CR>
map <leader>s :syntax sync fromstart<CR>
map <leader>b :Buffers<cr>
map <leader>' :Files<cr>
map <leader>g :GFiles<cr>
map <leader>t :Tags<cr>
map <leader>a <Plug>(ale_fix)
imap <c-q> <plug>(fzf-complete-line)
nmap ds  <Plug>Dsurround
nmap Cs  <Plug>Csurround
nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap S   <Plug>VSurround
