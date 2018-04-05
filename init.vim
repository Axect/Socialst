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

let base16colorspace=256

" -------------------------------
" Plug Management
" -------------------------------
call plug#begin('~/.vim/plugged')

" Haskell
Plug 'enomsg/vim-haskellconcealplus'
Plug 'neovimhaskell/haskell-vim'
Plug 'vim-syntastic/syntastic'
" -- Require : Haskell-IDE-Engine
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': './install.sh'
    \ }
" -- Require : Brittany
Plug 'sbdchd/neoformat'
Plug 'itchyny/vim-haskell-indent'

" Julia
Plug 'JuliaEditorSupport/julia-vim'

" Python
Plug 'vim-scripts/indentpython.vim'

" Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Code Completion
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" ColorScheme
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jacoborus/tender.vim'
Plug 'sjl/badwolf'
Plug 'NLKNguyen/papercolor-theme'
Plug 'whatyouhide/vim-gotham'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'KeitaNakamura/neodark.vim'

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

call plug#end()
"""""""""""""""""""""""""""""""""

" -------------------------------
" Additional Setting
" -------------------------------

" Color
colorscheme neodark

" Neodark
let g:neodark#terminal_transparent = 1 " default: 0
let g:neodark#use_256color = 1

" Airline Theme
let g:airline_theme='neodark'

" Easy Align
nmap ga <Plug>(EasyAlign)

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

" HIE
let g:LanguageClient_serverCommands = {
	\ 'haskell': ['hie', '--lsp']
	\ }

" Deoplete
let g:deoplete#enable_at_startup = 1
"""""""""""""""""""""""""""""""""
