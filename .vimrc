set nocompatible
filetype plugin indent on
set autoindent


" control pageup next buffer
nmap <ESC>[5^	<C-PageUp>
nnoremap <C-PageUp> :bnext!<CR>
" control pagedown last buffer
nmap <ESC>[6^ <C-PageDown>
nnoremap <C-PageDown> :bprevious!<CR>
" control del drop buffer
nmap <ESC>[3^ <C-End>
nnoremap <C-End> :bd<CR>

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

"Bundle 'valloric/YouCompleteMe'
Bundle 'Shougo/neocomplete'
Bundle 'davidhalter/jedi-vim'
"Bundle ''
"Bundle ''

"Bundle 'wincent/Command-T'

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
map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

Bundle 'honza/vim-snippets'

Bundle 'jmcantrell/vim-virtualenv'

"requires vim with python2
"Bundle 'Valloric/YouCompleteMe'

Bundle 'rking/ag.vim'

Bundle 'kien/ctrlp.vim'

Bundle 'tpope/vim-repeat'

Bundle 'plasticboy/vim-markdown'

Bundle 'bronson/vim-trailing-whitespace'

Bundle 'airblade/vim-gitgutter'

Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'

Bundle 'fweep/vim-tabber'

Bundle 'vim-scripts/tComment'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/taglist.vim'

" powerline / UI

" airline
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme='powerlineish'
"let g:airline#extensions#whitespace#enabled = 1
"let g:airline#extensions#whitespace#mixed_indent_algo = 1
"let g:airline#extensions#whitespace#symbol = '!'

" show all tabs /\t
" show all whitespace /\s\+$
" show all spaces before a tab / \+\ze\t


"powerline
" Bundle 'bling/vim-bufferline'
" let g:bufferline_active_buffer_left = '['
" let g:bufferline_active_buffer_right = ']'
" let g:bufferline_active_modified = '+'
" let g:bufferline_show_bufnr = 1
" let g:bufferline_rotate = 1
" let g:bufferline_fixed_index = 1
" let g:bufferline_solo_highlight = 1

" set rtp+=~/.powerline/powerline/bindings/vim/

"switch to alternate file
map <C-Tab> :bnext<cr>
map <C-S-Tab> :bprevious<cr>

set encoding=utf-8

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

"set mouse+=a
set mouse=a


set paste

set ignorecase
set hlsearch

set mousemodel=extend

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
"set tabline=%!tabber#TabLine()
" set showtabline=2
" set hidden
" set switchbuf=useopen,usetab

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>
nnoremap <Space> za

nmap <leader>l :set list!<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"Invisible character colors
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

highlight NonText guifg=#44efef guibg=#ffffff
highlight SpecialKey guifg=#44efef guibg=#ffffff

highlight LineNr ctermfg=green ctermbg=black

set ts=4 sts=4 sw=4 noexpandtab

" function! SummarizeTabs()
" 	try
" 		echohl ModeMsg
" 		echon 'tabstop='.&l:ts
" 		echon ' shiftwidth='.&l:sw
" 		echon ' softtabstop='.&l:sts
" 		if &l:et
" 		echon ' expandtab'
" 		else
" 		echon ' noexpandtab'
" 		endif
" 		finally
" 		echohl None
" 		endtry
" endfunction
"
