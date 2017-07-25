" =======
" Plugins
" =======

call plug#begin('~/.local/share/nvim/plugged')
" Utilities
Plug 'tpope/vim-repeat'

" Git
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'

" TabComplete
Plug 'ajh17/VimCompletesMe'

" Alignment
Plug 'junegunn/vim-easy-align'

" Markdown
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

" Colorschemes
Plug 'tyrannicaltoucan/vim-deep-space'

" Grep
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" Keymappings
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'

" Motions
Plug 'jeetsukumaran/vim-indentwise'
" 
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

call plug#end()


" ===============
" Plugin settings
" ===============

" VimCompletesMe
autocmd FileType ruby let b:vcm_tab_complete = "omni"


" ============
" Vim settings
" ============

" Autocommands
autocmd FileType markdown,text :set linebreak

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
set listchars=tab:▸\ ,eol:¬

" Keep undo history
set undofile

" Keep cursor away from edges of screen
set scrolloff=5

" Only insert the common text of all autocomplete matches
set completeopt+=longest

" Show line numbers
set number

" 24-bit color
set termguicolors


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

" Leader
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :e ~/.config/nvim/init.vim<CR>

" Overrides
nnoremap S :call BreakHere()<CR>


" ===========
" Colorscheme
" ===========

colorscheme deep-space
