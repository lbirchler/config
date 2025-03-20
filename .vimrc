imap jk <esc>
filetype plugin indent on
syntax on 
set number
set ruler
set nowrap
set noswapfile
set expandtab
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set softtabstop=2
autocmd BufEnter *.yaml,*.yml :set indentkeys-=0#
let mapleader = ","
nnoremap <leader>p :set paste!<CR>
