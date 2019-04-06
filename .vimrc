" minimal vimrc config
execute pathogen#infect()

syntax on
set synmaxcol=2500	      " limit syntax highlighting on large files
colorscheme ron

" air-line and tmuxline
let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 1

" show relative line numbers on the left
set nonumber
set relativenumber
set cursorline                 " Highlight the current line

" When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not
:set ignorecase
:set smartcase

" show next match while entering a search
:set incsearch
":set hlsearch			" highlight all found items once the search command is done

" turn on file detection, and file specific plugins and indentation
filetype plugin indent on

set autoindent                 " Copy indent to the new line

set backspace=indent           " ┐
set backspace+=eol             " │ Allow `backspace`
set backspace+=start           " ┘ in insert mode

set scrolloff=5                " When scrolling, keep the cursor
                               " 5 lines below the top and 5 lines
                               " above the bottom of the screen

set wildmenu                   " Enable enhanced command-line
                               " completion (by hitting <TAB> in
                               " command mode, Vim will show the
                               " possible matches just above the
                               " command line with the first
                               " match highlighted)

" NERDTree configs
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

:map <C-e> :NERDTree<CR>

" show status bar always
set laststatus=2
set noshowmode " Hide the default mode text below the statusline

