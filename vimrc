" Alexis Fouquet's .vimrc file
" Last update : 02/09/2024 - Work in progress

set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

set splitbelow

" =================
" ==== PLUGINS ====
" =================

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'wakatime/vim-wakatime'
Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'

call vundle#end()

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

" set showmatch

" SEARCH

set ignorecase
set smartcase

set splitright

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

runtime! plugin/sensible.vim

set encoding=utf-8 fileencodings=

autocmd Filetype make setlocal noexpandtab

set list listchars=tab:>~,trail:~

