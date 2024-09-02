" Alexis Fouquet's .vimrc file
" Last update : 31/08/2024 - Work in progress

set nocompatible

filetype plugin indent on

syntax on

" INDENT AND TABS

set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=4

" RULERS

set colorcolumn=80
set cursorline
set ruler
set relativenumber
set number

" PAIRS

set showmatch

" SEARCH

set ignorecase
set smartcase

set splitright
set splitbelow

" =================
" ==== PLUGINS ====
" =================

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'wakatime/vim-wakatime'

call plug#end()

" PLUGINS CONFIG

" Start NERDTree when Vim starts with a directory argument.
" Code from the NERDTree README
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter *
            \ if argc() == 1
            \   && isdirectory(argv()[0])
            \   && !exists('s:std_in')
            \ | execute 'NERDTree' argv()[0]
            \ | wincmd p
            \ | enew
            \ | execute 'cd '.argv()[0]
            \ | endif


