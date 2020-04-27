function! encpipe#encrypt() abort
  let l:path = expand("<afile>")

  let l:lines = getline(1, '$')

  if !&binary && &eol
    let l:lines = l:lines + ['']
  endif

  call s:run(["-o", l:path, "-e"], l:lines)
  let &modified=0
endfunction

function! encpipe#decrypt() abort
  let l:path = expand("<afile>")

  if !filereadable(l:path)
    " New file, nothing to do
    return
  endif

  let l:lines = s:run(["-i", l:path, "-d"], [])

  if len(l:lines) > 0
    call setline(1, l:lines[0])
    call append(line('$'), l:lines[1:-1])
  end
endfunction

function! s:run(args, input) abort
  let l:encpipe = get(g:, 'encpipe#path', 'encpipe')

  if !executable(l:encpipe)
    throw "Encpipe: no binary found"
  endif

  let l:pass = s:get_pass()
  if l:pass == ""
    throw "Encpipe: Empty password"
  endif

  let l:lines = systemlist([l:encpipe, "-p", l:pass] + a:args, a:input)

  if v:shell_error != 0
    echoerr "Cannot load file"
    for l:e in l:lines
      echoerr l:e
    endfor

    throw "Encpipe: runtime error"
  endif

  return l:lines
endfunction

function! s:get_pass() abort
  if !exists('b:encpipe_password')
    let b:encpipe_password = inputsecret("pass> ")
  endif
  return b:encpipe_password
endfunction
