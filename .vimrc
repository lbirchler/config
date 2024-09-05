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
set shiftwidth=4
set tabstop=4
set softtabstop=4
autocmd FileType python,yml,yaml setlocal et si sw=2 ts=2 sts=2
autocmd BufEnter *.yaml,*.yml :set indentkeys-=0#
