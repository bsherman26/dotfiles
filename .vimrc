" Brian Sherman's Vim Configuration
"

"--------------------------------------------------------------------------
" Gerneral Setup
"--------------------------------------------------------------------------

set nocompatible

" All of the plugins are installed with Vundle from this file
source ~/.vim/vundle.vim

"Old Pathogen Setup   
    " runtime bundle/vim-pathogen/autoload/pathogen.vim
    " call pathogen#infect()
    " call pathogen#helptags()

"Help while modifying the .vimrc
    " Let's make it easy to edit this file (mnemonic for key sequence is 'e'dit 'v'imrc)
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    " And to source this file as well (mnemonic for the key sequence is 's'ource 'v'imrc)
    nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Remove GUI widgets and scrollbars
set guioptions-=T
set guioptions-=r
set guioptions-=L

" Make the command-line completion better
set wildmenu

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden


" CTags File location
"let Tlist_Ctags_Cmd='..\ctags58\ctags.exe'

" COLOR SCHEME
    syntax enable
    set background=dark
    "colorscheme koehler
    "colorscheme molokai
    "colorscheme slate
    "colorscheme Monokai
    "colorscheme vividchalk
    colorscheme blackboard
    "colorscheme blazer
    "colorscheme torte
    "colorscheme pablo
    "colorscheme murphy
    "colorscheme desert
    "PLAY WITH LATER
    "Change color of selected item background in Popup Menu in color terminal
    "hi PmenuSel ctermfg=15
    if has('gui_running')
        colorscheme koehler
        "let g:solarized_termtrans=1
        "let g:solarized_termcolars = 256
        "let g:solarized_contrast="high"
        "let g:solarized_visibility="high"
        "colorscheme solarized
    endif

" Show Line Numbers
set number

" Filetype
set filetype=on
filetype plugin indent on
set ai    "autoindent
set ts=4  "tabstop
set sts=4 "softtabstop
set et    "expandtab
set sw=4  "shiftwidth
set textwidth=79
" HTML (tab width 2 chr, no wrapping)
autocmd FileType html setlocal sw=3
autocmd FileType html setlocal ts=3
autocmd FileType html setlocal sts=3
autocmd FileType html setlocal textwidth=0
" XHTML (tab width 2 chr, no wrapping)
autocmd FileType xhtml setlocal sw=3
autocmd FileType xhtml setlocal ts=3
autocmd FileType xhtml setlocal sts=3
autocmd FileType xhtml setlocal textwidth=0
" CSS (tab width 2 chr, wrap at 79th char)
autocmd FileType css setlocal sw=2
autocmd FileType css setlocal ts=2
autocmd FileType css setlocal sts=2
autocmd FileType css setlocal nowrap
" Ruby
autocmd FileType ruby setlocal sw=2
autocmd FileType ruby setlocal ts=2
autocmd FileType ruby setlocal sts=2
autocmd FileType ruby setlocal tw=0
autocmd FileType ruby setlocal et
" Jade
autocmd FileType jade setlocal sw=2
autocmd FileType jade setlocal ts=2
autocmd FileType jade setlocal sts=2
autocmd FileType jade setlocal tw=0
autocmd FileType jade setlocal et

"--------------------------------------------------------------------------
" Set Key Mappings
"--------------------------------------------------------------------------
set pastetoggle=<F2>
"nnoremap ; :
nnoremap j gj
nnoremap k gk
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <silent> <C-s> :w<CR>
nmap <silent> ,/ :set hlsearch!<CR>

"Map NERDTree to \p
"map <silent> <Leader>p :NERDTreeToggle<CR>

"Map Command-T to \p
map <silent> <Leader>p :CommandT<CR>
map <silent> <Leader>t :CommandTTag<CR>
map <silent> <Leader>r :CommandTFlush<CR>
"let g:CommandTMaxFiles=10000
"let g:CommandTMaxDepth=10
"This isn't working yet"
if !has('gui_running')
    let g:CommandTHighlightColor='Yellow'
endif
let g:CommandTMatchWindowReverse=1

"Show Invisibles Toggle
nmap <leader>l :set list!<CR>

"Invisible characters
set listchars=tab:▸\ ,eol:¬

"Yank Ring
nnoremap <silent> <F11> :YRShow<CR>
let g:yankring_replace_n_pkey = '<c-[>'

" Toggle spell checking for the current buffer on and off with '\s'
nmap <silent> <leader>s :setlocal spell! spelllang=en_us<CR>

" Tagbar
nnoremap <silent> <Leader>o :TagbarToggle<CR>

" DelimitMate
map <silent> <Leader>d :DelimitMateSwitch<CR>
"let delimitMate_offByDefault = 1   "Prevent delimitMate from loading until :DelimitMateSwitch is called
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
"let delimitMate_expand_space = 1
"Fix mistake with :W for :w
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
"command! -bang Q quit<bang>
"SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

"Ctrl-P
"let g:ctrlp_map = '<c-[>'
let g:ctrlp_arg_map = 1   "When this is set to 1, the <c-o> & <c-y> mappings will accept one extra key as an argument
"set wildignore+=*/node_modules/*
let g:ctrlp_custom_ignore = { 'dir': 'node_modules' }

"FROM vimrc_example

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


" Show syntax highlighting groups for word under cursor (From Vim
" Casts)(Conisder Trying HiLinkTrace for this instead)
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc


"FOR WINDOWS BOX
    "source $VIMRUNTIME/vimrc_example.vim
    "source $VIMRUNTIME/mswin.vim
    "behave mswin
    "set diffexpr=MyDiff()

    "function MyDiff()
    "  let opt = '-a --binary '
    "  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    "  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    "  let arg1 = v:fname_in
    "  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    "  let arg2 = v:fname_new
    "  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    "  let arg3 = v:fname_out
    "  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    "  let eq = ''
    "  if $VIMRUNTIME =~ ' '
    "    if &sh =~ '\<cmd'
    "      let cmd = '""' . $VIMRUNTIME . '\diff"'
    "      let eq = '"'
    "    else
    "      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    "    endif
    "  else
    "    let cmd = $VIMRUNTIME . '\diff'
    "  endif
    "  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    "endfunction
