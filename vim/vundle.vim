" Vundle Setup
set nocompatible
filetype off     " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" Plugin Bundles
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdcommenter'
Bundle 'majutsushi/tagbar'

" Snipmate
"Bundle 'msanders/snipmate.vim' "Unmaintained original version of Snipmate
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
"Bundle 'honza/vim-snippets'     "Snippet Repository

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
Bundle 'marijnh/tern_for_vim'

" HTML/CSS
Bundle 'mattn/emmet-vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'skammer/vim-css-color'
Bundle 'groenewege/vim-less'
"Bundle 'tpope/vim-markdown'

" New
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
"Bundle 'xolox/vim-misc'
"Bundle 'xolox/vim-easytags'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'kshenoy/vim-signature'
Bundle 'digitaltoad/vim-jade'
Bundle 'juvenn/mustache.vim'
Bundle 'tpope/vim-haml'

" File Explorers
Bundle 'wincent/Command-T'
Bundle 'kien/ctrlp.vim'
" Shougo/unite.vim
" sjbach/lusty

" Tried
"Bundle 'vim-scripts/Better-CSS-Syntax-for-Vim'  "Replaced with hail2u/vim-css3-syntax. Could also have used alternative and more active repository ChrisYip/Better-CSS-Syntax-for-Vim
"Bundle 'tpope/vim-commentary'  "Prefered Nerd Commenter
"Bundle 'tpope/vim-abolish'     "Clever but I wasn't using it. Consider Some other time
"Bundle 'tpope/vim-endwise'     "Caused Problems with the delimitMate Plugin: Bracket Expansion Wouldnt work
"Bundle 'skammer/vim-css-color' "Doesn't work in combination with 'vim-scripts/Better-CSS-Syntax-for-Vim' which is very helpful consider integrating them
