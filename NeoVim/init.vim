" ----------------------------------------------------------
" Basic Setting
" ----------------------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set noswapfile
set mouse=a

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
"set signcolumn=yes

" Natural split
set splitbelow
set splitright

" Set clipboard
set clipboard=unnamedplus

" Set unicode
"set tenc=korea
set enc=utf-8
set fileencodings=utf-8,euc-kr

" Indent
set autoindent

" Line number
set nu
set cursorline

" on
filetype plugin indent on
syntax enable

" Tab to space
set expandtab
set shiftwidth=4
set tabstop=4

" Tab in json
autocmd FileType json setlocal shiftwidth=2 tabstop=2 expandtab

" Conceal
set conceallevel=2

" Fold
"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
"autocmd FileType * setlocal foldmethod=expr
"autocmd FileType rust setlocal foldmethod=indent

" ----------------------------------------------------------
" Plugins
" ----------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Indent
"Plug 'junegunn/vim-easy-align'

" Nerdtree
Plug 'scrooloose/nerdtree'

" Buffer
Plug 'ap/vim-buftabline'

" Git
Plug 'tpope/vim-fugitive'

" Tmux
Plug 'jpalardy/vim-slime'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Julia
Plug 'JuliaEditorSupport/julia-vim'

" Color scheme
Plug 'rakr/vim-one'
"Plug 'kristijanhusak/vim-hybrid-material'
"Plug 'jacoborus/tender.vim'
"Plug 'sjl/badwolf'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'whatyouhide/vim-gotham'
"Plug 'tyrannicaltoucan/vim-quantum'
"Plug 'KeitaNakamura/neodark.vim'
"Plug 'endel/vim-github-colorscheme'
"Plug 'junegunn/seoul256.vim'

" Scroll
Plug 'yuttie/comfortable-motion.vim'

" Markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" Code completion
Plug 'Raimondi/delimitMate'

" Search
Plug 'unblevable/quick-scope'
Plug 'junegunn/vim-slash'

" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Latex
"Plug 'lervag/vimtex'

" Snippets
" Plug 'SirVer/ultisnips'

" Startify
Plug 'mhinz/vim-startify'

" Zig
Plug 'ziglang/zig.vim'

" Toml
Plug 'cespare/vim-toml'

" Note
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'

" Chapel
Plug 'fsouza/chapel.vim'

" Nim
Plug 'zah/nim.vim'

" Capnproto
Plug 'cstrahan/vim-capnp'

" V
Plug 'ollykel/v-vim'

" lalrpop
Plug 'qnighy/lalrpop.vim'

" pest
Plug 'pest-parser/pest.vim'

" Tree-sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Haskell
"Plug 'enomsg/vim-haskellconcealplus'
"Plug 'neovimhaskell/haskell-vim'
"Plug 'vim-syntastic/syntastic'
"Plug 'itchyny/vim-haskell-indent'
"Plug 'mpickering/hlint-refactor-vim'
"Plug 'lspitzner/brittany'

" Vimspector
Plug 'puremourning/vimspector'

" Copilot
"Plug 'github/copilot.vim'

"" CommentBox
Plug 'LudoPinelli/comment-box.nvim'

" vsnip
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" KDL
Plug 'imsnif/kdl.vim'

" Typst
Plug 'kaarmu/typst.vim'
"Plug 'SeniorMars/typst.nvim'

" Wakatime stat
Plug 'wakatime/vim-wakatime'

" Typora
Plug 'wookayin/vim-typora'

" Rust
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'

" Avante
" Deps
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'

" Optional deps
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-tree/nvim-web-devicons' "or Plug 'echasnovski/mini.icons'
Plug 'HakonHarnes/img-clip.nvim'
Plug 'zbirenbaum/copilot.lua'

" Yay, pass source=true if you want to build from source
Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

call plug#end()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Quick Scope
let g:qs_highlight_on_keys = ['f', 'F']

" Comfortable Motion
let g:comfortable_motion_no_default_key_mappings = 1

" Color scheme
let g:airline_theme='one'
"let g:seoul256_background=253
"colo seoul256-light
let g:airline_powerline_fonts = 1
let g:one_allow_italics = 1
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors
colorscheme one

" Markdown Preview
let g:mkdp_auto_start = 0
let g:mkdp_auto_open = 1
let g:mkdp_auto_close = 1
let g:mkdp_browser = 'firefox-developer-edition'
nmap <C-p> <Plug>MarkdownPreviewToggle

" Nerdtree
silent! nmap <F4> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"

" Buftabline
:nnoremap <C-Right> :bnext<CR>
:nnoremap <C-Left> :bprev<cr>
:nnoremap <C-D> :bdelete!<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Terminal
nmap <C-T> :terminal<CR>
:tnoremap <A-t> <C-\><C-n>
:tnoremap <A-Left> <C-\><C-n><C-w>h
:tnoremap <A-Down> <C-\><C-n><C-w>j
:tnoremap <A-Up> <C-\><C-n><C-w>k
:tnoremap <A-Right> <C-\><C-n><C-w>l

" Move
:nnoremap <A-Left> <C-w>h
:nnoremap <A-Down> <C-w>j
:nnoremap <A-Up> <C-w>k
:nnoremap <A-Right> <C-w>l

" File Explorer
nmap <space>e :CocCommand explorer<CR>

hi Normal guibg=NONE ctermbg=NONE

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Julia
let g:latex_to_unicode_file_types='$^'
let g:latex_to_unicode_file_types_blacklist = '.*'

" Copilot
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" vsnip setting
imap <expr> <C-k>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-k>'
smap <expr> <C-k>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-k>'

" Fold setting
autocmd BufReadPost,FileReadPost * normal zR

" Vim slime
let g:slime_target = "zellij"

" Vimtex
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" Avante
autocmd! User avante.nvim lua << EOF
require('avante').setup()
EOF
