" Vim filetype plugin.
"
" Only do this when not done yet for this buffer
if exists('b:did_ftplugin') | finish | endif

" Don't load another filetype plugin for this buffer
let b:did_ftplugin = 1

" Allow use of line continuation.
let s:save_cpo = &cpoptions
set cpoptions&vim

function JrnlTags(findstart, base)
    if a:findstart
        " locate the start of the word
        let line = getline('.')
        let start = col('.') - 1
        while start > 0 && line[start - 1] =~ '\a'
            let start -= 1
        endwhile
        return start
    else
        let result = []
        let l:tags_raw = systemlist('jrnl --tags')
        let l:tags = map(l:tags_raw, {key, val -> substitute(val, ' .*', '', '') } )
        let l:matches = filter(l:tags, 'v:val =~ a:base')
        return l:matches
    endif
endfun
setlocal completefunc=JrnlTags

let &cpoptions = s:save_cpo
