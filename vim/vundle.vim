" Vundle Setup
set nocompatible                       " required
filetype off                           " required!
"set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#rc()
call vundle#begin()

" let Vundle manage Vundle, required
"Plugin 'gmarik/vundle'
Plugin 'gmarik/Vundle.vim'

" Plugin Plugins
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/YankRing.vim'
"Plugin 'tsaleh/vim-matchit'
Plugin 'tmhedberg/matchit'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'

" Snipmate
"Plugin 'msanders/snipmate.vim' "Unmaintained original version of Snipmate
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'     "Snippet Repository

" Linting
Plugin 'scrooloose/syntastic'

" Color Schemes
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-vividchalk'

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

" JavaScript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'marijnh/tern_for_vim'

" HTML/CSS
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'skammer/vim-css-color'
Plugin 'groenewege/vim-less'
"Plugin 'tpope/vim-markdown'

" New
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'kshenoy/vim-signature'
Plugin 'digitaltoad/vim-jade'
Plugin 'juvenn/mustache.vim'
Plugin 'tpope/vim-haml'

" File Explorers
Plugin 'wincent/Command-T'
Plugin 'kien/ctrlp.vim'
" Shougo/unite.vim
" sjbach/lusty

" Tried
"Plugin 'vim-scripts/Better-CSS-Syntax-for-Vim'  "Replaced with hail2u/vim-css3-syntax. Could also have used alternative and more active repository ChrisYip/Better-CSS-Syntax-for-Vim
"Plugin 'tpope/vim-commentary'  "Prefered Nerd Commenter
"Plugin 'tpope/vim-abolish'     "Clever but I wasn't using it. Consider Some other time
"Plugin 'tpope/vim-endwise'     "Caused Problems with the delimitMate Plugin: Bracket Expansion Wouldnt work
"Plugin 'skammer/vim-css-color' "Doesn't work in combination with 'vim-scripts/Better-CSS-Syntax-for-Vim' which is very helpful consider integrating them

call vundle#end()           " required
filetype plugin indent on   " required
