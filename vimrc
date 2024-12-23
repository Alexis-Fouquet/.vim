" Alexis Fouquet's .vimrc file

set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

set splitbelow

" =================
" ==== PLUGINS ====
" =================

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'      " OK - Need it for compatibility
Plugin 'preservim/nerdtree'        " OK
Plugin 'wakatime/vim-wakatime'     " OK - Need to enter key
Plugin 'tpope/vim-sensible'        " ~  - Compatibility
Plugin 'vim-airline/vim-airline'   " OK
Plugin 'airblade/vim-gitgutter'    " OK
Plugin 'tpope/vim-fugitive'        " ~  - Airline
Plugin 'w0rp/ale'                  " TEST
Plugin 'ervandew/supertab'         " TEST
Plugin 'ryanoasis/vim-devicons'    " OK
Plugin 'liuchengxu/vim-which-key'  " Test

" OK
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

Plugin 'jiangmiao/auto-pairs'      " TEST
Plugin 'easymotion/vim-easymotion' " TEST
Plugin 'junegunn/rainbow_parentheses.vim' " TEST

call vundle#end()

filetype plugin indent on

syntax on

" INDENT AND TABS

set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

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
autocmd Filetype asm setlocal noexpandtab

set list listchars=tab:>~,trail:~

let g:airline_powerline_fonts = 1
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']

let gtk_flags = ' `pkg-config --cflags gtk+-3.0`'
if exists('g:ale_c_gcc_options')
    let g:ale_c_gcc_options .= g:ale_c_gcc_options . ' ' . gtk_flags
else
    let g:ale_c_gcc_options = gtk_flags
endif

if exists('g:ale_c_clang_options')
    let g:ale_c_clang_options .= g:ale_c_clang_options . ' ' . gtk_flags
else
    let g:ale_c_clang_options = gtk_flags
endif

let g:ale_c_cc_options = '-std=c99 -Wall -Wextra' . gtk_flags
" let g:ale_clangtidy_options = gtk_flags
let g:ale_c_clangtidy_extra_options = gtk_flags
let g:ale_linters = {'c': ['cc', 'cppcheck', 'cpplint', 'cquery', 'flawfinder']}

let g:mapleader = " "
map <leader>f :Files<CR>
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
