if !exists("g:eunit_command")
  let s:cmd = "rebar eunit suites={suites} tests={tests}"
  let g:eunit_command = "!clear && echo " . s:cmd . " && " . s:cmd
endif

function! s:SearchFunction(linenum)
  if a:linenum == 0
    return 0
  endif

  let l:match = matchstr(getline(a:linenum), "^[a-z]")
  if empty(l:match)
    return s:SearchFunction(a:linenum - 1)
  else
    return split(getline(a:linenum), "(")[0]
  endif
endfunction

function! s:SuiteName()
  return split(expand('%:t'), "\\.")[0]
endfunction

function! s:TestName()
  return s:SearchFunction(line('.'))
endfunction

function! EunitTestAll()
  call s:RunEunitCommand('', '')
endfunction

function! EunitCurrentFile()
  call s:RunEunitCommand(s:SuiteName(), '')
endfunction

function! EunitTestNearest()
  call s:RunEunitCommand(s:SuiteName(), s:TestName())
endfunction

function! EunitLastCommand()
  if exists("g:last_eunit_command")
    execute g:last_eunit_command
  endif
endfunction

function! s:RunEunitCommand(suite, test)
  let s:cmd = substitute(g:eunit_command, "{suites}", a:suite, "g")
  let s:cmd = substitute(s:cmd, "{tests}", a:test, "g")
  execute s:cmd
  let g:last_eunit_command = s:cmd
endfunction
