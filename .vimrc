set nocompatible
filetype plugin indent on
set autoindent
set encoding=utf-8

" how to capture keyseq --> [insert mode] Control-v

" control pageup next buffer
nmap <ESC>[5^	<C-PageUp>
nnoremap <C-PageUp> :bnext!<CR>
" control pagedown last buffer
nmap <ESC>[6^ <C-PageDown>
nnoremap <C-PageDown> :bprevious!<CR>
" control del drop buffer
nmap <ESC>[3^ <C-Del>
nnoremap <C-Del> :bd<CR>

nmap <ESC>[2^ <C-Insert>
nnoremap <C-Insert> :set number! \| :set list! \| :GitGutterToggle<CR>

" control pageup next buffer
nmap <ESC>[7^	<Home>
nnoremap <Home> gg<CR>
" control pagedown last buffer
nmap <ESC>[8^ <End>
nnoremap <End> G<CR>


"set rtp+=~/.fzf
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

"Bundle 'djoshea/vim-autoread'
"autocmd CursorHold,CursorHoldI,BufEnter,BufWinEnter,CursorHold filename * checktime!
set autoread

" FUZZY FINDER / CTRL-P
Bundle 'kien/ctrlp.vim'

nnoremap <C-P> :CtrlP
"nmap <C-p> :CtrlP
"nmap <C-b> :CtrlPBuffer<CR>

let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0


Bundle 'nathanaelkane/vim-indent-guides'
autocmd VimEnter * IndentGuidesEnable
"let g:indent_guides_auto_colors = 1
"let g:indent_guides_color_change_percent = 10
"let g:indent_guides_guide_size = 2
"let g:indent_guides_start_level = 2

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd	ctermbg=234		ctermfg=4
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven	ctermbg=236		ctermfg=4

autocmd BufEnter,FileType,BufWinEnter,BufWinLeave * :hi IndentGuidesOdd		ctermbg=234		ctermfg=4
autocmd BufEnter,FileType,BufWinEnter,BufWinLeave * :hi IndentGuidesEven	ctermbg=236		ctermfg=4

" other bundles ...
Bundle 'yonchu/accelerated-smooth-scroll'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'

"Bundle 'valloric/YouCompleteMe'
Bundle 'Shougo/neocomplete'
Bundle 'davidhalter/jedi-vim'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'tristen/vim-sparkup'
"Bundle ''

Bundle 'wincent/Command-T'

"Bundle 'junegunn/fzf'

Bundle 'marcweber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'scrooloose/syntastic'

" NERDTree
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
"no files specified on startup
"autocmd vimenter * if !argc() | NERDTree | endif
"some file specified
"autocmd vimenter * NERDTree
"map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Bundle 'honza/vim-snippets'
Bundle 'jmcantrell/vim-virtualenv'

"requires vim with python2
"Bundle 'Valloric/YouCompleteMe'

Bundle 'rking/ag.vim'
Bundle 'tpope/vim-repeat'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'airblade/vim-gitgutter'
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'
Bundle 'fweep/vim-tabber'
Bundle 'vim-scripts/tComment'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/taglist.vim'

" powerline / UI

set rtp+=~/.local/lib64/python2.7/site-packages/powerline/bindings/vim/

"switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

set laststatus=2
set fillchars+=stl:\ ,stlnc:\
syntax enable
set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:Powerline_symbols='fancy'
colorscheme colors
set nocompatible
set guifont=Menlo\ For\ Powerline
set number
set ttimeoutlen=0

set nowrap

" tComment
map <leader>c <c-_><c-_>

vmap <Tab> >gv
vmap <S-Tab> <gv

" Folding
set foldenable " Turn on folding
set foldmethod=indent " Fold on the indent (damn you python)
set foldlevel=100 " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
function SimpleFoldText() " {
	return getline(v:foldstart).' '
    endfunction " }
set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)

" set mouse to scroll in normal and visual mode, pase in insert mode with
" console mouse
set mouse=nv
"set paste
"set mousemodel=extend

set ignorecase
set hlsearch

" backspace
set backspace=indent,eol,start

" arrow keys last line ...
set whichwrap+=<,>,[,]

set list
set listchars=tab:▸\ ,eol:¬

" UNDO
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/tmp/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp/swap
set backupskip=~/tmp/*
set backup
set writebackup
set noswapfile

" session management
let g:session_direcotry = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" tabs
" --- vim-tabber
set tabline=%!tabber#TabLine()
set showtabline=2
set hidden
set switchbuf=useopen,usetab

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <Space> za

nmap <leader>l :set list!<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

nnoremap <C-p> :CtrlP<CR>

"Invisible character colors
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

highlight NonText guifg=#44efef guibg=#ffffff
highlight SpecialKey guifg=#44efef guibg=#ffffff

highlight LineNr ctermfg=green ctermbg=black

set ts=4 sts=4 sw=4 noexpandtab
