" Author: Will Chao <nerdzzh@gmail.com>
" Last Change: 12/26/2021 09:35:33 PM +0800

" "Nighttime is the guardian of creativity."

" Preamble --------------------------------- {{{

" Plugin-related variables must be set before the plugin is loaded.
"
" Here are the plugins I use:
" ----------------------------------------------
" name                          | most used key
" ----------------------------------------------
" ack.vim                       | ,a
" auto-pairs                    |
" coc.nvim                      | <F4>
" ctrlp.vim                     | ,,
" fzf                           |
" fzf.vim                       | ;b
" gruvbox                       |
" gundo.vim                     | <F6>
" indentline                    |
" nerdtree                      | <F2>
" plenary.nvim                  |
" rainbow_parentheses.vim       |
" sparkup                       | i_CTRL_E
" supertab                      |
" tabular                       | ;a=
" tagalong.vim                  |
" tagbar                        | ,T
" telescope.nvim                | <F1>
" vim-airline                   |
" vim-autoformat                | <F3>
" vim-commentary                | ;c
" vim-context-commentstring     |
" vim-diagon                    | ,D
" vim-floaterm                  | <F10>
" vim-fugitive                  | ,G
" vim-gitgutter                 |
" vim-jsdoc                     | ;f
" vim-jsonc                     |
" vim-markdown                  | <F5>
" vim-markdown-toc              | ;t
" vim-polyglot                  |
" vim-repeat                    |
" vim-run                       | ;r
" vim-smoothie                  |
" vim-snippets                  |
" vim-startify                  | n_CTRL_S
" vim-surround                  | v_S
" ----------------------------------------------
"
" Plugins above require a patched font for additional glyphs. I am currently
" using "Hack Nerd Font". Simply unzip the folder and copy the files to
" "/usr/local/share/fonts" on Linux.
"
" Both "ctrlp" and "ack" defaults to the directory of current file.
"
" Here are the extensions I use for coc.nvim:
" ----------------------------------------------
" name                          | ext
" ----------------------------------------------
" coc-clangd                    | .c,.cpp
" coc-css                       | .css,.scss
" coc-fish                      | .fish
" coc-html-css-support          | .html
" coc-html                      | .html
" coc-json                      | .json,.jsonc
" coc-pyright                   | .py
" coc-sh                        | .sh
" coc-snippets                  | (all)
" coc-tsserver                  | .js
" coc-vetur                     | .vue
" coc-vimlsp                    | .vim
" coc-webpack                   | webpack.config.js
" coc-xml                       | .xml
" coc-yaml                      | .yml,.yaml
" ----------------------------------------------
"
" Huge thanks to @stevelosh and his amazing "learnvimscriptthehardway" crash
" course for teaching me to customize this editor and enhance user experienece
" sooooo much.
"
" This is Will here in 2021. Hope you healthy and joyful. Best regards.
"
" "Mamba never out."

" }}}

let mapleader      = ','
let maplocalleader = ';'

" Plugin-related Settings ------------------ {{{

" ack.vim ------------------ {{{

" Use "ag" as default searching tool, you should install it first.
let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'

" With a "bang", it will not jump to the first result automatically.
nnoremap <Leader>a :Ack!<Space>

" }}}
" auto-pairs --------------- {{{

let g:AutoPairsMapSpace = 0
" Disable ALL shortcuts
let g:AutoPairsShortcutToggle     = ''
let g:AutoPairsShortcutFastWrap   = ''
let g:AutoPairsShortcutJump       = ''
let g:AutoPairsShortcutBackInsert = ''

aug auto_pairs
    au!
    au FileType markdown let b:AutoPairs = AutoPairsDefine({'*':'*','**':'**'})
    " FUCK *\V* REGEX
    au FileType html let b:AutoPairs = AutoPairsDefine({'<\(\w\|-\)\+\.\{-}>':'<\/\(\w\|-\)\+>'})
    au FileType vue let b:AutoPairs = AutoPairsDefine({'<\(\w\|-\)\+\.\{-}>':'<\/\(\w\|-\)\+>'})
    au FileType xml let b:AutoPairs = AutoPairsDefine({'<\(\w\|-\)\+\.\{-}>':'<\/\(\w\|-\)\+>'})
    au FileType javascript let b:AutoPairs = AutoPairsDefine({'<\(\w\|-\)\+\.\{-}>':'<\/\(\w\|-\)\+>'})
aug end

" }}}
" coc.nvim ----------------- {{{

let g:coc_global_extensions = [
            \ 'coc-clangd',
            \ 'coc-css',
            \ 'coc-fish',
            \ 'coc-html-css-support',
            \ 'coc-html',
            \ 'coc-json',
            \ 'coc-lua',
            \ 'coc-pyright',
            \ 'coc-sh',
            \ 'coc-snippets',
            \ 'coc-tsserver',
            \ 'coc-vetur',
            \ 'coc-vimlsp',
            \ 'coc-webpack',
            \ 'coc-xml',
            \ 'coc-yaml'
            \]

nmap <F4> <Plug>(coc-definition)

" }}}
" ctrlp.vim ---------------- {{{

let g:ctrlp_map               = '<Leader>,'
let g:ctrlp_cmd               = 'CtrlP'
let g:ctrlp_match_window      = 'bottom,order:ttb' . ',max:20'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer     = 0

nnoremap <Leader>. :CtrlPTag<CR>
nnoremap <Leader>/ :CtrlPBuffer<CR>

" }}}
" fzf.vim ------------------ {{{

command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--border', '--bind=ctrl-h:page-up,ctrl-l:page-down,ctrl-y:preview-up,ctrl-e:preview-down'], 'source': 'ag --hidden --ignore .git -g ""'}), <bang>0)
nnoremap ;z :Files<CR>

command! -bang -nargs=? -complete=buffer Buffers
            \ call fzf#vim#buffers(<q-args>, fzf#vim#with_preview({'placeholder': '{1}', 'options': ['--layout=reverse', '--border', '--bind=ctrl-h:page-up,ctrl-l:page-down,ctrl-y:preview-up,ctrl-e:preview-down']}), <bang>0)
nnoremap ;b :Buffers<CR>

" }}}
" gundo.vim ---------------- {{{

let g:gundo_prefer_python3 = 1

nnoremap <F6> :GundoToggle<CR>

" }}}
" nerdtree ----------------- {{{

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI        = 1
let NERDTreeQuitOnOpen       = 1

aug ft_nerdtree
    au!
    au FileType nerdtree setl nolist
aug end

nnoremap <F2> :NERDTreeToggle<CR>

" }}}
" rainbow_parentheses.vim -- {{{

let g:rainbow#max_level = 16
let g:rainbow#pairs     = [['(', ')'], ['[', ']'], ['{', '}']]

aug rainbow
    au!
    au FileType * RainbowParentheses
aug end

" }}}
" sparkup ------------------ {{{

let g:sparkupNextMapping = '<c-s>'

autocmd FileType javascript,vue runtime ftplugin/html/sparkup.vim

" }}}
" supertab ----------------- {{{

let g:SuperTabDefaultCompletionType = '<C-N>'
let g:SuperTabLongestHighlight      = 1
let g:SuperTabCrMapping             = 1

" }}}
" tabular ------------------ {{{

map ;a= :Tabularize /=<CR>
map ;a: :Tabularize /:<CR>

" }}}
" tagbar ------------------- {{{

let g:tagbar_type_css = {
            \ 'ctagstype': 'Css',
            \ 'kinds': [
                \   'c:classes',
                \   's:selectors',
                \   'i:identities'
                \ ]
                \}

let g:tagbar_type_json = {
            \ 'ctagstype': 'json',
            \ 'kinds': [
                \   'o:objects',
                \   'a:arrays',
                \   'n:numbers',
                \   's:strings',
                \   'b:booleans',
                \   'z:nulls'
                \ ],
                \ 'sro': '.',
                \ 'scope2kind': {
                    \   'object': 'o',
                    \   'array': 'a',
                    \   'number': 'n',
                    \   'string': 's',
                    \   'boolean': 'b',
                    \   'null': 'z'
                    \ },
                    \ 'kind2scope': {
                        \   'o': 'object',
                        \   'a': 'array',
                        \   'n': 'number',
                        \   's': 'string',
                        \   'b': 'boolean',
                        \   'z': 'null'
                        \ },
                        \ 'sort': 0
                        \}

nmap <Leader>T :TagbarToggle<CR>

" }}}
" telescope.nvim ----------- {{{

nmap <F1> :Telescope help_tags<CR>

" }}}
" vim-airline -------------- {{{

let g:airline#extensions#tabline#enabled = 1

" }}}
" vim-autoformat ----------- {{{

let g:formatdef_luafmt    = "'luafmt --line-width '.&textwidth.' --indent-count '.shiftwidth().' --stdin'"
let g:formatdef_prettier  = "'prettier --stdin-filepath '.expand('%:p').' --print-width '.&textwidth.' --tab-width '.shiftwidth().' --single-quote --prose-wrap always --vue-indent-script-and-style'"
let g:formatdef_shfmt     = "'shfmt -i '.(&expandtab ? shiftwidth() : '0').' -bn -ci -sr -kp'"
let g:formatdef_tidy_html = "'tidy -q --show-errors 0 --show-warnings 0 --force-output --indent auto --indent-spaces '.shiftwidth().' --vertical-space yes --tidy-mark no --wrap 0 --priority-attributes id,class,name,type --sort-attributes alpha'"

let g:formatters_c          = ['clangformat']
let g:formatters_cpp        = ['clangformat']
let g:formatters_css        = ['prettier']
let g:formatters_fish       = ['fish_indent']
let g:formatters_html       = ['tidy_html']
let g:formatters_javascript = ['prettier']
let g:formatters_json       = ['prettier']
let g:formatters_less       = ['prettier']
let g:formatters_lua        = ['luafmt']
let g:formatters_markdown   = ['prettier']
let g:formatters_python     = ['autopep8']
let g:formatters_scss       = ['prettier']
let g:formatters_sh         = ['shfmt']
let g:formatters_vue        = ['prettier']

aug format_on_save
    au!
    au BufWritePre *.{html,css,scss,js,json,vue,lua,py,c,cpp}
                \   exe 'Autoformat'
                \ | exe 'norm! zv'
aug end

noremap <F3> :Autoformat<CR>zv

" }}}
" vim-commentary ----------- {{{

nmap ;c <Plug>CommentaryLine
xmap ;c <Plug>Commentary

" }}}
" vim-diagon --------------- {{{

noremap <Leader>D :Diagon<Space>
noremap <Leader>dm :Diagon Math<CR>
noremap <Leader>ds :Diagon Sequence<CR>
noremap <Leader>dt :Diagon Tree<CR>

" }}}
" vim-floaterm ------------- {{{

let g:floaterm_autoclose     = 2
let g:floaterm_height        = 0.9
let g:floaterm_width         = 0.9
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F10>'

if executable('ranger')
    nnoremap <F12> :FloatermNew ranger<CR>
endif

" }}}
" vim-fugitive ------------- {{{

nnoremap <Leader>G :Git<Space>

nnoremap <Leader>ga :Git add<Space>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gd :Git diff<CR>
nnoremap <Leader>gl :Git log<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gs :Git<CR>

nnoremap <Leader>gci :Git commit<CR>
nnoremap <Leader>gco :Git checkout<Space>

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
nnoremap <F5> :TocToggle<CR>

" }}}
" vim-markdown-toc --------- {{{

let g:vmt_auto_update_on_save = 1
let g:vmt_fence_text = 'TOC START'
let g:vmt_fence_closing_text = 'TOC END'
let g:vmt_list_item_char = '-'

" }}}
" vim-plug ----------------- {{{

" let g:plug_url_format = 'https://git::@github.com.cnpmjs.org/%s.git'

if has('nvim')
    let g:plug_home = stdpath('data') . '/plugged'
endif

" }}}
" vim-polyglot ------------- {{{

let g:polyglot_disabled = ['autoindent', 'coffee-script', 'markdown']

" }}}
" vim-run ------------------ {{{

nnoremap ;R :Run<Space>
nnoremap ;r :Run<CR>
vnoremap ;r :RunV<CR>
vnoremap ;R :RunV<Space>
nnoremap <Leader>sd :RunDiff<CR>

" }}}
" vim-smoothie ------------- {{{

let g:smoothie_update_interval             = 1
let g:smoothie_speed_constant_factor       = 100
let g:smoothie_speed_linear_factor         = 100
let g:smoothie_speed_exponentiation_factor = 1.0

" }}}
" vim-startify ------------- {{{

let g:startify_change_to_dir       = 1
let g:startify_enable_special      = 0
let g:startify_files_number        = 8
let g:startify_fortune_use_unicode = 1
let g:startify_relative_path       = 1
let g:startify_session_autoload    = 1
let g:startify_session_persistence = 1
let g:startify_update_oldfiles     = 1

let g:startify_lists = [
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ { 'type': 'files',     'header': ['   MRU']            },
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ ]

let g:startify_skiplist = [
            \ 'COMMIT_EDITMSG',
            \ ]

let g:startify_custom_footer =
            \ ['', "   Vim is charityware. Please read ':help uganda'.", '']

autocmd User Startified setlocal cursorline

nnoremap <C-S><C-S> :Startify<CR>
nnoremap <C-S>s :SSave<CR>
nnoremap <C-S>l :SLoad<CR>
nnoremap <C-S>c :SClose<CR>
nnoremap <C-S>d :SDelete<CR>

" }}}

" }}}
" Plugged ---------------------------------- {{{

call plug#begin()

Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'sjl/gundo.vim'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'nvim-lua/plenary.nvim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'rstacruz/sparkup', { 'rtp': 'vim/' }
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'AndrewRadev/tagalong.vim'
Plug 'preservim/tagbar'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-airline/vim-airline'
Plug 'chiel92/vim-autoformat'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'willchao612/vim-diagon'
Plug 'voldikss/vim-floaterm'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'heavenshell/vim-jsdoc', { 'for': ['javascript', 'javascript.jsx', 'typescript'], 'do': 'make install' }
Plug 'kevinoid/vim-jsonc'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-repeat'
Plug 'willchao612/vim-run'
Plug 'psliwka/vim-smoothie'
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'

call plug#end()

" }}}
" Lua Code --------------------------------- {{{

" telescope.nvim ----------- {{{

lua << EOF
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
      i = {
        ["<C-J>"] = actions.move_selection_next,
        ["<C-K>"] = actions.move_selection_previous
      }
    }
  }
}
EOF

" }}}

" }}}
" Options ---------------------------------- {{{

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
" Statusline --------------- {{{

set statusline=                                " Thanks Tassos!
set statusline+=\ %n\                          " buffer number
set statusline+=%{&ff}                         " file format
set statusline+=%y                             " file type
set statusline+=\ %<%F\                        " full path
set statusline+=%1*%m%*                        " modified flag

if exists("*FugitiveStatusline")               " git branch
    set statusline+=%2*%{FugitiveStatusline()}%*
endif

set statusline+=%=%5l                          " current line
set statusline+=/%L                            " total lines
set statusline+=%4v\                           " virtual column number
set statusline+=0x%04B\                        " character under cursor

hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
hi User2 term=inverse,bold cterm=inverse,bold ctermfg=blue

" }}}
" Wildmenu ----------------- {{{

set wildmenu
set wildmode=list:longest

set wildignore+=.git                           " version control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " binary images
set wildignore+=*.obj,*.exe,*.dll              " compiled object files
set wildignore+=*.zip,*.rar,*.7z,*.tar.gz      " compressed files
set wildignore+=*.deb,*.rpm,*.pkg              " package files
set wildignore+=*.spl                          " compiled spelling word lists
set wildignore+=*.sw?                          " swap files
set wildignore+=*.DS_Store                     " mac bullshit

" }}}
" Colorscheme -------------- {{{

colorscheme gruvbox
set bg=dark

" Highlight VCS conflick markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}
" Cursorline --------------- {{{
" Only show cursorline in the current window and in normal mode.

aug cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
aug end

" }}}
" Trailing Whitespace ------ {{{
" Only shown when not in insert mode so I don't go insane.

aug trailing
    au!
    au InsertEnter * :set listchars-=trail:·
    au InsertLeave * :set listchars+=trail:·
aug end

" }}}
" Resize ------------------- {{{
" Resize splits when window is resized.

aug resized
    au!
    au VimResized * :wincmd =
aug end

" }}}
" Python ------------------- {{{
" Python version and executable for Neovim

set pyx=3
let g:python3_host_prog = '~/anaconda3/bin/python3'

" }}}

set autoindent
set autoread
set autowrite
set backspace=indent,eol,start
set colorcolumn=+1
set complete=.,w,b,u,t
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
set laststatus=2
set lazyredraw
set list
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set modelines=0
set mouse=a
set nonumber
set norelativenumber
set scrolloff=3
set shell=/usr/bin/fish
set shiftwidth=4
set shortmess+=Ics
set showbreak=↪
set showcmd
set showmode
set sidescroll=1
set sidescrolloff=10
set smartcase
set softtabstop=4
set spellfile=~/.config/nvim/custom-dictionary.utf-8.add
set splitbelow
set splitright
set tabstop=8
set textwidth=80
set updatetime=100
set virtualedit+=block
set visualbell t_vb=
set wrap

" }}}
" Abbreviation ----------------------------- {{{

iab mymail nerdzzh@gmail.com
iab myname Will Chao

iab waht what
iab teh  the
iab tehn then

iab <expr> hworld 'Hello World!'.EatNextWhiteChar()
iab <expr> lhost 'http://localhost:'.EatNextWhiteChar()
iab <expr> dts strftime('%x %X %z')

" }}}
" Mappings --------------------------------- {{{

runtime macros/matchit.vim
map <Tab> %
silent! unmap [%
silent! unmap ]%

" Normal Mode -------------- {{{

" Jumping Around {{{

" Jump between windows.
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" Move windows.
nnoremap <Leader>wh <C-W>H
nnoremap <Leader>wj <C-W>J
nnoremap <Leader>wk <C-W>K
nnoremap <Leader>wl <C-W>L
nnoremap <Leader>wr <C-W><C-R>

" Jump to the beginning/end of line.
nnoremap H ^
nnoremap L $

" Keep jumping position in the middle.
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap g; g;zzzv
nnoremap g, g,zzzv
nnoremap <C-O> <C-O>zzzv
nnoremap <C-[> <C-I>zzzv
nnoremap <C-]> <C-]>zzzv
nnoremap <C-\> <C-W>v<C-]>zzzv

" }}}
" Toggling {{{

" Space to toggle folds.
nnoremap <Space> za

" [i]nvisible characters.
nnoremap \i :setl list!<CR>

" Line [n]umbers.
nnoremap \n :setl number!<CR>

" [s]pell check
nnoremap \s :setl spell!<CR>

" }}}
" Quick Editing {{{

nnoremap <Leader>ec :CocConfig<CR>
nnoremap <Leader>ed :e ~/.config/nvim/custom-dictionary.utf-8.add<CR>
nnoremap <Leader>ef :e $OMF_CONFIG/init.fish<CR>
nnoremap <Leader>eg :e ~/.gitconfig<CR>
nnoremap <Leader>et :e ~/.tmux.conf<CR>
nnoremap <Leader>ev :e $MYVIMRC<CR>

nnoremap <silent> <Leader>sv :so $MYVIMRC<CR>:noh<CR>

nnoremap ;y "+y
nnoremap ;u :u0<CR>
nnoremap Y y$
nnoremap J mzJ`z

nnoremap ;w :w<CR>
nnoremap ;q :q<CR>
nnoremap ;; <C-^>

" }}}

" Cycle through buffers.
nnoremap <C-F> :bn<CR>
nnoremap <C-B> :bp<CR>

" Delete current buffer and return to last one.
nnoremap <Leader>bd :bp\|bd #<CR>

" Linewisely select entire buffer.
nnoremap <Leader>sa ggVG

" Sort lines.
nnoremap <Leader>ss Vip:sort<CR>

" Stop highlighting matches.
nnoremap <silent> <Leader><Space> :noh<CR>:call clearmatches()<CR>:IndentLinesEnable<CR>

" Clean trailing whitespaces.
nnoremap <silent> <Leader>W mz:let _s=@/<CR>:%s/\s\+$//e<CR>:noh<CR>:let @/=_s<CR>`z

" Reindent entire buffer.
nnoremap =- mzggVG=`z

" Close all folds except current one.
nnoremap z; zMzvzz

" Kill.
nnoremap K :q<CR>

" Man.
nnoremap M K

" Clean carriage-return (mainly in WSL).
nnoremap <silent> <Leader>M mz:let _s=@/<CR>:%s/<C-V><C-M>$//e<CR>:noh<CR>:let @/=_s<CR>`z

" Format current line.
nnoremap \q gqq

" }}}
" Insert Mode -------------- {{{

" Exit insert mode.
inoremap jk <Esc>

" Look up dictionary.
inoremap <C-L> <C-X><C-K>

" Complete filename (by pure Vim).
inoremap <C-F> <C-X><C-F>

" Center current line.
inoremap <C-N> 1<Esc>zza<BS>

" Paste from system clipboard.
inoremap <C-P> <Esc>"+pa

" Capitalize word under cursor (useful for constants).
inoremap <C-U> <Esc>mzgUiw`za

" }}}
" Visual Mode -------------- {{{

" Copy to system clipboard.
vnoremap ;y "+y

" Sort lines.
vnoremap <Leader>ss :sort<CR>

" Paste without meddling with regs.
vnoremap p "_dP

" To the first or last non-blank character of the line.
vnoremap H g^
vnoremap L g_

" Space to toggle folds.
vnoremap <Space> za

" Solve delay when exiting visual mode (on some OSs).
vnoremap <Esc> <C-C>

" Move blocks upward and downward.
"
" :m is short for :move command, which moves lines in selected range right above
" the address line number.
"
" Then reindent and reselect the block.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Re-select after indenting.
vnoremap < <gv
vnoremap > >gv

" Search for selected text.
"
" Save and restore unnamed register to not mess it up. Yank text first, search
" using unnamed register's content.
"
" Then center the result.
vnoremap // :<C-U>let _s=@"<CR>gvy/\m<C-R>=escape(@",'/\')<CR><CR>:let @"=_s<CR>zzzv

" Replace selected text globally.
vnoremap <Leader>r y:%s/<C-R>"//g<Left><Left>

" Format selected lines.
vnoremap \q gq

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

" Blog --------------------- {{{

aug ft_blog
    au!
    au BufRead,BufNewFile */_posts/*.md setl spell
    au BufRead,BufNewFile */_drafts/*.md setl spell
aug end

" }}}
" C and Cpp ---------------- {{{

aug ft_c
    au!

    au FileType c,cpp setl softtabstop=4 shiftwidth=4
    au FileType c,cpp setl foldmethod=marker foldmarker={,}
    au FileType c,cpp setl formatoptions-=o

    " Use ";h" to add file header.
    au FileType c,cpp nnoremap <buffer> <LocalLeader>h ggO/**
                \ Author: Will Chao <nerdzzh@gmail.com><CR>
                \ Filename: <C-R>=expand('%:p:t')<CR><CR>
                \Last Change: <C-R>=strftime('%x %X %z')<CR><CR>
                \Brief: %<CR><Esc>a/<Esc>:let _s=@/<CR>?%<CR>:let @/=_s<CR>
                \:noh<CR>a<BS><C-R>=EatNextWhiteChar()<CR>

    " Use ";s" to add semicolon to eol.
    au FileType c,cpp nnoremap <buffer> <LocalLeader>s A;<Esc>
aug end

" }}}
" CSS and SCSS ------------- {{{

aug ft_css
    au!

    au FileType css,scss setl softtabstop=2 shiftwidth=2
    au FileType css,scss setl foldmethod=marker foldmarker={,}
    au FileType css,scss setl formatoptions-=o

    " Use ";h" to add file header.
    au FileType css,scss nnoremap <buffer> <LocalLeader>h ggO/**
                \ Author: Will Chao <nerdzzh@gmail.com><CR>
                \ Filename: <C-R>=expand('%:p:t')<CR><CR>
                \Last Change: <C-R>=strftime('%x %X %z')<CR><CR>
                \Brief: %<CR><Esc>a/<Esc>:let _s=@/<CR>?%<CR>:let @/=_s<CR>
                \:noh<CR>a<BS><C-R>=EatNextWhiteChar()<CR>

    " Use ";s" to add semicolon to eol.
    au FileType css,scss nnoremap <buffer> <LocalLeader>s A;<Esc>

    " Use ";f" to format properties.
    au FileType css,scss nnoremap <buffer> <LocalLeader>f :let _s=@"<CR>?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>:let @"=_s<CR>
aug end

" }}}
" Fish --------------------- {{{

aug ft_fish
    au!
    au FileType fish setl softtabstop=2 shiftwidth=2
    au FileType fish setl foldmethod=marker foldmarker={{{,}}}
    au FileType fish setl formatoptions-=o
aug end

" }}}
" HTML --------------------- {{{

aug ft_html
    au!

    au FileType html setl softtabstop=2 shiftwidth=2
    au FileType html setl formatoptions+=l
    au FileType html setl foldmethod=manual

    " Use ";h" to add file header.
    au FileType html nnoremap <buffer> <LocalLeader>h ggO<!--<CR><C-D>
                \Author: Will Chao <nerdzzh@gmail.com><CR>
                \Filename: <C-R>=expand('%:p:t')<CR><CR>
                \Last Change: <C-R>=strftime('%x %X %z')<CR><CR>
                \Brief: %<CR>--><Esc>:let _s=@/<CR>?%<CR>:let @/=_s<CR>
                \:noh<CR>a<BS><C-R>=EatNextWhiteChar()<CR>

    " Use ";f" to fold current tag.
    au FileType html nnoremap <buffer> <LocalLeader>f Vatzf

    " Use ";i" to indent current tag.
    au FileType html nnoremap <buffer> <LocalLeader>i Vat=
aug end

" }}}
" JavaScript --------------- {{{

aug ft_javascript
    au!

    au FileType javascript setl softtabstop=2 shiftwidth=2
    au FileType javascript setl foldmethod=marker foldmarker={,}
    au FileType javascript setl formatoptions-=o

    " Use ";f" to add JSDoc-like function description.
    au FileType javascript nnoremap <buffer> <LocalLeader>f :JsDoc<CR>

    " Use ";h" to add file header.
    au FileType javascript nnoremap <buffer> <LocalLeader>h ggO/**
                \ Author: Will Chao <nerdzzh@gmail.com><CR>
                \ Filename: <C-R>=expand('%:p:t')<CR><CR>
                \Last Change: <C-R>=strftime('%x %X %z')<CR><CR>
                \Brief: %<CR><Esc>a/<Esc>:let _s=@/<CR>?%<CR>:let @/=_s<CR>
                \:noh<CR>a<BS><C-R>=EatNextWhiteChar()<CR>

    " Use ";s" to add semicolon to eol.
    au FileType javascript nnoremap <buffer> <LocalLeader>s A;<Esc>
aug end

" }}}
" Lua ---------------------- {{{

aug ft_lua
    au!

    au FileType lua setl softtabstop=2 shiftwidth=2
    au FileType lua setl formatoptions-=o
    au FileType lua setl comments=s:--[[,m:\ ,e:]],:--

    " Use ";h" to add file header.
    au FileType lua nnoremap <buffer> <LocalLeader>h ggO--
                \ Author: Will Chao <nerdzzh@gmail.com><CR>
                \Filename: <C-R>=expand('%:p:t')<CR><CR>
                \Last Change: <C-R>=strftime('%x %X %z')<CR><CR>
                \Brief: <C-R>=EatNextWhiteChar()<CR>
aug end

" }}}
" Markdown ----------------- {{{

aug ft_markdown
    au!

    au FileType markdown setl softtabstop=2 shiftwidth=2
    au FileType markdown setl comments=b:*,b:-,b:+,n:>
    au FileType markdown setl formatoptions+=rc

    au FileType markdown inorea <buffer> h1 #
    au FileType markdown inorea <buffer> h2 ##
    au FileType markdown inorea <buffer> h3 ###
    au FileType markdown inorea <buffer> h4 ####
    au FileType markdown inorea <buffer> h5 #####
    au FileType markdown inorea <buffer> h6 ######

    " Use ";h" to add file header.
    au FileType markdown nnoremap <buffer> <LocalLeader>h ggO<!--<CR><C-D>
                \Author: Will Chao <nerdzzh@gmail.com><CR>
                \Filename: <C-R>=expand('%:p:t')<CR><CR>
                \Last Change: <C-R>=strftime('%x %X %z')<CR><CR>
                \Brief: %<CR>--><Esc>:let _s=@/<CR>?%<CR>:let @/=_s<CR>
                \:noh<CR>a<BS><C-R>=EatNextWhiteChar()<CR>

    " Use ";t" to generate toc.
    au FileType markdown nnoremap <buffer> <LocalLeader>t :GenTocGFM<CR>

    " Use ";s" to make bold([s]trong)
    au FileType markdown nnoremap <buffer> <LocalLeader>s mzviw<Esc>a**<Esc>hbi**<Esc>`z
    au FileType markdown vnoremap <buffer> <LocalLeader>s <Esc>`>a**<Esc>`<i**<Esc>`>
    " Use ";i" to [i]talicize
    au FileType markdown nnoremap <buffer> <LocalLeader>i mzviw<Esc>a*<Esc>bi*<Esc>`z
    au FileType markdown vnoremap <buffer> <LocalLeader>i <Esc>`>a*<Esc>`<i*<Esc>`>
    " Use ";d" to strike out([d]elete)
    au FileType markdown nnoremap <buffer> <LocalLeader>d mzviw<Esc>a~~<Esc>hbi~~<Esc>`z
    au FileType markdown vnoremap <buffer> <LocalLeader>d <Esc>`>a~~<Esc>`<i~~<Esc>`>
aug end

" }}}
" Python ------------------- {{{

aug ft_python
    au!

    au FileType python setl softtabstop=4 shiftwidth=4
    au FileType python setl foldmethod=indent foldnestmax=2 foldlevel=1

    " Use ";h" to add file header.
    au FileType python nnoremap <buffer> <LocalLeader>h ggO#
                \ Author: Will Chao <nerdzzh@gmail.com><CR>
                \Filename: <C-R>=expand('%:p:t')<CR><CR>
                \Last Change: <C-R>=strftime('%x %X %z')<CR><CR>
                \Brief: <C-R>=EatNextWhiteChar()<CR>
aug end

" }}}
" QuickFix ----------------- {{{

aug ft_qf
    au!
    au FileType qf setl colorcolumn=0 nolist nocursorline nowrap tw=0
aug end

" }}}
" Sh ----------------------- {{{

aug ft_sh
    au!

    au FileType sh setl softtabstop=2 shiftwidth=2
    au FileType sh setl foldmethod=marker foldmarker={{{,}}}
    au FileType sh setl formatoptions-=o

    " Use ";h" to add file header.
    au FileType sh nnoremap <buffer> <LocalLeader>h ggO
                \#!/usr/bin/env bash<CR>
                \# Author: Will Chao <nerdzzh@gmail.com><CR>
                \Filename: <C-R>=expand('%:p:t')<CR><CR>
                \Last Change: <C-R>=strftime('%x %X %z')<CR><CR>
                \Brief: <C-R>=EatNextWhiteChar()<CR>
aug end

" }}}
" Tmux --------------------- {{{

aug ft_tmux
    au!
    au FileType tmux setl softtabstop=2 shiftwidth=2 formatoptions-=o
aug end

" }}}
" Vim ---------------------- {{{

aug ft_vim
    au!

    au FileType vim setl softtabstop=4 shiftwidth=4
    au FileType vim setl foldmethod=marker foldmarker={{{,}}}
    au FileType vim setl formatoptions-=o

    " Use ";h" to add file header.
    au FileType vim nnoremap <buffer> <LocalLeader>h ggO"
                \ Author: Will Chao <nerdzzh@gmail.com><CR>
                \Filename: <C-R>=expand('%:p:t')<CR><CR>
                \Last Change: <C-R>=strftime('%x %X %z')<CR><CR>
                \Brief: <C-R>=EatNextWhiteChar()<CR>

    " Use ";r" to source current script.
    au FileType vim nnoremap <buffer> <LocalLeader>r :so %<CR>
aug end

" }}}
" Vue ---------------------- {{{

aug ft_vue
    au!

    au FileType vue setl softtabstop=2 shiftwidth=2
    au FileType vue setl formatoptions+=l
    au FileType vue setl foldmethod=manual

    " Use ";f" to fold current tag.
    au FileType vue nnoremap <buffer> <LocalLeader>f Vatzf

    " Use ";h" to add file header.
    au FileType vue nnoremap <buffer> <LocalLeader>h ggO<!--<CR><C-D>
                \Author: Will Chao <nerdzzh@gmail.com><CR>
                \Filename: <C-R>=expand('%:p:t')<CR><CR>
                \Last Change: <C-R>=strftime('%x %X %z')<CR><CR>
                \Brief: %<CR>--><Esc>:let _s=@/<CR>?%<CR>:let @/=_s<CR>
                \:noh<CR>a<BS><C-R>=EatNextWhiteChar()<CR>

    " Use ";i" to indent current tag.
    au FileType vue nnoremap <buffer> <LocalLeader>i Vat=

    " Use ";s" to add semicolon to eol.
    au FileType vue nnoremap <buffer> <LocalLeader>s A;<Esc>
aug end

" }}}
" XML ---------------------- {{{

aug ft_xml
    au!

    au FileType xml setl softtabstop=2 shiftwidth=2
    au FileType xml setl formatoptions+=l
    au FileType xml setl foldmethod=manual

    " Use ";f" to fold current tag.
    au FileType xml nnoremap <buffer> <LocalLeader>f Vatzf

    " Use ";h" to add file header.
    au FileType xml nnoremap <buffer> <LocalLeader>h ggO<!--<CR><C-D>
                \Author: Will Chao <nerdzzh@gmail.com><CR>
                \Filename: <C-R>=expand('%:p:t')<CR><CR>
                \Last Change: <C-R>=strftime('%x %X %z')<CR><CR>
                \Brief: %<CR>--><Esc>:let _s=@/<CR>?%<CR>:let @/=_s<CR>
                \:noh<CR>a<BS><C-R>=EatNextWhiteChar()<CR>

    " Use ";i" to indent current tag.
    au FileType xml nnoremap <buffer> <LocalLeader>i Vat=
aug end

" }}}
" YAML --------------------- {{{

aug ft_yaml
    au!

    au FileType yaml setl softtabstop=2 shiftwidth=2
    au FileType yaml setl foldmethod=indent foldnestmax=2
    au FileType yaml setl formatoptions-=o

    " Use ";h" to add file header.
    au FileType yaml nnoremap <buffer> <LocalLeader>h ggO#
                \ Author: Will Chao <nerdzzh@gmail.com><CR>
                \Filename: <C-R>=expand('%:p:t')<CR><CR>
                \Last Change: <C-R>=strftime('%x %X %z')<CR><CR>
                \Brief: <C-R>=EatNextWhiteChar()<CR>
aug end

" }}}

" }}}
" Mini Plugins ----------------------------- {{{

" Line Return -------------- {{{
" Make sure Vim returns to the same line when you reopen a file.

aug line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line('$') |
                \   exe 'norm! g`"zvzz' |
                \ endif
aug end

" }}}
" Update Timestamps -------- {{{

fu! s:UpdateTimestamps() "{{{
    if &modified
        " Save cursor position.
        let save_cursor = getpos('.')

        " Substitution applies to the first 10 lines (or less).
        let line_range  = min([10, line('$')])

        " Excludes timestamp position from jump list.
        keepjumps exe '1,' .
                    \ line_range .
                    \ 's@^\(.\{,10}Last Change: \).*@\1' .
                    \ strftime('%x %X %z') .
                    \ '@e'

        " Remove timestamp search pattern from search history.
        call histdel('search', -1)

        " Restore last search pattern.
        let @/ = histget('search', -1)

        " Restore cursor position.
        call setpos('.', save_cursor)
    endif
endfu "}}}

command! -nargs=0 UpdateTimestamps :silent! call <SID>UpdateTimestamps()<CR>

aug timestamp
    au!
    au BufWritePre * UpdateTimestamps
aug end

" }}}

" }}}
" Utils ------------------------------------ {{{

" Eat Next White Char ------ {{{

fu! EatNextWhiteChar() "{{{
    let c = nr2char(getchar(0))
    return c =~# '\s' ? '' : c
endfu "}}}

" }}}

" }}}
