set conceallevel=1

" Julia
Plug 'JuliaEditorSupport/julia-vim'

" Slime
Plug 'jpalardy/vim-slime'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

" Vim-Latex
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview', {'for': 'tex'}

" HTML
Plug 'mattn/emmet-vim'

" Java Script
Plug 'pangloss/vim-javascript'

" Vue.js
Plug 'posva/vim-vue'

" Code Completion
Plug 'Raimondi/delimitMate'
Plug 'Shougo/neocomplete.vim'

" Tmux
Plug 'jpalardy/vim-slime'

" Focus
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Search
Plug 'unblevable/quick-scope'   
Plug 'junegunn/vim-slash'

" ETC
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-signify'
Plug 'AndrewRadev/splitjoin.vim'

" Quick Scope
let g:qs_highlight_on_keys = ['f', 'F']

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

let g:slime_target="tmux"

" Latex
let g:livepreview_previewer = 'okular'
let g:livepreview_engine = 'pdflatex'

" JS
let g:javascript_plugin_jsdoc=1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
