" - Dependencies: vim-plug, git, python2, python3, ruby, npm, ctags, rbenv,
"     rubocop, vint, bat
" - To generate tags for gems:
"       ```
"       gem install gem-ctags
"       gem ctags
"       ```
" - Use rbenv plugin to Automatically generate ctags for rbenv Ruby stdlibs:
"     https://github.com/tpope/rbenv-ctags
" - Use :CheckHealth to ensure dependencies installed
" - :PlugInstall
" - Restart vim

augroup vimrc
  autocmd!
augroup END

scriptencoding utf-8


" =======
" Plugins
" =======

call plug#begin(stdpath("data") . '/plugged')

" Linting
Plug 'w0rp/ale'

" Autocomplete
Plug 'ajh17/VimCompletesMe'

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

" Ansible
Plug 'pearofducks/ansible-vim'

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
Plug 'mxw/vim-jsx'

" JSON
Plug 'elzr/vim-json'

" nginx
Plug 'chr4/nginx.vim'

" tmux
Plug 'tmux-plugins/vim-tmux'

" " Statusline
Plug 'itchyny/lightline.vim'

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
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }
Plug 'kaicataldo/material.vim'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

" Text objects
Plug 'wellle/targets.vim'
Plug 'jeetsukumaran/vim-indentwise'

" Text formatting
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-abolish'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'drzel/vim-split-line'
Plug 'junegunn/goyo.vim'

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

" vim-line-no-indicator
Plug 'drzel/vim-line-no-indicator'

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Indent guides
Plug 'Yggdroot/indentLine'

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
" default config: https://github.com/itchyny/lightline.vim/blob/master/autoload/lightline.vim
" default components: :help g:lightline.component

function! CwdBasename() abort
  return substitute(getcwd(), '^.*/', '', '')
endfunction

function! LightlineRelativepath() abort
  let l:ary = []

  if strlen(&filetype)
    let l:ary += [WebDevIconsGetFileTypeSymbol()]
  else
    let l:ary += ['no ft']
  endif

  let l:ary += [expand('%f')]

  if &modified
    let l:ary += ['+']
  endif

  return join(l:ary, ' ')
endfunction

let g:lightline = {
      \   'colorscheme': 'gruvbox',
      \   'component_function': {
      \     'cwd_basename': 'CwdBasename',
      \     'll_relativepath': 'LightlineRelativepath'
      \   },
      \   'active': {
      \     'left': [['mode', 'paste'], ['cwd_basename'], [], ['ll_relativepath']],
      \     'right': [['lineinfo'], [], ['percent']]
      \   },
      \   'inactive': {
      \     'left': [['ll_relativepath']],
      \     'right': [['lineinfo'], ['percent']]
      \   }
      \ }

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

" indentLine
let g:indentLine_char = '▏'
let g:indentLine_enabled = 0


" ============
" Vim settings
" ============

" Don't show mode message
set noshowmode

" Show line numbers
set number

" Don't wrap text by default
set nowrap

" Enable backgrounding of unsaved buffers
set hidden

" Enable mouse
set mouse=a

" Search not case-sensitive when only lower-case chars used
set incsearch
set ignorecase
set smartcase

" Show incremental results
set inccommand=nosplit

" Define tab and newline chars with set list
set list
set listchars=tab:→\ ,trail:·,extends:…,precedes:…

" Keep undo history
set undofile

" Open splits below and vertical splits to the right
set splitbelow
set splitright

" Two space indent
set shiftwidth=2
let &softtabstop = &shiftwidth
set expandtab

" readline like command autocompletion
set wildmode=longest,list,full
set wildmenu

" Allow `crontab -e` on Mac OS
set backupskip+=/private/tmp/*

" Vertical split character
set fillchars+=vert:│


" ========
" Key maps
" ========

" Edit vimrc
nnoremap <leader>c :edit $MYVIMRC<CR>

" Toggle spell check
nnoremap <leader>s :set spell!<CR>

" Copy filename
nnoremap <leader>yf :let @" = @%<CR>


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

" vim-grepper
nnoremap <leader>gf :Grepper -tool grep<CR>
nnoremap <leader>gg :Grepper -tool git<CR>

" vim-easy-align
xnoremap ga <Plug>(EasyAlign)
nnoremap ga <Plug>(EasyAlign)

" indentLine
nnoremap <leader>i :IndentLinesToggle<CR>


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

" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')

function! s:CombineSelection(line1, line2, cp) abort
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction


" =====
" Color
" =====

" 24-bit color
set termguicolors

" Nord
" let g:nord_italic = 1
" let g:nord_italic_comments = 1
" let g:nord_uniform_diff_background = 1

" Material
" let g:material_theme_style = 'palenight'
" let g:material_terminal_italics = 1

" Colorscheme
set background=dark
autocmd vimrc VimEnter * ++nested colorscheme gruvbox

" Colorscheme overrides
autocmd vimrc ColorScheme * highlight VertSplit guibg=bg
