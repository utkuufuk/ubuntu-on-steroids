color desert

" Enable syntax highlighting
syntax enable

" Change line number color
highlight LineNr ctermfg=grey

" Set filetype specific indentation
filetype plugin indent on

set clipboard^=unnamedplus

set title

" Use utf-8 everywhere
scriptencoding utf8
set encoding=utf-8

" Ensure that the cursor is at least 5 lines above bottom
set scrolloff=5

set autoindent

set smartindent

" When leaving buffer, hide it instead of closing it
set hidden

" Enable autocomplete menu
"set wildmenu
"set wildmode=list:longest

set visualbell

set cursorline

set ruler

" Backspace works as expected (across lines)
set backspace=indent,eol,start

" Statusline settings
set laststatus=2 noshowmode showcmd cmdheight=2

" show line numbers
set number

set previewheight=20

" Make tabs into spaces and indent with 4 spaces
set expandtab tabstop=4 shiftwidth=4 softtabstop=4

set shiftround

set copyindent

set preserveindent

set ls=2

set smarttab

" Searching behaves like a web browser
set incsearch ignorecase smartcase hlsearch

" ===================================================================================================
" New Commands
" ===================================================================================================
 
" Change leader to spacebar
let g:mapleader=' '

" <leader><leader> clears previous search highlighting
map <silent> <leader><leader> :nohlsearch<cr>

" <leader>d deletes without filling the yank buffer
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" ===================================================================================================
" Mappings
" ===================================================================================================

" Make Y behavior consistent with C and D 
map Y y$

" Map escape key to jj -- much faster to exit insert mode
imap jj <esc>

" Move cursor as usual through wrapped lines
nnoremap j gj
nnoremap k gk

" Enable cursor shape switching on mode change
if has('nvim')
  set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
endif

