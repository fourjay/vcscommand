setlocal readonly
setlocal nomodifiable

nnoremap <buffer> <nowait> d :call vcscommand#revision#diff_prior()<cr>
