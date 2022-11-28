" ============================================================================
"
	set nocompatible

	let vInstalled=1
	let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
	if !filereadable(vundle_readme)
		echo "Installing Vundle..."
		echo ""
		silent !mkdir -p ~/.vim/bundle
		silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
		let vInstalled=0
	endif
	filetype off
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()

	Bundle 'gmarik/vundle'
" ============================================================================

" " Snippets manager (SnipMate), dependencies, and snippets repo
Bundle 'honza/vim-snippets'
""Bundle 'garbas/vim-snipmate'
Bundle 'vim-airline/vim-airline-themes'

"Bundle 'sirver/ultisnips'
"	let g:UltiSnipsEditSplit = 'vertical'
"	let g:tex_flavor = "latex"
"	let g:UltiSnipsSnippetsDir = expand("$XDG_CONFIG_HOME/vim/ultisnips")
"	let g:UltiSnipsSnippetDirectories = ["UltiSnips", "ultisnips"]
	"let g:UltiSnipsExpandTrigger = "<C-L>"
	"let g:UltiSnipsJumpForwardTrigger = "<C-L>"
	"let g:UltiSnipsJumpBackwardTrigger = "<C-H>"
"	let g:UltiSnipsExpandTrigger = "<tab>"
"	let g:UltiSnipsJumpForwardTrigger = "<tab>"
"	let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
"	let g:UltiSnipsUsePythonVersion = 2

"Bundle 'ervandew/supertab'
"	let g:SuperTabDefaultCompletionType = '<C-n>'

"Bundle 'valloric/YouCompleteMe'
" go to ~/.vim/bundle/YouCompleteMe && ./install.sh --clang-completer
"	let g:ycm_extra_conf_globlist = ['~/src/*','/mnt/data/src/*']
"	let g:ycm_global_ycm_extra_conf = expand('$XDG_CONFIG_HOME/vim/ycm_extra_conf.py')
"	let g:ycm_extra_conf_vim_data = ['getcwd()']
"	let g:ycm_add_preview_to_completeopt = 1
"	let g:ycm_autoclose_preview_window_after_insertion = 1
	"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
	"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"	let g:ycm_key_list_select_completion = ['<C-n>']
"	let g:ycm_key_list_previous_completion = ['<C-p>']


" post text to gist.github.com
Bundle 'vim-scripts/Gist.vim'

" Python and PHP Debugger
Bundle 'jaredly/vim-debug'

" " Better file browser
Bundle 'scrooloose/nerdtree'
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" " Code commenter
Bundle 'scrooloose/nerdcommenter'

" " Class/module browser
Bundle 'majutsushi/tagbar'

" The Silver Searcher
Bundle 'rking/ag.vim'
" make sure to install silver_searcher in the 'os' "

	if executable('ag')
		set grepprg=ag\ --nogroup\ --nocolor
		set grepformat=%f:%l:%c%m
	endif "

	nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

	" bind \ (backward slash) to grep shortcut
	command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
	nnoremap \ :Ag<SPACE>


"Bundle 'mileszs/ack.vim'
"	if executable('ag')
"	  let g:ackprg = 'ag --vimgrep'
"	endif

" " Code and files fuzzy finder
Bundle 'kien/ctrlp.vim'

	set shell=/bin/bash
	let g:ctrlp_map = '<c-\>'
	let g:ctrlp_cmd = 'CtrlP'

	let g:ctrlp_working_path_mode = 'ra'

	let g:ctrlp_use_caching = 0
	let g:ctrlp_match_window_bottom = 0
	let g:ctrlp_match_window_reversed = 0
	let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
	let g:ctrlp_dotfiles = 1

	let g:ctrlp_match_window = 'bottom,order:ttb'
	let g:ctrlp_switch_buffer = 0
	"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
	let g:ctrlp_user_command = 'find %s -type f'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
	if executable('ag')
		" Use Ag over Grep
	set grepprg=ag\ --nogroup\ --nocolor
	" Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
	let g:ctrlp_user_command = 'ag -l -U --nocolor -i --silent -g %s
		\ --ignore .git
		\ --ignore .svn
		\ --ignore .hg
		\ --ignore .DS
		\ --ignore "**/*.pyc"
		\ -g ""'
endif"


" " Extension to ctrlp, for fuzzy command finder
Bundle 'fisadev/vim-ctrlp-cmdpalette'

" " Zen coding
Bundle 'mattn/emmet-vim'

" " Git integration
Bundle 'motemen/git-vim'

" " Tab list panel
Bundle 'kien/tabman.vim'

" " Terminal Vim with 256 colors colorscheme
Bundle 'fisadev/fisa-vim-colorscheme'

" " Consoles as buffers
Bundle 'rosenfeld/conque-term'

" " Pending tasks list
Bundle 'fisadev/FixedTaskList.vim'

" " Surround
Bundle 'tpope/vim-surround'

" " Autoclose
Bundle 'Townk/vim-autoclose'

" " Indent text object
Bundle 'michaeljsmith/vim-indent-object'

" " Python mode (indentation, doc, refactor, lints, code checking, motion and
" " operators, highlighting, run and ipdb breakpoints)
Bundle 'klen/python-mode'
" " Better autocompletion

	""""""""""""""""""""Python-mode
	" Activate rope
	" Keys:
	" K             Show python docs
	" <Ctrl-Space>  Rope autocomplete
	" <Ctrl-c>g     Rope goto definition
	" <Ctrl-c>d     Rope show documentation
	" <Ctrl-c>f     Rope find occurrences
	" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
	" [[            Jump on previous class or function (normal, visual, operator modes)
	" ]]            Jump on next class or function (normal, visual, operator modes)
	" [M            Jump on previous class or method (normal, visual, operator modes)
	" ]M            Jump on next class or method (normal, visual, operator modes)


	"let g:pymode_rope = 1 .... use jedi-vim for autocompletion tool
	let g:pymode_rope = 0

	" Documentation
	let g:pymode_doc = 1
	let g:pymode_doc_key = 'K'
	"Linting
	let g:pymode_lint = 1
	let g:pymode_lint_checker = "pyflakes,pep8"
	" Auto check on save
	let g:pymode_lint_write = 1
	" Support virtualenv
	let g:pymode_virtualenv = 1
	" Enable breakpoints plugin
	let g:pymode_breakpoint = 1
	let g:pymode_breakpoint_bind = '<leader>b'
	" syntax highlighting
	let g:pymode_syntax = 1
	let g:pymode_syntax_all = 1
	let g:pymode_syntax_indent_errors = g:pymode_syntax_all
	let g:pymode_syntax_space_errors = g:pymode_syntax_all
	" Don't autofold code
	let g:pymode_folding = 0



"Bundle 'Shougo/neocomplcache.vim'
"Bundle 'Shougo/neocomplete'

	"Note: This option must set it in .vimrc(_vimrc). NOT IN .gvimrc(_gvimrc)!
	"" Disable AutoComplPop.
"	let g:acp_enableAtStartup = 0
	" "Use neocomplete.
"	let g:neocomplete#enable_at_startup = 1
	" Use smartcase.
"	let g:neocomplete#enable_smart_case = 1
	" Set minimum syntax keyword length.
"	let g:neocomplete#sources#syntax#min_keyword_length = 3
"	let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
	" Define dictionary.
"	let g:neocomplete#sources#dictionary#dictionaries = { 'default' : '', 'vimshell' : $HOME.'/.vimshell_hist', 'scheme' : $HOME.'/.gosh_completions' }
	" Define keyword.

"	if !exists('g:neocomplete#keyword_patterns')
"		let g:neocomplete#keyword_patterns = {}
"	endif

"	let g:neocomplete#keyword_patterns['default'] = '\h\w*'
	" Plugin key-mappings.
"	inoremap <expr><C-g> neocomplete#undo_completion()
"	inoremap <expr><C-l> neocomplete#complete_common_string()
	" Recommended key-mappings.
	" <CR>: close popup and save indent.
"	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"	function! s:my_cr_function()
"	return neocomplete#close_popup() . "\<CR>"
	" For no inserting <CR> key.
	"return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"	endfunction
	" <TAB>: completion.
"	inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
	" <C-h>, <BS>: close popup and delete backword char.
"	inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"	inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"	inoremap <expr><C-y> neocomplete#close_popup()
"	inoremap <expr><C-e> neocomplete#cancel_popup()
	" Close popup by <Space>.
	"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() :
	"\<Space>"
	" For cursor moving in insert mode(Not recommended)
	"inoremap <expr><Left> neocomplete#close_popup() . "\<Left>"
	"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
	"inoremap <expr><Up> neocomplete#close_popup() . "\<Up>"
	"inoremap <expr><Down> neocomplete#close_popup() . "\<Down>"
	" Or set this.
	"let g:neocomplete#enable_cursor_hold_i = 1
	" Or set this.
	"let g:neocomplete#enable_insert_char_pre = 1
	" AutoComplPop like behavior.
	"let g:neocomplete#enable_auto_select = 1
	" Shell like behavior(not recommended).
	"set completeopt+=longest
	"let g:neocomplete#enable_auto_select = 1
	"let g:neocomplete#disable_auto_complete = 1
	"inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
	" Enable omni completion.
"	autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"	autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"	autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"	autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"	autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
	" Enable heavy omni completion.
"	if !exists('g:neocomplete#sources#omni#input_patterns')
"	let g:neocomplete#sources#omni#input_patterns = {}
"	endif
	"let g:neocomplete#sources#omni#input_patterns.php = '[^.t]->\h\w*\|\h\w*::'
	"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]*\t]\%(\.\|->\)'
	"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]*\t]\%(\.\|->\)\|\h\w*::'
	" For perlomni.vim setting.
	" https://github.com/c9s/perlomni.vim
"	let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"	if !exists('g:neocomplete#force_omni_input_patterns')
"	let g:neocomplete#force_omni_input_patterns = {}
"	endif
"	let g:neocomplete#force_overwrite_completefunc = 1
"	let g:neocomplete#force_omni_input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"	let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"	let g:neocomplete#force_omni_input_patterns.objc = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"	let g:neocomplete#force_omni_input_patterns.objcpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"	let g:clang_complete_auto = 0
"	let g:clang_auto_select = 0
	"let g:clang_use_library = 1 "

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'

" " Automatically sort python imports
"Bundle 'fisadev/vim-isort'

" " Drag visual blocks arround
Bundle 'fisadev/dragvisuals.vim'

" " Window chooser
Bundle 't9md/vim-choosewin'

" " Python and other languages code checker
Bundle 'scrooloose/syntastic'

	let g:syntastic_always_populate_loc_list=1
	let g:syntastic_error_symbol = '✗'
	let g:syntastic_style_error_symbol = '✠'
	let g:syntastic_warning_symbol = '∆'
	let g:syntastic_style_warning_symbol = '≈'
	let g:syntastic_tex_checkers=['chktex']
	let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": [], "passive_filetyptes":[]}

" " Paint css colors with the real color
Bundle 'lilydjwg/colorizer'

" " Search results counter
Bundle 'IndexedSearch'

" " XML/HTML tags navigation
Bundle 'matchit.zip'

" " Gvim colorscheme
Bundle 'Wombat'

" " Yank history navigation
Bundle 'YankRing.vim'

Bundle 'nathanaelkane/vim-indent-guides'
	autocmd VimEnter * IndentGuidesEnable
	let g:indent_guides_auto_colors = 0
	"let g:indent_guides_color_change_percent = 10
	"let g:indent_guides_guide_size = 2
	"let g:indent_guides_start_level = 2

	autocmd VimResized,VimLeave,VimLeavePre,VimEnter,Colorscheme * :hi IndentGuidesOdd	ctermbg=234		ctermfg=4
	autocmd VimResized,VimLeave,VimLeavePre,VimEnter,Colorscheme * :hi IndentGuidesEven	ctermbg=236		ctermfg=4

	autocmd BufDelete,BufEnter,FileType,BufWinEnter,BufWinLeave * :hi IndentGuidesOdd	ctermbg=234		ctermfg=4
	autocmd BufDelete,BufEnter,FileType,BufWinEnter,BufWinLeave * :hi IndentGuidesEven	ctermbg=236		ctermfg=4

Bundle 'yonchu/accelerated-smooth-scroll'

Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-markdown'

Bundle 'davidhalter/jedi-vim'

Bundle 'Lokaltog/vim-easymotion'
Bundle 'tristen/vim-sparkup'

Bundle 'wincent/Command-T'

Bundle 'jmcantrell/vim-virtualenv'

Bundle 'tpope/vim-repeat'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'airblade/vim-gitgutter'
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'
Bundle 'fweep/vim-tabber'

" tComment
Bundle 'vim-scripts/tComment'
	map <leader>c <c-_><c-_>
	vmap <Tab> >gv
	vmap <S-Tab> <gv

Bundle 'vim-scripts/taglist.vim'

" ============================================================================
"
"	statusline/bufferline
"

"Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

"" OR

" " irlinng/vim-bufferline'
" " let g:/bufferline_active_buffer_left = 'e


	" echo -e "\ue0a0\ue0a1\ue0a2\ue0b0\ue0b1\ue0b2"
	"
	Bundle 'bling/vim-airline'
		let g:airline#extensions#tabline#enabled = 1
		let g:airline#extensions#tabline#left_sep = ''
		let g:airline#extensions#tabline#left_alt_sep = ''
		let g:airline#extensions#tabline#right_sep = ''
		let g:airline#extensions#tabline#right_alt_sep = ''
		let g:airline_powerline_fonts = 1
		let g:airline#extensions#syntastic#enabled = 1
		let g:airline_theme='powerlineish'
		"let g:airline#extensions#whitespace#enabled = 1
		let g:airline#extensions#whitespace#mixed_indent_algo = 1
		"let g:airline#extensions#whitespace#symbol = '!'

	" show all tabs /\t
	" " show all whitespace /\s\+$
	" " show all spaces before a tab / \+\ze\t


" ============================================================================
" Install plugins the first time vim runs
if vInstalled == 0
	echo "Installing Bundles, please ignore key map error messages"
	echo ""
	:BundleInstall
endif
" ============================================================================


" how to capture keyseq --> [insert mode] Control-v

"set relativenumber


set autoread

" wild-menu
	set wildmenu
	set wildmode=longest:full,full
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
	set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows "

set lazyredraw
set showmatch
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

" set mouse to scroll in normal and visual mode, pase in insert mode with
" console mouse
	set mouse=nv

" buffers
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
	"nmap <ESC>[7^	<Home>
	"nnoremap <Home> gg<CR>
	" control pagedown last buffer
	"nmap <ESC>[8^ <End>
	"nnoremap <End> bd<CR>


"switch to alternate file
	map <C-Tab> :bnext<cr>
	map <C-S-Tab> :bprevious<cr>



" Folding
	set foldenable " Turn on folding
	set foldmethod=indent " Fold on the indent (damn you python)
	set foldlevel=100 " Don't autofold anything (but I can still fold manually)
	set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds
	function SimpleFoldText() " {
		return getline(v:foldstart).' '
	endfunction " }
	set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)


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
	" set noswapfile

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

"Invisible character colors
"highlight NonText guifg=#4a4a59
"highlight SpecialKey guifg=#4a4a59

highlight NonText guifg=#44efef guibg=#ffffff
highlight SpecialKey guifg=#44efef guibg=#ffffff

highlight LineNr ctermfg=green ctermbg=black

set ts=4 sts=4 sw=4 noexpandtab
