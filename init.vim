" =================================
" Sheldon Johnson's vim init.vim
" =================================

" - Install vim-plug
" - Install patched font or delete vim-devicons plugin
" - Source file
" - :PlugInstall
" - Restart vim

" =======
" Plugins
" =======

call plug#begin('~/.local/share/nvim/plugged')
" Utilities
Plug 'tpope/vim-repeat'

" Status line
Plug 'vim-airline/vim-airline'

" Git
Plug 'tpope/vim-git'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-projectionist'

" TabComplete
Plug 'ajh17/VimCompletesMe'

" Alignment
Plug 'junegunn/vim-easy-align'

" Markdown
Plug 'tpope/vim-markdown', { 'for': 'markdown' }

" Colorschemes
Plug 'arcticicestudio/nord-vim'

" Grep
Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" Keymappings
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-rsi'

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

" Airline
let g:airline_extensions = []
set noshowmode

" VimCompletesMe
autocmd FileType ruby let b:vcm_tab_complete = "omni"

" dirvish
autocmd FileType dirvish sort r /[^\/]$/ " Put directories before files

" git-gutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" ============
" Vim settings
" ============

" Break on whitespace for prose
autocmd FileType markdown,text :set linebreak

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

" No vertical divider char
set fillchars+=vert:\ 

" Open splits below and vertical splits to the right
set splitbelow
set splitright

" Define tab and newline chars with set list
set listchars=tab:▸\ ,eol:¬


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

" Vim
nnoremap <leader>r :e ~/.config/nvim/init.vim<CR>

" Plugins
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>a :Grepper<CR>

" Overrides
nnoremap S :call BreakHere()<CR>


" ===========
" Colorscheme
" ===========

let g:nord_italic_comments = 1
colorscheme nord
