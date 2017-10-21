scriptencoding utf-8

" ~/.config/nvim/init.vim
" =======================

" - Dependencies: git, ruby, npm, ctags + probably more
" - To generate tags for gems:
"   - $ gem install gem-ctags
"   - $ gem ctags
" - Install vim-plug (Use :CheckHealth to ensure dependencies installed)
" - :PlugInstall
" - Restart vim


" =======
" Plugins
" =======

call plug#begin('~/.local/share/nvim/plugged')

" Linting
Plug 'w0rp/ale'

" Autocomplete
Plug 'ajh17/VimCompletesMe'

" Keymappings
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'

" Utilities
Plug 'tpope/vim-repeat'

" Grep
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" Unix
Plug 'tpope/vim-eunuch'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails', { 'do': 'gem install rails' }
Plug 'tpope/vim-rake', { 'do': 'gem install rake' }
Plug 'tpope/vim-bundler', { 'do': 'gem install bundler' }
Plug 'ngmy/vim-rubocop', { 'do': 'gem install rubocop' }
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-endwise'
Plug 'thoughtbot/vim-rspec'

" CSV
Plug 'chrisbra/csv.vim'

" tmux
Plug 'tmux-plugins/vim-tmux'

" Statusline
Plug 'vim-airline/vim-airline'
Plug 'drzel/vim-line-no-indicator'

" Git
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'

" Alignment
Plug 'junegunn/vim-easy-align'

" Markdown
Plug 'tpope/vim-markdown'
Plug 'shime/vim-livedown', { 'do': 'npm install livedown' }
Plug 'dhruvasagar/vim-table-mode'

" Colorschemes
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

" Text objects
Plug 'wellle/targets.vim'
Plug 'jeetsukumaran/vim-indentwise'

" Text formatting
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'drzel/vim-split-line'

" Colorizer
Plug 'chrisbra/Colorizer'

" Comments
Plug 'tpope/vim-commentary'

" File navigation
Plug 'justinmk/vim-dirvish'
Plug 'pbrisbin/vim-mkdir'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ckarnell/history-traverse'

" Search
Plug 'romainl/vim-cool'

" Tags
Plug 'ludovicchabant/vim-gutentags', { 'do': 'gem install ripper-tags' }

call plug#end()


" ===============
" Plugin settings
" ===============

" vim-markdown
let g:markdown_fenced_languages = ['javascript', 'ruby']

" vim-gutentags
" let g:gutentags_ctags_executable_ruby = 'ripper-tags -R --exclude=vendor --ignore-unsupported-options'

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_right_sep = ''

let g:airline_section_x = '%{&filetype}'
let g:airline_section_y = '%{HistoryIndicator()}'
let g:airline_section_z = '%#__accent_bold#%{LineNoIndicator()}%#__restore__# %2c'
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#whitespace#enabled = 0
set noshowmode

" ale
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" vim-rspec
let g:rspec_command = '!bundle exec rspec -fd --no-profile --color {spec}'

" vim-rubocop
let g:vimrubocop_keymap = 0

" vim-dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'
augroup dirvish
  autocmd!
  autocmd FileType dirvish call fugitive#detect(@%) " Enable fugitive's :Gstatus
augroup END

" vim-gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" history-traverse
let g:history_ft_ignore = ['pyc', 'netrw', 'dirvish']
let g:history_max_len = 1000

" vim-table-mode
let g:table_mode_corner='|'

" ============
" Vim settings
" ============

" Don't wrap text by default
set nowrap

" Break on whitespace for prose
augroup markdown
  autocmd!
  autocmd FileType markdown,text :set linebreak wrap
augroup END

" Don't match parens
let g:loaded_matchparen = 1

" Enable backgrounding of unsaved buffers
set hidden

" Enable mouse
set mouse=a

" Show cursorline
set cursorline

" Search not case-sensitive when only lower-case chars used
set incsearch
set ignorecase
set smartcase

" Define tab and newline chars with set list
set listchars=tab:→\ ,trail:·,eol:¬,extends:…,precedes:…

" Keep undo history
set undofile

" Keep cursor away from edges of screen
function! ScrollOffPct(pct)
  let l:visual_lines_in_active_window = winheight(win_getid())
  let l:fraction = floor(a:pct) / floor(100)
  let l:lines = float2nr(l:visual_lines_in_active_window * l:fraction)
  let &scrolloff = l:lines
endfunction

call ScrollOffPct(25)

" Don't autocomment next line
augroup autocomment
  autocmd!
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" Show line numbers
set number

" No vertical divider char
set fillchars+=vert:│

" Open splits below and vertical splits to the right
set splitbelow
set splitright

" Two space indent
set shiftwidth=2
let &softtabstop = &shiftwidth
set expandtab


" ========
" Key maps
" ========

" Edit vimrc
nnoremap <leader>c :edit $MYVIMRC<CR>


" ===============
" Plugin Key Maps
" ===============

" vim-unimpaired
" see :help unimpaired

" vim-gitgutter
" see :help gitgutter

" fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>fC :BCommits<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fT :BTags<CR>
nnoremap <leader>fo :History<CR>

" vim-rspec
map <leader>rt :call RunCurrentSpecFile()<CR>
map <leader>rs :call RunNearestSpec()<CR>
map <leader>rl :call RunLastSpec()<CR>
map <leader>ra :call RunAllSpecs()<CR>

" vim-grepper
nnoremap <leader>g :Grepper<CR>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


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


" =====
" Color
" =====

" 24-bit color
set termguicolors

" Nord
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 10

colorscheme nord
highlight VertSplit guibg=none ctermbg=none
