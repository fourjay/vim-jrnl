function! jrnl#fold(lnum) abort
    if getline(a:lnum) =~? '\v^\[\d{4}-'
        return '>1'
    else
        return '1'
    endif
endfunction

