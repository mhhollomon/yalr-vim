" syntax/yalr.vim

if exists("b:current_syntax")
    finish
endif

syntax keyword yalrKeywords
    \ term skip verbatim
    \ rule goal option
    \ @prec @assoc
    \ associativity
    \ termset
    \ precedence


syntax case match

"
" Handle comments
"
syntax region yalrSlashComment start="//" end="$"
syntax region yalrBlockComment start="/\*" end="\*/"

" The type strings for terminals and rules. Need to handle
" the fact that templates may be used in the type itself
" <std::map<std::string, std::map<std::string, int>>>
"
syntax region yalrTypeString matchgroup=yalrTypeString start="<" end=">" contains=yalrTypeString

"
" Action strings. At some point we would want to hand
" control over the c++ file type. But thats above my
" level of vim wizardry at the moment..
"
syntax keyword yalrLexeme    contained lexeme
syntax region  yalrActionString start="<%{" end="}%>" contains=yalrActionVar,yalrLexeme
syntax match   yalrActionVar contained "_v[0-9][0-9]*"

highlight default link yalrKeywords Keyword
highlight default link yalrSlashComment Comment
highlight default link yalrBlockComment Comment
highlight default link yalrTypeString Type
"
" These three are debatable. I'm open to suggestions.
"
highlight default link yalrLexeme Type
highlight default link yalrActionVar Type
highlight default link yalrActionString Statement

syntax sync minlines=500

let b:current_syntax="yalr"
