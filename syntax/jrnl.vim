if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

syn case ignore

syntax match jrnlDate '^\[*[0-9 :-]\+\]*'
syntax match jrnlTag '[!#<>@][a-zA-Z0-9+]\+'


if !exists('did_jrnl_syntax_inits')
    let did_jrnl_syntax_inits = 1

    hi def link jrnlDate Identifier
    hi def link jrnlTag Special
endif


let b:current_syntax = 'jrnl'
