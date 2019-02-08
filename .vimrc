" minimal vimrc config
execute pathogen#infect()
syntax on
set number
filetype plugin indent on

" NERDTree configs
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

:map <C-e> :NERDTree<CR>

