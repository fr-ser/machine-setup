" Vundle plugin section
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" added nerdtree
Plugin 'scrooloose/nerdtree'
" airline and tmuxline
Plugin 'vim-airline/vim-airline'
Plugin 'edkolev/tmuxline.vim'
" vim surround
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" end of vundle plugin section

" air-line and tmuxline
let g:airline_powerline_fonts = 1
let g:tmuxline_powerline_separators = 1

" NERDTree configs
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

:map <C-e> :NERDTree<CR>

syntax on
set synmaxcol=2500	      " limit syntax highlighting on large files
colorscheme ron

" show relative line numbers on the left
set nonumber
set relativenumber

" When 'ignorecase' and 'smartcase' are both on, if a pattern contains an uppercase letter, it is case sensitive, otherwise, it is not
:set ignorecase
:set smartcase

" show next match while entering a search
:set incsearch
":set hlsearch			" highlight all found items once the search command is done

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

" show status bar always
set laststatus=2
set noshowmode " Hide the default mode text below the statusline

" show invisible characters
set list
set listchars=tab:▸-

