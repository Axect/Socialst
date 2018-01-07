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


" -------------------------------
" Plug Management
" -------------------------------
call plug#begin('~/.vim/plugged')

" Haskell
Plug 'itchyny/vim-haskell-indent'
Plug 'enomsg/vim-haskellconcealplus'
"Plug 'neovimhaskell/haskell-vim'
Plug 'urso/haskell_syntax.vim'


" Julia
Plug 'JuliaEditorSupport/julia-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code Completion
Plug 'Raimondi/delimitMate'
Plug 'Shougo/neocomplete.vim'

" ColorScheme
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jacoborus/tender.vim'
Plug 'sjl/badwolf'
Plug 'NLKNguyen/papercolor-theme'
Plug 'whatyouhide/vim-gotham'

" Indent
Plug 'junegunn/vim-easy-align'

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

" ETC
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'AndrewRadev/splitjoin.vim'

call plug#end()
"""""""""""""""""""""""""""""""""

" -------------------------------
" Additional Setting
" -------------------------------

" Color
set background=dark
colors gotham256

" Airline Theme
let g:airline_theme='atomic'

" Easy Align
nmap ga <Plug>(EasyAlign)

" Vim Slime
let g:slime_target="tmux"

" Quick Scope
let g:qs_highlight_on_keys = ['f', 'F']

" Comfortable Motion
let g:comfortable_motion_no_default_key_mappings = 1

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"""""""""""""""""""""""""""""""""
