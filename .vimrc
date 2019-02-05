" minimal vimrc config
execute pathogen#infect()
syntax on
filetype plugin indent on

" NERDTree configs
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

set number
