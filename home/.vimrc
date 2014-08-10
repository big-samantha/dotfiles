set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/Vundle.vim'

" My bundles here:
Bundle 'Zenburn'

" original repos on GitHub
Bundle "scrooloose/nerdtree"
Bundle "scrooloose/syntastic"
Bundle "scrooloose/nerdcommenter"
Bundle "Shougo/neocomplete.vim"
Bundle "godlygeek/tabular"
Bundle "kien/ctrlp.vim"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "tpope/vim-rails"
Bundle "mattn/webapi-vim"
Bundle "mattn/gist-vim"

" syntax
Bundle "rodjek/vim-puppet"
Bundle "tpope/vim-markdown"

"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non-GitHub repos
"Bundle 'git://git.wincent.com/command-t.git'
" Git repos on your local machine (i.e. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

:so ~/.vimrc.settings
