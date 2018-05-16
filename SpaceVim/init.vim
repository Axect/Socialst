"=============================================================================
" dark_powered.vim --- Dark powered mode of SpaceVim
" Copyright (c) 2016-2017 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg at 163.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================


" SpaceVim Options: {{{
let g:spacevim_realtime_leader_guide = 1
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_statusline_display_mode = 0
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:spacevim_enable_vimfiler_welcome = 1
let g:spacevim_enable_debug = 1

let g:tagbar_type_rust = {
   \ 'ctagstype' : 'rust',
   \ 'kinds' : [
       \'T:types,type definitions',
       \'f:functions,function definitions',
       \'g:enum,enumeration names',
       \'s:structure names',
       \'m:modules,module names',
       \'c:consts,static constants',
       \'t:traits',
       \'i:impls,trait implementations',
   \]
   \}
" }}}

" SpaceVim Layers: {{{
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('shell',
        \ {
        \ 'default_position' : 'bottom',
        \ 'default_height' : 30,
        \ }
        \ )
" call SpaceVim#layers#load('lsp',
"         \ {
"         \ 'filetypes' : [
"                         \ 'haskell',
"                         \ 'rust',
"                       \ ],
"         \ 'override_cmd' : {
"                          \ 'haskell' : ['hie', '--lsp'], 
"                          \ }
"         \ }
"         \ )
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#haskell')
call SpaceVim#layers#load('lang#rust')
call SpaceVim#layers#load('autocomplete')
call SpaceVim#layers#load('fzf')
call SpaceVim#layers#load('lang#html')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('lang#julia')
call SpaceVim#layers#load('ui')
call SpaceVim#layers#load('tmux')
call SpaceVim#layers#load('git')
call SpaceVim#layers#load('lang#markdown')
call SpaceVim#layers#load('lang#toml')
call SpaceVim#layers#load('lang#prolog')
" }}}

" SpaceVim Plugins: {{{
let g:spacevim_custom_plugins = [
      \['jpalardy/vim-slime'],
      \['zah/nim.vim'],
      \['tpope/vim-markdown'],
      \['meck/vim-brittany'],
      \]
let g:slime_target = "tmux"

" }}}


