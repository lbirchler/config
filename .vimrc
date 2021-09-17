inoremap jk <esc>
set number relativenumber
set ai
set tabstop=4 
set shiftwidth=4
set expandtab
set smarttab 

set nohlsearch
set ignorecase
set smartcase
set incsearch

set hidden
set noerrorbells
set noswapfile 
syntax enable

hi Pmenu ctermbg=gray guibg=gray
set background=dark

set clipboard=unnamedplus

" --- plugins --- 

" automatic vim plug installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

" use deoplete
let g:deoplete#enable_at_startup = 1

" instructs deoplete to use omni completion for Go files
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" close preview window on leaving the insert mode
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" lightline
set noshowmode
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'ayu_dark',
      \ }

