" syntax/yalr.vim

syntax keyword yalrKeywords
    \ term skip verbatim
    \ rule goal option
    \ @prec @assoc
    \ associativity
    \ termset
    \ precedence

if exists("b:current_syntax")
    finish
endif

syntax case match

syntax region yalrSlashComment start="//" end="$"
"
" I don't think this is enough because you can have
" embeded brackets. <std::map<std::string, int>>
syntax region yalrTypeString start="<" end=">"

syntax keyword yalrLexeme    contained lexeme
syntax region  yalrActionString start="<%{" end="}%>" contains=yalrActionVar,yalrLexeme
syntax match   yalrActionVar contained "_v[0-9][0-9]*"

highlight default link yalrKeywords Keyword
highlight default link yalrSlashComment Comment
highlight default link yalrTypeString Type
highlight default link yalrActionVar Type
highlight default link yalrLexeme Type
highlight default link yalrActionString Statement

syntax sync minlines=500

let b:current_syntax="yalr"
