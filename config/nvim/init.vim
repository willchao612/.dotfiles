" Author: Will Chao <nerdzzh@gmail.com>
" Last Modified: Tuesday, 02 August 2022

let mapleader      = ','
let maplocalleader = ';'

" Plugin-related Settings ------------------ {{{

" gruvbox ------------------ {{{

let g:gruvbox_contrast_dark      = 'hard'
let g:gruvbox_italic             = 1
let g:gruvbox_italicize_comments = 1
let g:gruvbox_sign_column        = 'bg0'
let g:gruvbox_transparent_bg     = 1

" }}}
" kommentary --------------- {{{

let g:kommentary_create_default_mappings = v:false

" }}}
" neoformat ---------------- {{{

let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim  = 1
let g:neoformat_try_node_exe       = 1
let g:shfmt_opt                    = "-ci"

let g:neoformat_enabled_c          = ['clangformat']
let g:neoformat_enabled_cpp        = ['clangformat']
let g:neoformat_enabled_css        = ['prettier']
let g:neoformat_enabled_html       = ['prettier']
let g:neoformat_enabled_javascript = ['prettier']
let g:neoformat_enabled_json       = ['prettier']
let g:neoformat_enabled_less       = ['prettier']
let g:neoformat_enabled_lua        = ['stylua']
let g:neoformat_enabled_markdown   = ['prettier']
let g:neoformat_enabled_python     = ['yapf']
let g:neoformat_enabled_rust       = ['rustfmt']
let g:neoformat_enabled_scss       = ['prettier']
let g:neoformat_enabled_sh         = ['shfmt']
let g:neoformat_enabled_vue        = ['prettier']
let g:neoformat_enabled_zsh        = ['shfmt']

augroup fmt
    autocmd!
    autocmd BufWritePre *.{c,cpp,css,html,js,json,less,lua,py,rs,scss,sh,vue,zsh} Neoformat
augroup END

nnoremap <Leader>F <Cmd>Neoformat<CR>

" }}}
" sparkup ------------------ {{{

let g:sparkupNextMapping = '<C-S>'

autocmd FileType javascript,vue runtime ftplugin/html/sparkup.vim

" }}}
" tabular ------------------ {{{

map ;a= :Tabularize /=<CR>
map ;a: :Tabularize /:<CR>

" }}}
" vim-diagon --------------- {{{

let g:diagon_use_echo = 1

noremap <Leader>D :Diagon<Space>
noremap <Leader>dm :Diagon Math<CR>
noremap <Leader>ds :Diagon Sequence<CR>
noremap <Leader>dt :Diagon Tree<CR>

" }}}
" vim-fugitive ------------- {{{

nnoremap <Leader>G :Git<Space>

nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gd :vert :Gdiffsplit<CR>
nnoremap <Leader>go :GBrowse<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gs :Git<CR>

nnoremap <Leader>gci :Git commit<CR>
nnoremap <Leader>gco :Git checkout<Space>

" }}}
" vim-litecorrect ---------- {{{

augroup litecorrect
    autocmd!
    autocmd FileType markdown,mkd call litecorrect#init()
    autocmd FileType textile call litecorrect#init()
augroup END

" }}}
" vim-markdown ------------- {{{

let g:vim_markdown_folding_disabled        = 1
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit             = 1
let g:vim_markdown_conceal                 = 0
let g:tex_conceal                          = ""
let g:vim_markdown_math                    = 1
let g:vim_markdown_conceal_code_blocks     = 0
let g:vim_markdown_frontmatter             = 1
let g:vim_markdown_strikethrough           = 1
let g:vim_markdown_new_list_item_indent    = 0

fu! s:MarkdownTocWinToggle()
    if index(['markdown', 'qf'], &filetype) == -1
        return
    endif

    if get(getloclist(0, {'winid': 0}), 'winid', 0)
        " location window is open
        lclose
    else
        " location window is not open
        Toch
    endif
endfu

command! TocToggle call <SID>MarkdownTocWinToggle()
nnoremap <Leader>to :TocToggle<CR>

" }}}
" vim-markdown-toc --------- {{{

let g:vmt_auto_update_on_save = 1
let g:vmt_fence_text          = 'TOC START'
let g:vmt_fence_closing_text  = 'TOC END'
let g:vmt_list_item_char      = '-'

" }}}
" vim-matchup -------------- {{{

let g:matchup_matchparen_offscreen = {}

" }}}
" vim-mundo ---------------- {{{

let g:mundo_right = 1

nnoremap <silent> <Leader>ud :MundoToggle<CR>

" }}}
" vim-plug ----------------- {{{

" let g:plug_url_format = 'https://git::@github.com.cnpmjs.org/%s.git'

if has('nvim')
    let g:plug_home = stdpath('data') . '/plugged'
endif

" }}}

" }}}
" Plugged ---------------------------------- {{{

call plug#begin()

Plug 'L3MON4D3/LuaSnip'
Plug 'rhysd/clever-f.vim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'j-hui/fidget.nvim'
Plug 'rafamadriz/friendly-snippets'
Plug 'lewis6991/gitsigns.nvim'
Plug 'morhetz/gruvbox'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'neoclide/jsonc.vim'
Plug 'b3nj5m1n/kommentary'
Plug 'onsails/lspkind.nvim'
Plug 'folke/lua-dev.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'sbdchd/neoformat'
Plug 'karb94/neoscroll.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'hrsh7th/nvim-cmp'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'SmiteshP/nvim-gps'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'windwp/nvim-ts-autotag'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'p00f/nvim-ts-rainbow'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/persistence.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'rstacruz/sparkup', { 'rtp': 'vim/' }
Plug 'lewis6991/spellsitter.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'godlygeek/tabular'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'folke/trouble.nvim'
Plug 'rlue/vim-barbaric'
Plug 'willchao612/vim-diagon'
Plug 'tpope/vim-fugitive'
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx', 'typescript'], 'do': 'make install' }
Plug 'preservim/vim-litecorrect'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'andymass/vim-matchup'
Plug 'simnalamburt/vim-mundo'
Plug 'junegunn/vim-peekaboo'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'

call plug#end()

lua require('nerdzzh')

" }}}
" Basic Configurations --------------------- {{{

" Backups ------------------ {{{

set backup                                     " enable backups
set noswapfile                                 " it's 2021, Vim.

set undodir  =~/.config/nvim/tmp/undo//        " undo files
set backupdir=~/.config/nvim/tmp/backup//      " backups
set directory=~/.config/nvim/tmp/swap//        " swap files

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), 'p')
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), 'p')
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), 'p')
endif

" }}}
" Colorscheme -------------- {{{

colorscheme gruvbox
set bg=dark

" Highlight VCS conflick markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

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
" Highlight yank ----------- {{{
" Nvim includes a function for highlighting a selection on yank

if has('nvim')
    aug highlight_yank
        au!
        au TextYankPost * silent! lua vim.highlight.on_yank() { timeout=300 }
    aug end
endif

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
" Python ------------------- {{{
" Python version and executable for Neovim

set pyx=3
let g:python3_host_prog = substitute(system('which python3'), '\n$', '', '')

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
set completeopt=menu,menuone,noselect
set cursorline
set dictionary=/usr/share/dict/words
set encoding=utf-8
set expandtab
set foldlevelstart=0
set formatoptions=qrn1jc
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=3
set lazyredraw
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set modelines=0
set mouse=a
set noshowmode
set number
set relativenumber
set scrolloff=3
set shell=/usr/bin/zsh
set shiftwidth=4
set shortmess+=Ics
set showbreak=↪
set showcmd
set sidescroll=1
set sidescrolloff=10
set smartcase
set softtabstop=4
set spellfile=~/.config/nvim/custom-dictionary.utf-8.add
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

nnoremap <Leader>ed :e ~/.config/nvim/custom-dictionary.utf-8.add<CR>
nnoremap <Leader>eg :e ~/.gitconfig<CR>
nnoremap <Leader>et :e ~/.tmux.conf<CR>
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>ez :e ~/.zsh_profile<CR>
nnoremap <Leader>el :e ~/.config/nvim/lua/nerdzzh/init.lua<CR>

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

" Clean carriage-return (mainly in WSL)
nnoremap <silent> <Leader>M mz:let _s=@/<CR>:%s/<C-V><C-M>$//e<CR>:noh<CR>:let @/=_s<CR>`z

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
