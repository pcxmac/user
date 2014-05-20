set nocompatible
filetype plugin indent on

set rtp+=~/.fzf
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" other bundles ...

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'

"Bundle 'wincent/Command-T'

Bundle 'junegunn/fzf'

Bundle 'marcweber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'

Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'

Bundle 'honza/vim-snippets'

Bundle 'jmcantrell/vim-virtualenv'

"requires vim with python2
"Bundle 'Valloric/YouCompleteMe'


Bundle 'rking/ag.vim'

Bundle 'kien/ctrlp.vim'

Bundle 'tpope/vim-repeat'

Bundle 'plasticboy/vim-markdown'

Bundle 'airblade/vim-gitgutter'

Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'

Bundle 'fweep/vim-tabber'

Bundle 'vim-scripts/tComment'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'vim-scripts/taglist.vim'


set rtp+=~/.powerline/powerline/bindings/vim/
set encoding=utf-8
set laststatus=2
set fillchars+=stl:\ ,stlnc:\
syntax enable
set background=dark
let g:solarized_termcolors=256
let g:Powerline_symbols='fancy'
colorscheme colors
set nocompatible
set guifont=Menlo\ For\ Powerline
set number
set ttimeoutlen=0

" tComment
map <leader>c <c-_><c-_>


vmap <Tab> >gv
vmap <S-Tab> <gv

"set mouse+=a
set mouse=


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
set ts=6 sts=3 sw=3 noexpandtab


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

"Invisible character colors
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

highlight NonText guifg=#44efef guibg=#ffffff
highlight SpecialKey guifg=#44efef guibg=#ffffff

highlight LineNr ctermfg=green ctermbg=black

" Set tabstop, softtabstop and shiftwidth to the same value

command! -nargs=* Stab call Stab()

function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
	let &l:sts = l:tabstop
	let &l:ts = l:tabstop
	let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction

function! SummarizeTabs()
    try
	echohl ModeMsg
	echon 'tabstop='.&l:ts
	echon ' shiftwidth='.&l:sw
	echon ' softtabstop='.&l:sts
	if &l:et
	    echon ' expandtab'
	    else
	    echon ' noexpandtab'
	endif
	finally
	    echohl None
	    endtry
endfunction

