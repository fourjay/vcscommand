" do math on dotted revisions i.e. 
function! vcscommand#revision#math(revision, interval)
    let parts = split( a:revision, '\.')
    let minor = parts[1]
    let minor += a:interval
    return parts[0] . "." . minor
endfunction

function! vcscommand#revision#get_line(line_number)
    let line = getline(a:line_number)
    if line =~ '^revision'
        return substitute(line, "^revision ", "", "")
    elseif line =~ '^[0-9.]\+ '
        return substitute( line, ' .*', '', '')
    else
        return ''
    endif
endfunction

function! vcscommand#revision#get()
    " try line first
    let result = vcscommand#revision#get_line( line('.') )
    if ! result
        let bottom = line('.') - 2
        let top = line('.') + 1
        for i in range( bottom, top)
            let result = vcscommand#revision#get_line(i)
            if result
                break
            endif
        endfor
    endif
    return result
endfunction

function! vcscommand#revision#diff_prior()
    let revision = vcscommand#revision#get()
    if ! revision
        return
    endif
    " let prior = <SID>revision_math(revision, -1)
    let prior = vcscommand#revision#math(revision, -1)
    normal q
    execute 'VCSVimDiff ' .  revision . ' ' . prior
endfunction
