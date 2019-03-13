set number relativenumber
syntax on
filetype plugin on
set scrolloff=5
set autoread

set nobackup
set noswapfile
set nowritebackup
set clipboard=unnamedplus
set mouse=a
set encoding=utf-8

" Set tabs to 4 spaces and stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

let mapleader = ','

nnoremap <leader>/ :nohl<CR>

autocmd! bufwritepost .vimrc source %

" Vundle Settings
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'yuttie/comfortable-motion.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'

call vundle#end()            " required
filetype plugin indent on    " required

" NERDTRee Settings
" shortcut
map <C-n> :NERDTreeToggle<CR>
" autoclose if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Auto read saved file
augroup checktime
    au!
    if !has("gui_running")
        "silent! necessary otherwise throws errors when using command
        "line window.
        autocmd BufEnter        * silent! checktime
        autocmd CursorHold      * silent! checktime
        autocmd CursorHoldI     * silent! checktime
        "these two _may_ slow things down. Remove if they do.
        autocmd CursorMoved     * silent! checktime
        autocmd CursorMovedI    * silent! checktime
    endif
augroup END

" Comfortable motion settings
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(30)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-30)<CR>
let g:comfortable_motion_friction = 120.0
let g:comfortable_motion_air_drag = 4.0

" jedi settings
let g:jedi#popup_on_dot = 1
let g:SuperTabDefaultCompletionType = "context"

imap <F5> <Esc>:w<CR>:!clear;python %<CR>
