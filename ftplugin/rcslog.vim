function! s:search_revision( direction )
    let flags = 'W'
    if a:direction == 'reverse'
        let flags = 'bW'
    endif
    call search('^revision', flags )
    normal zz
endfunction

nnoremap <buffer> <nowait> ]] :call <SID>search_revision('forward')<cr>
nnoremap <buffer> <nowait> [[ :call <SID>search_revision('reverse')<cr>



