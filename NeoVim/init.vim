" ------------------------------
" Basic Setting
" ------------------------------

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
set shiftwidth=2
set tabstop=2

let base16colorspace=256

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

" Enable hidden buffers
set hidden

" -------------------------------
" Plug Management
" -------------------------------
call plug#begin('~/.vim/plugged')

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" Language Section
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

" C
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'

" elixir
Plug 'elixir-lang/vim-elixir'
Plug 'carlosgaldino/elixir-snippets'

" elm
"" Elm Bundle
Plug 'elmcast/elm-vim'

" Go
"" Go Lang Bundle
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" Haskell
Plug 'enomsg/vim-haskellconcealplus'
Plug 'neovimhaskell/haskell-vim'
Plug 'vim-syntastic/syntastic'
Plug 'alx741/vim-hindent'

" Idris
Plug 'idris-hackers/idris-vim'

" Julia
Plug 'JuliaEditorSupport/julia-vim'

" LaTeX
Plug 'LaTeX-Box-Team/LaTeX-Box'

" Markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" Nim
Plug 'zah/nim.vim'

" Nix
Plug 'LnL7/vim-nix'

" Prolog
Plug 'adimit/prolog.vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
" ETC Tools
" %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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
if has('nvim')
  Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': './install.sh'
      \ }
endif

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

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git
Plug 'tpope/vim-fugitive'

" ETC
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

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
let g:mkdp_path_to_chrome = "firefox"
let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
let g:mkdp_auto_start = 1
let g:mkdp_auto_open = 1
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0

" Rust
let g:autofmt_autosave = 1
set hidden
let g:racer_cmd = "/home/kavis/.cargo/bin/racer/bin"
let g:completor_racer_binary="/home/kavis/.cargo/bin/racer"

" Prolog
au FileType perl set filetype=prolog

" Haskell & Rust
if has('nvim')
  let g:LanguageClient_serverCommands = {
      \ 'haskell': ['hie', '--lsp'],
      \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
      \ }
  let g:LanguageClient_autoStart = 1
  
  nnoremap <silent> K :call LanguageClient_textDocument_hover()
  nnoremap <silent> gd :call LanguageClient_textDocument_definition()
  nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()
endif
"""""""""""""""""""""""""""""""""
