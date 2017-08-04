" ========================
" Sheldon Johnson's .vimrc
" ========================

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

" Unix
Plug 'tpope/vim-eunuch'

" Status line
Plug 'vim-airline/vim-airline'

" Git
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
" Plug 'tpope/vim-bundler'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-endwise'

" TabComplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

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

" deoplete.nvim
let g:deoplete#enable_at_startup = 1

" dirvish
autocmd FileType dirvish sort r /[^\/]$/          " Put directories before files
autocmd FileType dirvish call fugitive#detect(@%) " Enable fugitive's :Gstatus

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
" set completeopt+=longest

" Don't autocomment next line
set formatoptions-=cro

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

" Open ~/.config/nvim/init.vim
nnoremap <leader>r :e ~/.config/nvim/init.vim<CR>


" ===============
" Plugin Key Maps
" ===============

" FZF
nnoremap <leader>f :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>

" vim-grepper
nnoremap <leader>a :Grepper<CR>

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


" ===================
" Overriding key maps
" ===================

" Split line at cursor
nnoremap S :call BreakHere()<CR>


" ===========
" Colorscheme
" ===========

" Nord
let g:nord_italic_comments = 1

colorscheme nord
