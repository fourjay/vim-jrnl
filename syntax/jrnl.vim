if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

syn case ignore

syntax match jrnlDate '^\[*[0-9 :-]\+\]*'
syntax match jrnlTag '[!#<>@][a-zA-Z0-9+]\+'


hi def link jrnlDate Identifier
hi def link jrnlTag Special


let b:current_syntax = 'jrnl'
