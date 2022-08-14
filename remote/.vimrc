" Author: Will Chao <nerdzzh@gmail.com>
" Last Modified: Friday, 12 August 2022

" Pre-setup ---------------------------------------------------------------- {{{

let mapleader = ','
let maplocalleader = ';'

filetype plugin indent on
syntax enable

set encoding=utf-8
set nocompatible

" -------------------------------------------------------------------------- }}}
" Utils -------------------------------------------------------------------- {{{

" Update all occurrences of "Last Modified: " in the first 10 lines
function! s:update_timestamps() abort
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

" Show new changes after last save
function! s:diff_no_git() abort
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

" Companion function for :iabbrev <expr>
function! s:eat_nextchar(pat) abort
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunction

" -------------------------------------------------------------------------- }}}
" Fundamentals ------------------------------------------------------------- {{{

set number
set relativenumber

set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set shiftround
set autoindent
set smartindent

set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·

set backspace=indent,eol,start

set textwidth=80
set signcolumn=yes
set colorcolumn=+1
set cursorline
set laststatus=2

set termguicolors

set mouse=a
set shell=$SHELL

set hlsearch
set incsearch
set ignorecase
set smartcase

set showbreak=↪
set showcmd
set noshowmode
set modelines=1

set scrolloff=3
set sidescrolloff=10

set splitbelow
set splitright

set autoread
set autowrite

set confirm

set foldlevel=99
set foldmethod=marker
set foldmarker={,}

set updatetime=50
set virtualedit+=block

set hidden

set shortmess+=s
set shortmess+=I
set shortmess+=c

set formatoptions+=c
set formatoptions+=r
set formatoptions+=q
set formatoptions+=n
set formatoptions+=1
set formatoptions+=j

set formatoptions-=t
set formatoptions-=o
set formatoptions-=a
set formatoptions-=2

set wildmenu

set wildignore+=.git
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.obj,*.exe,*.dll
set wildignore+=*.zip,*.rar,*.7z,*.tar.gz
set wildignore+=*.deb,*.rpm,*.pkg
set wildignore+=*.spl
set wildignore+=*.sw?
set wildignore+=*.DS_Store

set backup
set noswapfile
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), 'p')
endif
if !isdirectory(expand(&backupdir))
  call mkdir(expand(&backupdir), 'p')
endif
if !isdirectory(expand(&directory))
  call mkdir(expand(&directory), 'p')
endif

" -------------------------------------------------------------------------- }}}
" Abbreviation ------------------------------------------------------------- {{{

iabbrev nz@ nerdzzh@gmail.com
iabbrev nzn Will Chao

iabbrev <expr> hworld 'Hello World!' . s:eat_nextchar('\s')
iabbrev <expr> lhost 'http://localhost:' . s:eat_nextchar('\s')

" -------------------------------------------------------------------------- }}}
" Mappings ----------------------------------------------------------------- {{{

runtime macros/matchit.vim
map <Tab> %

" Normal mode -------------------------------------------------------------- {{{

nnoremap H ^
nnoremap L $

nnoremap ;w :write<CR>
nnoremap ;q :quit<CR>
nnoremap ;u :undo 0<CR>
nnoremap ;t :edit ~/.todo<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-f> :bnext<CR>
nnoremap <C-b> :bprevious<CR>

nnoremap n nzz
nnoremap N Nzz
nnoremap <C-O> <C-O>zz

nnoremap Y y$
nnoremap J mzJ`z

nnoremap <Space> za

nnoremap =- mzggVG=`z

nnoremap ;; <C-^>

nnoremap z; zMzvzz

nnoremap \s :setlocal spell!<CR>

nnoremap <Leader>eb :edit ~/.bashrc<CR>
nnoremap <Leader>ev :edit $MYVIMRC<CR>

nnoremap <Leader>sv :source $MYVIMRC<CR>:nohlsearch<CR>

nnoremap <Leader>bd :bprevious \| bdelete #<CR>
nnoremap <Leader>sa ggVG
nnoremap <Leader>ss Vip:sort<CR>
nnoremap <Leader>sd :call <SID>diff_no_git()<CR>

nnoremap <Leader>cn :cnext<CR>zz
nnoremap <Leader>cp :cprevious<CR>zz

nnoremap <Leader>ln :lnext<CR>zz
nnoremap <Leader>lp :lprevious<CR>zz

nnoremap <Leader><Space> :nohlsearch<CR>

nnoremap <Leader><Tab> gt
nnoremap <Leader><S-Tab> gT

nnoremap <Leader>r :%s/<C-r><C-w>//g<Left><Left>

" -------------------------------------------------------------------------- }}}
" Insert mode -------------------------------------------------------------- {{{

inoremap jk <Esc>
inoremap <C-C> <Esc>

inoremap <C-l> <C-x><C-k>
inoremap <C-f> <C-x><C-f>

inoremap <C-p> <Esc>"+pV`]=`]a

" -------------------------------------------------------------------------- }}}
" Visual mode -------------------------------------------------------------- {{{

vnoremap H g^
vnoremap L g_

vnoremap > >gv
vnoremap < <gv

vnoremap <Space> za

vnoremap p "_dP

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

vnoremap ;y "+y

vnoremap <Leader>r "hy:%s/<C-r>h//g<Left><Left>

vnoremap <Leader>ss :sort<CR>

" -------------------------------------------------------------------------- }}}
" Cmdline mode ------------------------------------------------------------- {{{

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-u> <C-e><C-u>

" -------------------------------------------------------------------------- }}}
" Operator-pending mode ---------------------------------------------------- {{{

onoremap H ^
onoremap L $

onoremap q i"
onoremap o i'
onoremap b i`
onoremap p i)
onoremap u i]
onoremap r i}

" -------------------------------------------------------------------------- }}}

" -------------------------------------------------------------------------- }}}
" Autocmds ----------------------------------------------------------------- {{{

" Show trailing whitespaces only in insert mode
augroup show_trailing
  autocmd!
  autocmd InsertEnter * set listchars-=trail:·
  autocmd InsertLeave * set listchars+=trail:·
augroup END

" Clean trailing whitespaces on save
augroup clean_trailing
  autocmd!
  autocmd BufWritePre * %s/\s\+$//e | nohlsearch
augroup END

" Update timestamps on save
augroup update_timestamps
  autocmd!
  autocmd BufWritePre * silent call s:update_timestamps()
augroup END

" Resize splits when Vim is resized
augroup resize_splits
  autocmd!
  autocmd VimResized * wincmd =
augroup END

" Return to the same location when a file is reopened
augroup same_loc_reopen
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
augroup END

" -------------------------------------------------------------------------- }}}
" Filetype overrides ------------------------------------------------------- {{{

augroup vim_overrides
  autocmd!
  autocmd FileType vim setlocal foldmarker={{{,}}}
augroup END

augroup qf_overrides
  autocmd!
  autocmd FileType qf setlocal tw=0 cc=0 nonu nornu nocul nolist nowrap
augroup END

augroup quit_with_q
  autocmd!
  autocmd FileType help,qf,man nnoremap <buffer><silent> q :quit<CR>
augroup END

" -------------------------------------------------------------------------- }}}

" vim: set fdl=0 sw=2
