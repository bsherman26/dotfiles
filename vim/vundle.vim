" Vundle Setup (Required)
set nocompatible
filetype off
"set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#rc()
call vundle#begin()

" Let Vundle manage Vundle, required
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

" Tags
Plugin 'vim-scripts/taglist.vim'
"Plugin 'majutsushi/tagbar'
"Plugin 'ludovicchabant/vim-gutentags'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
"Plugin 'universal-ctags/ctags'


" Linting
Plugin 'scrooloose/syntastic'

" Color Schemes
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-vividchalk'

" JavaScript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'marijnh/tern_for_vim'

" HTML/CSS
"Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'skammer/vim-css-color'
"Plugin 'groenewege/vim-less'
"Plugin 'tpope/vim-markdown'

" Ruby
"Plugin 'vim-ruby/vim-ruby'
"Plugin 'tpope/vim-rails'

" File Explorers
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
"Plugin 'wincent/Command-T'
" Shougo/unite.vim
" sjbach/lusty


" Keep
Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'
Plugin 'nelstrom/vim-visual-star-search'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/bufexplorer.zip'
Plugin 'kshenoy/vim-signature'

" GDB
"Plugin 'schmich/vim-guifont'
"Plugin 'vim-scripts/Conque-GDB.git'

" DB Shell
Plugin 'tpope/vim-dadbod'

"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
"Plugin 'digitaltoad/vim-jade'
"Plugin 'juvenn/mustache.vim'
"Plugin 'tpope/vim-haml'

" Required
call vundle#end()
filetype plugin indent on


" Try
"Plugin 'tpope/vim-abolish'     "Clever but I wasn't using it. Consider Some other time


" Tried
"Plugin 'vim-scripts/Better-CSS-Syntax-for-Vim'  "Replaced with hail2u/vim-css3-syntax. Could also have used alternative and more active repository ChrisYip/Better-CSS-Syntax-for-Vim
"Plugin 'tpope/vim-commentary'  "Prefered Nerd Commenter
"Plugin 'tpope/vim-endwise'     "Caused Problems with the delimitMate Plugin: Bracket Expansion Wouldnt work
"Plugin 'skammer/vim-css-color' "Doesn't work in combination with 'vim-scripts/Better-CSS-Syntax-for-Vim' which is very helpful consider integrating them


" Snipmate
"Plugin 'msanders/snipmate.vim' "Unmaintained original version of Snipmate
"Plugin 'MarcWeber/vim-addon-mw-utils'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'     "Snippet Repository
