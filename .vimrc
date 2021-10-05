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
set clipboard=unnamedplus
hi Pmenu ctermbg=gray guibg=gray
set background=dark

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'davidhalter/jedi-vim'
Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}

call plug#end()

" use deoplete
let g:deoplete#enable_at_startup = 1
let g:go_auto_type_info = 1

" instructs deoplete to use omni completion for Go files
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" lightline
set noshowmode
set laststatus=2
let g:lightline = {
            \ 'colorscheme': 'ayu_dark',
            \ }

" tab auto-completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" close preview window on leaving insert mode
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" leader r :GoRun
autocmd FileType go nmap <leader>r  <Plug>(go-run)
