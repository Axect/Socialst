" ------------------------------
" Basic Setting
" ------------------------------
" No swap file
set noswapfile

" Set clipboard
set clipboard=unnamedplus

" Syntax Highlighting
if has("syntax")
    syntax on
endif

" Indent
set autoindent
set cindent

" Line Number
set nu

" Highlight
set cursorline

" On
syntax on
filetype plugin indent on

" Tab to Space
set expandtab
set shiftwidth=4
set tabstop=4

let base16colorspace=256

vmap r "_dP

" -------------------------------
" Plug Management
" -------------------------------
call plug#begin('~/.vim/plugged')

" C++
Plug 'kracejic/snippetinabox.vim'

" Haskell
Plug 'enomsg/vim-haskellconcealplus'
Plug 'neovimhaskell/haskell-vim'
Plug 'vim-syntastic/syntastic'
Plug 'itchyny/vim-haskell-indent'
Plug 'mpickering/hlint-refactor-vim'
Plug 'lspitzner/brittany'

" Julia
Plug 'JuliaEditorSupport/julia-vim'

" Nim
Plug 'zah/nim.vim'

" Markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Prolog
Plug 'adimit/prolog.vim'

" Go
Plug 'fatih/vim-go'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Chapel
Plug '~/zbin/chapel-1.19.0/highlight/vim'

" Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code Completion
Plug 'maralla/completor.vim'
"Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'

" Language Server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

" ColorScheme
"Plug 'kristijanhusak/vim-hybrid-material'
"Plug 'jacoborus/tender.vim'
"Plug 'sjl/badwolf'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'whatyouhide/vim-gotham'
"Plug 'tyrannicaltoucan/vim-quantum'
"Plug 'KeitaNakamura/neodark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

" Indent
Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'

" Tmux
Plug 'jpalardy/vim-slime'

" Search
Plug 'unblevable/quick-scope'   
Plug 'junegunn/vim-slash'

" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Scroll
Plug 'yuttie/comfortable-motion.vim'

" LaTeX
Plug 'LaTeX-Box-Team/LaTeX-Box'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git
Plug 'tpope/vim-fugitive'

" ETC
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Nerdtree
Plug 'scrooloose/nerdtree'

" Buffer
Plug 'ap/vim-buftabline'

" Tagbar
Plug 'majutsushi/tagbar'

" Webapi
Plug 'mattn/webapi-vim'

call plug#end()
"""""""""""""""""""""""""""""""""

" -------------------------------
" Additional Setting
" -------------------------------

" Color
colorscheme dracula

" Airline Theme
let g:airline_theme='dracula'

" Easy Align
nmap ga <Plug>(EasyAlign)
let g:easy_align_delimiters = {
      \  ';': { 'pattern': '::', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 }
      \}

" Vim Slime
let g:slime_target="tmux"

" Quick Scope
let g:qs_highlight_on_keys = ['f', 'F']

" Comfortable Motion
let g:comfortable_motion_no_default_key_mappings = 1

" Super tab
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

" Tabularize
let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

" Markdown Preview
let g:mkdp_path_to_chrome = "google-chrome-stable"
let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
let g:mkdp_auto_start = 1
let g:mkdp_auto_open = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0

" Nerdtree
silent! nmap <F4> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"

" Rust
let g:autofmt_autosave = 1
set hidden
let g:racer_cmd = "/home/kavis/.cargo/bin/racer/bin"
let g:completor_racer_binary="/home/kavis/.cargo/bin/racer"
let g:rust_clip_command = 'xclip -selection clipboard'

" Prolog
au FileType perl set filetype=prolog

" Buftabline
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<cr>

" Tagbar
nmap <F8> :TagbarToggle<CR>
"""""""""""""""""""""""""""""""""
