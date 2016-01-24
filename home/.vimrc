set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My bundles here:
Plugin 'Zenburn'

" original repos on GitHub
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Shougo/neocomplete.vim'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-rails'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" syntax
Plugin 'rodjek/vim-puppet'
Plugin 'tpope/vim-markdown'
Plugin 'fatih/vim-go'

call vundle#end()             " required
filetype plugin indent on     " required!

:so ~/.vimrc.settings
