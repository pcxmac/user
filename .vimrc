set nocompatible
filetype off

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

Bundle 'sjl/gundo.vim'

Bundle 'kien/ctrlp.vim'

Bundle 'tpope/vim-repeat'

Bundle 'plasticboy/vim-markdown'

Bundle 'airblade/vim-gitgutter'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

vmap <Tab> >gv
vmap <S-Tab> <gv

set mouse+=a

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

set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

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

