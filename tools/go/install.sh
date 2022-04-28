#!/bin/bash

# install go
cd /tmp \
    && wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.18.1.linux-amd64.tar.gz \
    && mkdir -p ~/go/{bin,src,pkg}

# set paths
cat <<EOF>> ~/.profile 
GOROOT=/usr/local/go
GOPATH=\$HOME/go
PATH=\$GOPATH/bin:\$GOROOT/bin:\$PATH
EOF
source ~/.profile

# setup vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pip3 install --upgrade pynvim

cat <<EOF>> ~/.vimrc 
" go setup
set encoding=utf-8

call plug#begin()

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

call plug#end()
EOF
echo "[+] Installing Vim Plugins"
vim +PlugInstall +qall >/dev/null 2>&1

cat <<EOF>> ~/.vimrc 
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
let g:go_auto_type_info = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
EOF
