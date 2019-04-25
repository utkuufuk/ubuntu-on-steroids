" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Vim Markdown Composer plugin
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" YouCompleteMe plugin
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

Plug 'lervag/vimtex'

Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

" Assume that .tex files are LaTeX
let g:tex_flavor='latex'

color torte

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

augroup python
    autocmd!
    autocmd FileType python
                \   syn keyword pythonSelf self
                \ | highlight def link pythonSelf Special
augroup end
