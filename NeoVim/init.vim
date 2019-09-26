" ----------------------------------------------------------
" Basic Setting
" ----------------------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set noswapfile

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
"set signcolumn=yes

" Set clipboard
set clipboard=unnamedplus

" Indent
set autoindent

" Line number
set nu
set cursorline

" on
syntax on
filetype plugin indent on

" Tab to space
set expandtab
set shiftwidth=4
set tabstop=4

" ----------------------------------------------------------
" Plugins
" ----------------------------------------------------------
call plug#begin('~/.vim/plugged')
" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Indent
Plug 'junegunn/vim-easy-align'

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

" Color scheme
"Plug 'rakr/vim-one'
"Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jacoborus/tender.vim'
"Plug 'sjl/badwolf'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'whatyouhide/vim-gotham'
"Plug 'tyrannicaltoucan/vim-quantum'
"Plug 'KeitaNakamura/neodark.vim'

" Scroll
Plug 'yuttie/comfortable-motion.vim'

" Markdown
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

" Code completion
Plug 'Raimondi/delimitMate'

" Search
Plug 'unblevable/quick-scope'
Plug 'junegunn/vim-slash'

" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

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
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

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
colorscheme tender
let g:airline_theme='tender'
set background=dark

" Markdown Preview
let g:mkdp_path_to_chrome = "google-chrome-beta"
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

hi Normal guibg=NONE ctermbg=NONE
