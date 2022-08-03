" Author: Will Chao <nerdzzh@gmail.com>
" Last Modified: Wednesday, 03 August 2022

let mapleader      = ','
let maplocalleader = ';'

filetype plugin indent on
syntax enable

" Basic Configurations --------------------- {{{

" Backups ------------------ {{{

set backup
set noswapfile
set undodir=~/.vim/tmp/undo//

if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), 'p')
endif

" }}}
" Highlight spell ---------- {{{
" Default spell highlighting does not look clear enough.

hi clear SpellBad
hi SpellBad ctermfg=red ctermbg=NONE cterm=bold,underline guifg=red guibg=NONE gui=bold,underline
hi clear SpellCap
hi link SpellCap SpellBad
hi clear SpellLocal
hi link SpellLocal SpellBad
hi clear SpellRare
hi link SpellRare SpellBad

" }}}
" Line return -------------- {{{
" Make sure Vim returns to the same line when you reopen a file.

aug line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \     exe 'norm! g`"zvzz' |
                \ endif
aug end

" }}}
" Resize ------------------- {{{
" Resize splits when window is resized.

aug resized
    au!
    au VimResized * :wincmd =
aug end

" }}}
" Show diff ---------------- {{{
" Show current unsaved changes.

function! ShowDiff() abort
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

nnoremap <silent> <Leader>sd :call ShowDiff()<CR>

" }}}
" Timestamps --------------- {{{
" Update timestamps upon saving if there are any.

fu! s:UpdateTimestamps()
    if &modified
        let save_cursor = getpos('.')
        let line_range = min([10, line('$')])
        keepjumps exe '1,'.line_range.'s#^\(.\{,10}Last Modified: \).*#\1'.strftime('%A, %d %B %Y').'#e'
        call histdel('search', -1)
        let @/ = histget('search', -1)
        call setpos('.', save_cursor)
    endif
endfu

aug timestamp
    au!
    au BufWritePre * silent call <SID>UpdateTimestamps()
aug end

" }}}
" Trailing whitespace ------ {{{
" Only shown when not in insert mode so I don't go insane.

aug trailing
    au!
    au InsertEnter * :set listchars-=trail:·
    au InsertLeave * :set listchars+=trail:·
aug end

" }}}
" Wildmenu ----------------- {{{

set wildmenu

set wildignore+=.git                           " version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.obj,*.exe,*.dll              " compiled object files
set wildignore+=*.zip,*.rar,*.7z,*.tar.gz      " compressed files
set wildignore+=*.deb,*.rpm,*.pkg              " package files
set wildignore+=*.spl                          " compiled spelling word lists
set wildignore+=*.sw?                          " swap files
set wildignore+=*.DS_Store                     " mac bullshit

" }}}

set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set colorcolumn=+1
set complete=.,w,b,u,t
set cursorline
set encoding=utf-8
set expandtab
set foldlevelstart=0
set formatoptions=qrn1jc
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set modelines=0
set mouse=a
set noshowmode
set number
set relativenumber
set scrolloff=3
set shiftwidth=4
set shortmess+=Ics
set showbreak=↪
set showcmd
set sidescroll=1
set sidescrolloff=10
set smartcase
set softtabstop=4
set splitbelow
set splitright
set tabstop=4
set termguicolors
set textwidth=80
set updatetime=50
set virtualedit+=block
set visualbell t_vb=
set wrap

" }}}
" Abbreviation ----------------------------- {{{

function! EatChar(pat)
    let c = nr2char(getchar(0))
    return (c =~ a:pat) ? '' : c
endfunction

iab nz@ nerdzzh@gmail.com
iab nzn Will Chao

iab waht what
iab teh  the
iab tehn then

iab <expr> hworld 'Hello World!'.EatChar('\s')
iab <expr> lhost 'http://localhost:'.EatChar('\s')

" }}}
" Mappings --------------------------------- {{{

runtime macros/matchit.vim
map <Tab> %

" Normal mode -------------- {{{

nnoremap H ^
nnoremap L $

nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <C-O> <C-O>zzzv
nnoremap <C-[> <C-I>zzzv
nnoremap <C-]> <C-]>zzzv

nnoremap <Leader>eb :e ~/.bashrc<CR>
nnoremap <Leader>ev :e $MYVIMRC<CR>

nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>:noh<CR>

nnoremap Y y$
nnoremap J mzJ`z

nnoremap ;w :w<CR>
nnoremap ;q :q<CR>
nnoremap ;; <C-^>
nnoremap ;y "+y
nnoremap ;u :u0<CR>
nnoremap ;t :e ~/.todo<CR>

" Cycle through buffers
nnoremap <C-F> :bn<CR>
nnoremap <C-B> :bp<CR>

" Delete current buffer and return to last one
nnoremap <Leader>bd :bp\|bd #<CR>

" Linewisely select entire buffer
nnoremap <Leader>sa ggVG

" Sort lines
nnoremap <Leader>ss Vip:sort<CR>

" Stop highlighting matches
nnoremap <silent> <Leader><Space> :noh<CR>:call clearmatches()<CR>

" Clean trailing whitespaces
nnoremap <silent> <Leader>W mz:let _s=@/<CR>:%s/\s\+$//e<CR>:noh<CR>:let @/=_s<CR>`z

" Reindent entire buffer
nnoremap =- mzggVG=`z

" Close all folds except current one
nnoremap z; zMzvzz

" Kill
nnoremap K :q<CR>

" Man
nnoremap M K

" Format current line
nnoremap \q gqq

" Spell
nnoremap \s :setl spell!<CR>

" Toggle folds
nnoremap <Space> za

" Quickfix list navigation
nnoremap <Leader>cn :cn<CR>zzzv
nnoremap <Leader>cp :cp<CR>zzzv

" Next / Prev tab
nnoremap <Leader><Tab> gt
nnoremap <Leader><S-Tab> gT

" }}}
" Insert mode -------------- {{{

" Exit insert mode
inoremap jk <Esc>
inoremap <C-C> <Esc>

" Look up dictionary
inoremap <C-L> <C-X><C-K>

" Complete filename (by pure Vim)
inoremap <C-F> <C-X><C-F>

" Paste from system clipboard
inoremap <C-P> <Esc>"+pa

" }}}
" Visual mode -------------- {{{

" Copy to system clipboard
vnoremap ;y "+y

" Sort lines
vnoremap <Leader>ss :sort<CR>

" Paste without meddling with regs
vnoremap p "_dP

" To the first or last non-blank character of the line
vnoremap H g^
vnoremap L g_

" Space to toggle folds
vnoremap <Space> za

" Solve delay when exiting visual mode
vnoremap <Esc> <C-C>

" Move blocks upward and downward
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Re-select after indenting
vnoremap < <gv
vnoremap > >gv

" Search for selected text
vnoremap // :<C-U>let _s=@"<CR>gvy/\m<C-R>=escape(@",'/\')<CR><CR>:let @"=_s<CR>zzzv

" Replace selected text globally
vnoremap <Leader>r y:%s/<C-R>"//g<Left><Left>

" Format selected lines
vnoremap \q gq

" }}}
" Cmdline mode ------------- {{{

cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>
cnoremap <C-B> <Left>
cnoremap <C-U> <C-E><C-U>

" }}}

" }}}
" Movements -------------------------------- {{{

" Move to the beginning/end of line
onoremap H ^
onoremap L $

" Inside [p]arentheses
onoremap p i(

" Inside double [q]uotes
onoremap q i"

" Inside single qu[o]tes
onoremap o i'

" Inside sq[u]are brackets
onoremap u i[

" Inside [b]ack ticks
onoremap b i`

" Inside cu[r]ly braces
onoremap r i{

" }}}
" FileType-specific Settings --------------- {{{

" C ------------------------ {{{

aug ft_c
    au!
    au FileType c,cpp setl softtabstop=4 shiftwidth=4 foldmethod=marker foldmarker={,}

    " Use ";s" to add semicolon to eol
    au FileType c,cpp nnoremap <buffer> <LocalLeader>s A;<Esc>
aug end

" }}}
" CSS ---------------------- {{{

aug ft_css
    au!
    au FileType css,scss setl softtabstop=2 shiftwidth=2 foldmethod=marker foldmarker={,}

    " Use ";s" to add semicolon to eol
    au FileType css,scss nnoremap <buffer> <LocalLeader>s A;<Esc>

    " Use ";f" to format properties
    au FileType css,scss nnoremap <buffer> <LocalLeader>f :let _s=@"<CR>?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>:let @"=_s<CR>
aug end

" }}}
" HTML --------------------- {{{

aug ft_html
    au!
    au FileType html,xml setl softtabstop=2 shiftwidth=2 foldmethod=manual

    " Use ";f" to fold current tag
    au FileType html,xml nnoremap <buffer> <LocalLeader>f Vatzf

    " Use ";i" to indent current tag
    au FileType html,xml nnoremap <buffer> <LocalLeader>i Vat=
aug end

" }}}
" JavaScript --------------- {{{

aug ft_javascript
    au!
    au FileType javascript setl softtabstop=2 shiftwidth=2 foldmethod=marker foldmarker={,}

    " Use ";f" to add JSDoc-like function description
    au FileType javascript nnoremap <buffer> <LocalLeader>f :JsDoc<CR>

    " Use ";s" to add semicolon to eol
    au FileType javascript nnoremap <buffer> <LocalLeader>s A;<Esc>
aug end

" }}}
" Lua ---------------------- {{{

aug ft_lua
    au!
    au FileType lua setl softtabstop=2 shiftwidth=2 comments=s:--[[,m:\ ,e:]],:--
aug end

" }}}
" Make --------------------- {{{

aug ft_make
    au!
    au FileType make setl softtabstop=2 shiftwidth=2
aug end

" }}}
" Markdown ----------------- {{{

aug ft_markdown
    au!
    au FileType markdown setl softtabstop=2 shiftwidth=2 formatoptions+=B

    au FileType markdown inorea <buffer> h1 #
    au FileType markdown inorea <buffer> h2 ##
    au FileType markdown inorea <buffer> h3 ###
    au FileType markdown inorea <buffer> h4 ####
    au FileType markdown inorea <buffer> h5 #####
    au FileType markdown inorea <buffer> h6 ######

    " Use ";t" to generate toc
    au FileType markdown nnoremap <buffer> <LocalLeader>t :GenTocGFM<CR>

    " Use ";s" to make bold([s]trong)
    au FileType markdown nnoremap <buffer> <LocalLeader>s mzviw<Esc>a**<Esc>hbi**<Esc>`z
    au FileType markdown vnoremap <buffer> <LocalLeader>s <Esc>`>a**<Esc>`<i**<Esc>`>

    " Use ";i" to [i]talicize
    au FileType markdown nnoremap <buffer> <LocalLeader>i mzviw<Esc>a_<Esc>bi_<Esc>`z
    au FileType markdown vnoremap <buffer> <LocalLeader>i <Esc>`>a_<Esc>`<i_<Esc>`>

    " Use ";d" to strike out([d]elete)
    au FileType markdown nnoremap <buffer> <LocalLeader>d mzviw<Esc>a~~<Esc>hbi~~<Esc>`z
    au FileType markdown vnoremap <buffer> <LocalLeader>d <Esc>`>a~~<Esc>`<i~~<Esc>`>
aug end

" }}}
" Python ------------------- {{{

aug ft_python
    au!
    au FileType python setl softtabstop=4 shiftwidth=4 foldmethod=indent foldnestmax=2 foldlevel=1
aug end

" }}}
" Quickfix ----------------- {{{

aug ft_qf
    au!
    au FileType qf setl colorcolumn=0 nolist nocursorline nowrap tw=0 nonu nornu
    au FileType qf nnoremap <buffer> q <Cmd>quit<CR>
aug end

" }}}
" Rust --------------------- {{{

aug ft_rust
    au!
    au FileType rust setl softtabstop=4 shiftwidth=4 foldmethod=marker foldmarker={,}

    " Use ";s" to add semicolon to eol
    au FileType rust nnoremap <buffer> <LocalLeader>s A;<Esc>
aug end

" }}}
" Sh ----------------------- {{{

aug ft_sh
    au!
    au FileType sh,zsh setl softtabstop=2 shiftwidth=2
aug end

" }}}
" Tmux --------------------- {{{

aug ft_tmux
    au!
    au FileType tmux setl softtabstop=2 shiftwidth=2
aug end

" }}}
" Vim ---------------------- {{{

aug ft_vim
    au!
    au FileType vim setl softtabstop=4 shiftwidth=4 foldmethod=marker foldmarker={{{,}}}
aug end

" }}}
" Vue ---------------------- {{{

aug ft_vue
    au!
    au FileType vue setl softtabstop=2 shiftwidth=2 foldmethod=manual

    " Use ";f" to fold current tag
    au FileType vue nnoremap <buffer> <LocalLeader>f Vatzf

    " Use ";i" to indent current tag
    au FileType vue nnoremap <buffer> <LocalLeader>i Vat=

    " Use ";s" to add semicolon to eol
    au FileType vue nnoremap <buffer> <LocalLeader>s A;<Esc>
aug end

" }}}
" YAML --------------------- {{{

aug ft_yaml
    au!
    au FileType yaml setl softtabstop=2 shiftwidth=2 foldmethod=indent foldnestmax=2
aug end

" }}}

" }}}
