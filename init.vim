" =======================
" ~/.config/nvim/init.vim
" =======================

" - Install vim-plug (Use :CheckHealth to ensure dependencies installed)
" - For vim-devicons, set terminal font to patched font from nerd-fonts repo
" - For vim-gutentags, install universal-ctags
" - :PlugInstall
" - Restart vim

" =======
" Plugins
" =======

call plug#begin('~/.local/share/nvim/plugged')

if has('nvim')
  " Autocomplete
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'fishbullet/deoplete-ruby'
  Plug 'Shougo/deoplete-rct', { 'do': 'gem install rcodetools' }

  " Linting
  Plug 'neomake/neomake'
endif

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

" Status line
Plug 'vim-airline/vim-airline'

" Git
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Alignment
Plug 'junegunn/vim-easy-align'

" Markdown
Plug 'tpope/vim-markdown'

" Colorschemes
Plug 'arcticicestudio/nord-vim'

" Motions
Plug 'jeetsukumaran/vim-indentwise'

" Text formatting
Plug 'tpope/vim-surround'

" Comments
Plug 'tpope/vim-commentary'

" File navigation
Plug 'justinmk/vim-dirvish'
Plug 'pbrisbin/vim-mkdir'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Tags
Plug 'ludovicchabant/vim-gutentags'

" Dev icons (load last)
Plug 'ryanoasis/vim-devicons'

call plug#end()


" ===============
" Plugin settings
" ===============

" vim-airline
let g:airline_extensions = []
set noshowmode

" vim-rubocop
let g:vimrubocop_keymap = 0

if has('nvim')
  " deoplete.nvim
  let g:deoplete#enable_at_startup = 1

  let g:deoplete#omni#input_patterns = {}
  let g:deoplete#omni#input_patterns.ruby = ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::']

  let g:deoplete#omni#functions = {}
  let g:deoplete#omni#functions.ruby = 'rubycomplete#Complete'

  inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
  function! s:my_cr_function() abort
    return deoplete#close_popup() . "\<CR>"
  endfunction

  " neomake
  autocmd! BufWritePost * Neomake
endif

" vim-dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'
autocmd FileType dirvish call fugitive#detect(@%) " Enable fugitive's :Gstatus

" vim-gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" vim-diminactive
" let g:diminactive_use_colorcolumn = 0
" let g:diminactive_use_syntax = 1


" ============
" Vim settings
" ============

" Don't wrap text by default
set nowrap

" Break on whitespace for prose
autocmd FileType markdown,text :set linebreak wrap

" Automatically resize splits when host window is resized
augroup Misc
  autocmd!
  autocmd VimResized * exe "normal! \<c-w>="
augroup END

" Enable backgrounding of unsaved buffers
set hidden

" Enable mouse
set mouse=a

" Show cursorline
set cursorline

" Search not case-sensitive when only lower-case chars used
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Define tab and newline chars with set list
set listchars=tab:▸\ ,eol:¬

" Keep undo history
set undofile

" Keep cursor away from edges of screen
set scrolloff=5

" Don't autocomment next line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Show line numbers
set number

" 24-bit color
set termguicolors

" No vertical divider char
set fillchars+=vert:\ 

" Open splits below and vertical splits to the right
set splitbelow
set splitright

" Define tab and newline chars with set list
set listchars=tab:▸\ ,eol:¬

" Two space indent
set shiftwidth=2
let &softtabstop = &shiftwidth
set expandtab


" =========
" Functions
" =========

" Split line
function! BreakHere()
  s/^\(\s*\)\(.\{-}\)\(\s*\)\(\%#\)\(\s*\)\(.*\)/\1\2\r\1\4\6
  call histdel("/", -1)
endfunction


" ========
" Key maps
" ========

" Edit vimrc
nnoremap <leader>r :edit $MYVIMRC<CR>


" ===============
" Plugin Key Maps
" ===============

" vim-unimpaired
" see :help unimpaired

" fzf
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

" vim-grepper
nnoremap <leader>a :Grepper<CR>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" ===================
" Overriding Key Maps
" ===================

" Split line at cursor
nnoremap S :call BreakHere()<CR>


" ===========
" Colorscheme
" ===========

" Nord
let g:nord_italic_comments = 1

colorscheme nord
