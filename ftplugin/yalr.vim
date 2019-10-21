" ftplugin/yalr.vim
"

if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal commentstring=//\ %s
setlocal iskeyword+=@-@

setlocal comments=s1:/*,mb:*,ex:*/,s0:/*,mb:\ ,ex:*/,://

setlocal formatoptions-=t formatoptions+=croqnl

" smartindent will be overridden by indentexpr if filetype indent is on, 
" but we don't have that - yet.
" So, this is better than nothing.
setlocal smartindent nocindent
