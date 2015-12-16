" Use Vim settings, rather then Vi settings.
" This must be first, because it changes other options as a side effect.
set nocompatible

" Plugin install
" https://github.com/junegunn/vim-plug
" -----------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

" Theme
Plug 'morhetz/gruvbox'

" tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'

" Finding and replacing
Plug 'mileszs/ack.vim'
Plug 'henrik/vim-qargs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Nerdtree
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'

" Buffers
Plug 'schickling/vim-bufonly'
Plug 'jlanzarotta/bufexplorer'
Plug 'moll/vim-bbye'
Plug 'wesQ3/vim-windowswap'

" Language pack
Plug 'sheerun/vim-polyglot'

" Editing
Plug 'Raimondi/delimitMate'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides', {'on': 'IndentGuidesToggle'}
Plug 'tpope/vim-repeat'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'

" General
Plug 'editorconfig/editorconfig-vim'
Plug 'sjl/vitality.vim'
Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
Plug 'regedarek/ZoomWin'
Plug 'embear/vim-localvimrc'

" Refactoring
Plug 'terryma/vim-multiple-cursors'
Plug 'PeterRincker/vim-argumentative'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tpope/vim-surround'

" Copy/Paste behaviour
Plug 'svermeulen/vim-easyclip'
Plug 'ConradIrwin/vim-bracketed-paste'

" Sessions
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" HTML/CSS
Plug 'ap/vim-css-color', {'for': 'css'}
Plug 'mattn/emmet-vim'

" Status bar
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'

" Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Autocomplete
Plug 'jordwalke/AutoComplPop'
Plug 'jordwalke/VimCompleteLikeAModernEditor'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" JavaScript
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'sheerun/yajs.vim'
Plug 'mxw/vim-jsx'

call plug#end()

"  Plugin config
" -----------------------------------------------------------------------------

" Undotree
let g:undotree_WindowLayout = 2

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Sessions
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

" Easymotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
nmap ss <Plug>(easymotion-s)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_aggregate_errors = 1
let g:syntastic_html_tidy_exec = 'tidy5'
let g:syntastic_loc_list_height = 5

" Set checkers
let g:syntastic_scss_checkers = ['']
let g:syntastic_css_checkers = ['stylelint']
let g:syntastic_javascript_checkers = ['eslint']

" NERD tree
let g:NERDTreeWinSize = 40

" Local vimrc
" Stop it asking for confirmation each time
let g:localvimrc_ask = 0

" fzf
let g:fzf_height = '20%' " Set height to something smaller

" Window swap
let g:windowswap_map_keys = 0 " prevent default bindings

" gitgutter
let g:gitgutter_realtime = 100
let g:gitgutter_eager = 100

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag with ack.vim - https://github.com/ggreer/the_silver_searcher#vim
  let g:ackprg = 'ag --smart-case --nogroup --nocolor --column'
endif

" delimitMate
let delimitMate_expand_cr = 1

" vim-airline
let g:airline_theme = 'wombat'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename

" Tmuxline
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : ['#(tmux-mem-cpu-load --interval 2)', '#(ipconfig getifaddr en0)', '#(battery -p -t)'],
      \'z'    : ['%R', '%d-%m-%Y'],
      \'options' : {'status-justify' : 'left'}}

" JS lib syntax
let g:used_javascript_libs = 'underscore,jquery,react,requirejs,jasmine,chai'

" Buf explorer
let g:bufExplorerShowNoName = 1 " Show buffers with no name

"  Vim config
" -----------------------------------------------------------------------------

" Set space to leader
let mapleader = ' '

" Theme
colorscheme gruvbox
set background=dark
syntax on

" Turn off swapfiles
set noswapfile
set nobackup
set nowb

filetype plugin on
filetype indent on

" Allow editing of binary files
" Must be set before expandtab
" http://stackoverflow.com/a/26901774
set binary

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Use `indent` based folding
set foldmethod=indent
set foldlevelstart=10

" Line numbers
set number

" With :set hidden, opening a new file when the current buffer has unsaved
" changes causes files to be hidden instead of closed
set hidden
" Briefly move the cursor to the matching brace
set showmatch

" Lazyredraw attempts to solve Vim lag by reducing the amount of
" processing required. When enabled, any action that is not typed
" will not cause the screen to redraw
set lazyredraw

" Don't display the current mode (Insert, Visual, Replace)
" in the status line. This info is already shown in the
" Airline status bar.
set noshowmode

" Stop vim trying to syntax highlight long lines, typically found in minified
" files. This greatly reduces lag yet is still wide enough for large displays
set synmaxcol=500

" Highlight current line
set cursorline

" Various settings to control spaces and indents
set smartindent
set cindent
set cino=(0,W4
set softtabstop=2
set shiftwidth=2

set updatetime=650

" Don't wrap lines
set nowrap
" Use spaces, not tabs
set expandtab
" Keep the cursor in the same place when switching buffers
set nostartofline
" Show col and line position in the statusbar
set ruler

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Highlight searches
set hlsearch
set incsearch

" Highlight tailing whitespace
set list listchars=tab:\ \ ,trail:·

" Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Spell check
set spelllang=en
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast

" Fix background not filling window correctly when moving panes around with
" tmux
if &term =~ '256color'
  " disable Background Color Erase (BCE)
  set t_ut=
endif

" Eliminate delay when switching modes
set timeoutlen=1000 ttimeoutlen=0

" Auto save changes before switching buffer
set autowrite
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=.,$TEMP " Stop the swp file warning
if exists("&undodir")
  set undodir=~/.vim/undo
endif

if has("persistent_undo")
  set undodir=~/.vim/undo
  set undofile
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

" Ignore case of searches
set ignorecase
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Auto reload files on change
set autoread

" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set title
" Show the (partial) command as it’s being typed
set showcmd

" Use relative line numbers
if exists("&relativenumber")
  set relativenumber
  au BufReadPost * set relativenumber
endif

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" Remap annoying mistakes to something useful
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa q
cnoreabbrev Qall qall

" Key mappings
" -----------------------------------------------------------------------------

" Remap emmet
imap hh <C-y>,

" Save file
nnoremap <leader>w :w<cr>

" Clone paragraph
noremap cp yap<S-}>p

" Make `Y` work from the cursor to the end of line
nnoremap Y y$

" Easier shortcuts to jump to start/end of line
nnoremap H ^
nnoremap L $

" Split
noremap <leader>h :<C-u>split<cr>
noremap <leader>v :<C-u>vsplit<cr>

" Spellcheck
map <F6> :setlocal spell!<cr>

" Close buffer
nnoremap <Leader>q :Bdelete<cr>

" UndoTree
nnoremap <f5> :UndotreeToggle<cr>

" Clear search (highlight)
nnoremap <silent> <leader>k :noh<cr>

" Open new buffers
" Single window
nnoremap <leader>nb :enew<cr>
nnoremap <leader><space> :BufExplorer<cr>

" Cycle through location list
nnoremap [l :lprev<cr>
nnoremap ]l :lnext<cr>

" Cycle through buffers
nnoremap <leader>] :bnext<cr>
nnoremap <leader>[ :bprev<cr>

" Press enter for newline without insert
nmap <S-Enter> O<Esc>
nmap <cr> o<Esc>

" NERD tree
nmap <leader>t :NERDTreeFind<cr>

" fzf
nnoremap <c-p> :FZF<cr>
nnoremap <c-i> :Buffers<cr>
nnoremap <c-g> :Commits<cr>

" Window swap
nnoremap <silent> <leader>sw :call WindowSwap#EasyWindowSwap()<CR>

" IndentGuides
" Add this here because this plugin is loaded ondemand so this mapping is not
" present on initial load
nmap <leader>ig :IndentGuidesToggle<cr>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Search with Ack
nnoremap <leader>a :Ack!<space>-Q<space>

" Replace with Qdo
nnoremap <leader>r :Qdo<space> :%s/

" vim-tmux-navigator seems to have issues with going left, so bind it
" manually here. Other directions work fine out the box
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

noremap <leader>ss :call StripWhitespace()<cr>

" Automatic commands
if has("autocmd")
  " Resize splits when vim changes size (like with tmux opening/closing)
  autocmd VimResized * wincmd =

  " Override some syntaxes so things look better
  autocmd BufNewFile,BufRead *.html  set syntax=html
  autocmd BufNewFile,BufRead *.css set syntax=scss

  " Wrap text and turn on spell for markdown files
  autocmd BufNewFile,BufRead *.md setlocal wrap linebreak spell filetype=markdown

  " Automatically wrap at 72 characters and spell check git commit messages
  autocmd FileType gitcommit setlocal textwidth=72
  autocmd FileType gitcommit setlocal spell

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-

  " Periodically check for file changes
  autocmd CursorHold * silent! checktime

  " Move to the top of a git commit
  au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
endif