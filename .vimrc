" minimal vimrc config
execute pathogen#infect()
syntax on

" show relative line numbers on the left
set nonumber
set relativenumber

" When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not
:set ignorecase
:set smartcase

" show next match while entering a search
:set incsearch

filetype plugin indent on

" NERDTree configs
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

:map <C-e> :NERDTree<CR>

