function! nerdzzh#update_timestamps() abort
  if !filereadable(bufname('%')) || !&modified
    return
  endif

  let save_cursor = getpos('.')
  let line_range = min([10, line('$')])
  keepjumps exe '1,' . line_range . 's#^\(.\{,10}Last Modified: \).*#\1' . strftime('%A, %d %B %Y') . '#e'
  call histdel('search', -1)
  let @/ = histget('search', -1)
  call setpos('.', save_cursor)
endfunction

function! nerdzzh#diff_no_git() abort
  if !filereadable(bufname('%')) || !&modified
    return
  endif

  let l:diff_cmd = 'diff -u'
  let l:temp_name = tempname()
  execute 'silent w!' . l:temp_name
  let l:diff_result = system(l:diff_cmd . ' ' . shellescape(bufname('%')) . ' ' . shellescape(l:temp_name))
  call delete(l:temp_name)

  vertical topleft new
  setlocal buftype=nofile bufhidden=wipe nobuflisted nolist noswapfile nowrap cursorline modifiable nospell syntax=diff
  nnoremap <silent> <buffer> q :q<CR>
  call append(0, split(l:diff_result, '\n'))
  setlocal nomodifiable

  let name = '[Diff]'
  silent! execute 'f' fnameescape(name)
endfunction

function! nerdzzh#eat_nextchar(pat) abort
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunction

function! nerdzzh#exec_line() abort
  if &ft == 'lua'
    call execute(printf(":lua %s", getline(".")))
  elseif &ft == 'vim'
    exe getline(".")
  endif
endfunction

function! nerdzzh#save_and_exec() abort
  if &filetype == 'vim'
    :silent! write
    :source %
  elseif &filetype == 'lua'
    :silent! write
    :luafile %
  endif
endfunction
