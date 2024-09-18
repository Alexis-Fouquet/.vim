" Alexis Fouquet's .vimrc file

set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

set splitbelow

" =================
" ==== PLUGINS ====
" =================

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'    " OK - Need it for compatibility
Plugin 'preservim/nerdtree'      " OK
Plugin 'wakatime/vim-wakatime'   " OK - Need to enter key
Plugin 'tpope/vim-sensible'      " ~  - Compatibility
Plugin 'vim-airline/vim-airline' " OK
Plugin 'airblade/vim-gitgutter'  " OK
Plugin 'tpope/vim-fugitive'      " ~  - Airline
Plugin 'w0rp/ale'                " TEST
Plugin 'ervandew/supertab'       " TEST
Plugin 'ryanoasis/vim-devicons'  " OK
Plugin 'junegunn/fzf'            " TEST

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

" ALE
let g:ale_completion_enabled = 1
let g:ale_lint_delay = 4000

runtime! plugin/sensible.vim

set encoding=utf-8 fileencodings=

autocmd Filetype make setlocal noexpandtab

set list listchars=tab:>~,trail:~

let g:airline_powerline_fonts = 1
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']
