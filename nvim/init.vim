" - Dependencies: vim-plug, git, python2, python3, ruby, npm, ctags, rbenv,
"     rubocop, vint, bat, ripgrep
" - To generate tags for gems:
"       ```
"       gem install gem-ctags
"       gem ctags
"       ```
" - Use rbenv plugin to Automatically generate ctags for rbenv Ruby stdlibs:
"     https://github.com/tpope/rbenv-ctags
" - Use :checkhealth to ensure dependencies installed
" - :PlugInstall
" - Restart vim

augroup vimrc
	autocmd!
augroup END

scriptencoding utf-8


" =======
" Plugins
" =======

call plug#begin(stdpath('data') . '/plugged')

" Mine
Plug 'drzel/vim-scroll-in-place'
Plug 'drzel/vim-repo-edit'
Plug 'drzel/vim-split-line'
Plug 'drzel/vim-scrolloff-fraction'

" Linting
Plug 'w0rp/ale'

" Autocomplete
" Plug 'ajh17/VimCompletesMe'

" Keymappings
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'

" Utilities
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-repeat'

" Grep
Plug 'mhinz/vim-grepper'

" Unix
Plug 'tpope/vim-eunuch'

" Git
Plug 'tpope/vim-git'

" HTML
Plug 'othree/html5.vim'

" Ruby
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-endwise'
Plug 'thoughtbot/vim-rspec'

" QuakeC
Plug 'FortressOne/quakec.vim'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'briancollins/vim-jst'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

" JSON
Plug 'elzr/vim-json'

" nginx
Plug 'chr4/nginx.vim'

" tmux
Plug 'tmux-plugins/vim-tmux'

" Statusline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

" Git
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-rhubarb'

" Alignment
Plug 'junegunn/vim-easy-align'

" Markdown
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'arcticicestudio/nord-vim'

" Text objects
Plug 'wellle/targets.vim'
Plug 'jeetsukumaran/vim-indentwise'

" Text formatting
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-sleuth'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/goyo.vim'

" Colorizer
Plug 'chrisbra/Colorizer'

" Comments
Plug 'tpope/vim-commentary'

" File navigation
Plug 'justinmk/vim-dirvish'
Plug 'pbrisbin/vim-mkdir'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ckarnell/history-traverse'

" Search
Plug 'romainl/vim-cool'

" Scrollbar
" Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Indent guides
Plug 'lukas-reineke/indent-blankline.nvim'

" Cosmetic (devicons must load last)
Plug 'ryanoasis/vim-devicons'

call plug#end()


" ===============
" Plugin settings
" ===============

" fzf
let g:fzf_preview_window = ''

" vim-ruby
let g:ruby_indent_access_modifier_style='normal'

" vim-markdown
let g:markdown_fenced_languages = ['javascript', 'ruby']

" vim-json
let g:vim_json_syntax_conceal = 0

" vim-lightline
" default config: :help lightline-option
" default components: :help g:lightline.component

function! LightLineFileStatus() abort
	let l:ary = []

	if strlen(&filetype)
		let l:ary += [WebDevIconsGetFileTypeSymbol()]
	endif

	let l:ary += [fnamemodify(expand('%'), ':~:.')]

	if &readonly
		let l:ary += ['']
	endif

	if &modified
		let l:ary += ['+']
	endif

	if strlen(gutentags#statusline())
		let l:ary += [gutentags#statusline()]
	endif

	return join(l:ary, ' ')
endfunction

function! GitBranch() abort
	if FugitiveHead() !=# ''
		return ' ' . FugitiveHead()
	else
		return ''
	endif
endfunction

function! LightLineReadonly() abort
endfunction

let g:lightline = {
			\   'colorscheme': 'nord',
			\   'separator': { 'left': '', 'right': '' },
			\   'subseparator': { 'left': '|', 'right': '|' },
			\   'component_function': {
			\     'fugitive_statusline': 'GitBranch',
			\     'll_filestatus': 'LightLineFileStatus'
			\   },
			\   'component_expand': {
			\     'linter_checking': 'lightline#ale#checking',
			\     'linter_infos': 'lightline#ale#infos',
			\     'linter_warnings': 'lightline#ale#warnings',
			\     'linter_errors': 'lightline#ale#errors',
			\     'linter_ok': 'lightline#ale#ok',
			\   },
			\   'component_type': {
			\     'linter_checking': 'right',
			\     'linter_infos': 'right',
			\     'linter_warnings': 'warning',
			\     'linter_errors': 'error',
			\     'linter_ok': 'right',
			\   },
			\   'active': {
			\     'left': [['mode', 'paste'], ['fugitive_statusline'], ['ll_filestatus']],
			\     'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ], ['lineinfo']]
			\   },
			\   'inactive': {
			\     'left': [['ll_filestatus']],
			\     'right': []
			\   },
			\   'mode_map': {
			\     'n': 'N',
			\     'i': 'I',
			\     'R': 'R',
			\     'v': 'V',
			\     'V': 'VL',
			\     "\<C-v>": 'VB',
			\     'c': 'C',
			\     's': 'S',
			\     'S': 'SL',
			\     "\<C-s>": 'SB',
			\     't': 'T'
			\   }
			\ }

" lightline-ale
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129"
let g:lightline#ale#indicator_warnings = "\uf071"
let g:lightline#ale#indicator_errors = "\uf05e"
let g:lightline#ale#indicator_ok = "\uf00c"

" ale
let g:ale_enabled = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" vim-rspec
let g:rspec_command = 'Dispatch bundle exec rspec {spec}'

" vim-dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'

" vim-signify
let g:signify_vcs_list = [ 'git' ]

" history-traverse
let g:history_max_len = 1000

" vim-table-mode
let g:table_mode_corner='|'

" indent-blankline
let g:indent_blankline_char = '▏'
let g:indent_blankline_show_trailing_blankline_indent = v:false
set colorcolumn=1000 " Workaround until https://github.com/neovim/neovim/issues/14209 is fixed


" ============
" Vim settings
" ============

set noshowmode
set number
set nowrap
set hidden
set mouse=a
set incsearch
set ignorecase
set smartcase
set inccommand=nosplit
set list
set listchars=tab:→\ ,trail:·,extends:…,precedes:…
set undofile
set splitbelow
set splitright
set wildmode=longest,list,full
set wildmenu
set fillchars+=vert:│
" set clipboard=unnamedplus

set noexpandtab
set tabstop=4 shiftwidth=4
set autoindent
set nocursorline

function! PresentWorkingDirectory() abort
	return fnamemodify(getcwd(), ':~')
endfunction

set titlestring=%{PresentWorkingDirectory()}


" ========
" Key maps
" ========

" Edit .plan
nnoremap <leader>p :edit ~/.plan<CR>

" Edit vimrc
nnoremap <leader>c :edit $MYVIMRC<CR>

" Toggle spell check
nnoremap <leader>s :set spell!<CR>

" Copy filename
nnoremap <leader>yf :let @" = @%<CR>

" Close all background buffers
nnoremap <leader>x :execute '%bdelete\|edit #\|normal `"'\|bdelete#<CR>

" Yank filename to unnamed register
nmap <leader>yf :let @+=expand("%")<CR>
nmap <leader>yF :let @+=expand("%:p")<CR>

" cd to Workspace
nnoremap <leader>ww :cd ~/Workspace/<CR>

" ===============
" Plugin Key Maps
" ===============

" vim-unimpaired
" see :help unimpaired

" ale
nnoremap <leader>l :ALEToggle<CR>

" fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>fC :BCommits<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fT :BTags<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fr :Rg<CR>

" vim-grepper
nnoremap <leader>gg :Grepper -tool rg -grepprg rg -H --no-heading --vimgrep --smart-case -e<CR>
nnoremap <leader>gf :Grepper -tool rg -grepprg rg -H --no-heading --vimgrep --smart-case --no-ignore --hidden -e<CR>

" vim-easy-align
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

" indentLine
nnoremap <leader>i :IndentBlanklineToggle<CR>

" vim-ragtag
inoremap <M-o>       <Esc>o
let g:ragtag_global_maps = 1

" ===================
" Overriding Key Maps
" ===================

" Split line at cursor
nnoremap S :SplitLine<CR>

" Yank to end of line
nnoremap Y y$

" history-traverse
nnoremap H :HisTravBack<CR>
nnoremap L :HisTravForward<CR>


" =======
" Scripts
" =======

" Show cursorline in insert mode
autocmd vimrc InsertEnter * set cursorline
autocmd vimrc InsertLeave * set nocursorline

" Only show cursorline on active window
augroup CursorLineOnlyInActiveWindow
	autocmd!
	autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	autocmd WinLeave * setlocal nocursorline
augroup END


" =====
" Color
" =====

" 24-bit color
set termguicolors

" Colorscheme
set background=dark
autocmd vimrc VimEnter * ++nested colorscheme nord

" Colorscheme overrides
" autocmd vimrc ColorScheme * highlight VertSplit guibg=bg
" autocmd vimrc ColorScheme * highlight SignColumn guibg=bg
" autocmd vimrc ColorScheme * highlight SignifySignAdd guibg=bg
" autocmd vimrc ColorScheme * highlight SignifySignChange guibg=bg
" autocmd vimrc ColorScheme * highlight SignifySignDelete guibg=bg
" autocmd vimrc ColorScheme * highlight SignifySignDeleteFirstLine guibg=bg
