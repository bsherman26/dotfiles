" Vundle Setup
set nocompatible
filetype off     " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Plugin Bundles
Bundle 'wincent/Command-T'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/YankRing.vim'
"Bundle 'msanders/snipmate.vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'

" Linting
Bundle 'scrooloose/syntastic'

" Color Schemes
Bundle 'flazz/vim-colorschemes'
Bundle 'tpope/vim-vividchalk'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'

" JavaScript
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'

" HTML/CSS
Bundle 'mattn/emmet-vim'
"Bundle 'tpope/vim-markdown'

" New
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'
Bundle 'marijnh/tern_for_vim'
Bundle 'vim-scripts/Better-CSS-Syntax-for-Vim'
Bundle 'skammer/vim-css-color'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'kien/ctrlp.vim'


" Tried
"Bundle 'tpope/vim-commentary'  "Prefered Nerd Commenter
"Bundle 'tpope/vim-abolish'     "Clever but I wasn't using it. Consider Some other time
"Bundle 'tpope/vim-endwise'     "Caused Problems with the delimitMate Plugin: Bracket Expansion Wouldnt work
