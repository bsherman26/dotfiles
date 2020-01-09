" Brian Sherman's Vim Configuration
"

"--------------------------------------------------------------------------
" Gerneral
"--------------------------------------------------------------------------

set nocompatible

" Load Plugins (Vundle)
source ~/.vim/vundle.vim


" GUI > Widgets and Scrollbars > Remove
if has('gui_running')
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions-=m
    set guifont=Monospace\ 11
    "set guifont=*
endif

" Command-line Completion => Enhanced Mode
set wildmenu

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the 'must save first' error doesn't come up)
set hidden


"--------------------------------------------------------------------------
" Color Scheme
"--------------------------------------------------------------------------
" TODO:
"
" TODO: PLAY WITH LATER
"       Change color of selected item background
"       in Popup Menu in color terminal
"           :hi PmenuSel ctermfg=15
"
"--------------------------------------------------------------------------

"-----------------
" General
"-----------------
syntax enable
set background=dark

"-----------------
" GUI
"-----------------
if has('gui_running')
    colorscheme koehler
    "let g:solarized_termtrans=1
    "let g:solarized_termcolars = 256
    "let g:solarized_contrast="high"
    "let g:solarized_visibility="high"
    "colorscheme solarized

"-----------------
" Terminal
"-----------------
else
    colorscheme mango
    "colorscheme 0x7A69_dark
    "colorscheme DevC++
    "colorscheme kolor
    "colorscheme molokai
    "colorscheme Monokai
    "colorscheme CodeFactoryv3
    "colorscheme desert
    "colorscheme black_angus
    "colorscheme vividchalk
    "colorscheme slate
    "colorscheme koehler
    "colorscheme blackboard
    "colorscheme blazer
    "colorscheme torte
    "colorscheme pablo
    "colorscheme murphy
endif


"--------------------------------------------------------------------------
" Filetype Options
"--------------------------------------------------------------------------
augroup vimrc
    autocmd!

    "-------------------------
    " File-Open
    "-------------------------

    " EPUB Viewing
    autocmd BufReadCmd *.epub call zip#Browse(expand("<amatch>"))


    "-------------------------
    " File-Type > Default
    "-------------------------

    set filetype=on
    filetype plugin indent on

    " Allow backspacing over everything in insert mode
    " NOTES:
    " (This is the default most places)
    " FROM vimrc_example
    set backspace=indent,eol,start

    " File-Type-Options > Global > Set
    set number         " Line-Numbers > Show
    set textwidth=79   " Line-Length  > Max
    set expandtab      " expandtab
    set autoindent     " autoindent
    set tabstop=4      " tabstop
    set softtabstop=4  " softtabstop
    set shiftwidth=4   " shiftwidth = 0 => sw=ts


    "-------------------------
    " File-Type > Change
    "-------------------------

    " Function => Reset File Type Options
    function FtReset()
        setlocal number         " Line-Numbers > Show  (nu)
        setlocal textwidth=79   " Line-Length  > Max   (tw)
        setlocal expandtab      " expandtab            (et)
        setlocal autoindent     " autoindent           (ai)
        setlocal tabstop=4      " tabstop              (ts)
        setlocal softtabstop=4  " softtabstop          (sts)
        setlocal shiftwidth=4   " shiftwidth           (sw)
    endfunction

    " File-Type-Options > Reset
    autocmd FileType *    call FtReset() " Reset File-Type Options Before Setting New

    " make => (Keep Tabs, Don't break lines)
    autocmd FileType make setlocal textwidth=0            " Dont Break Lines                (tw)
    autocmd FileType make setlocal noexpandtab            " Dont Expand Tabs                (noxt)
    autocmd FileType make setlocal linebreak              " Wrap Lines at wordish boundarys (lbr)

    " Text => (Keep Tabs, Don't break lines)
    autocmd FileType text setlocal textwidth=0            " Dont Break Lines                (tw)
    autocmd FileType text setlocal noexpandtab            " Dont Expand Tabs                (noxt)
    autocmd FileType text setlocal linebreak              " Wrap Lines at wordish boundarys (lbr)
    "autocmd FileType text setlocal spell spelllang=en_us  " Turn on Spell Check

    " HTML => (tab-width 2(3) chr, Don't break lines)
    autocmd FileType html setlocal tw=0
    autocmd FileType html setlocal ts=2
    autocmd FileType html setlocal sts=2
    autocmd FileType html setlocal sw=2

    " XHTML => (tab-width 2(3) chr, Don't break lines)
    autocmd FileType xhtml setlocal tw=0
    autocmd FileType xhtml setlocal ts=2
    autocmd FileType xhtml setlocal sts=2
    autocmd FileType xhtml setlocal sw=2

    " CSS => (tab-width 2 chr, Break at 79th char)
    autocmd FileType css setlocal ts=2
    autocmd FileType css setlocal sts=2
    autocmd FileType css setlocal sw=2
    autocmd FileType css setlocal nowrap

    "-------------------------
    " TODO: OFF
    "-------------------------

    " TODO: OFF
    " Ruby
    "autocmd FileType ruby setlocal tw=0
    "autocmd FileType ruby setlocal ts=2
    "autocmd FileType ruby setlocal sts=2
    "autocmd FileType ruby setlocal sw=2

    " TODO: OFF
    " Jade
    "autocmd FileType jade setlocal tw=0
    "autocmd FileType jade setlocal ts=2
    "autocmd FileType jade setlocal sts=2
    "autocmd FileType jade setlocal sw=2
augroup END


"--------------------------------------------------------------------------
" Key Mappings & Plugin Config
"--------------------------------------------------------------------------
" Bindings:
"--------------------------------------------
"
"----------------------
" Commands:
"----------------------
"----------------------
" General:
"----------------------
"   \ev     => vimrc > Edit
"   \sv     => vimrc > Source
"
"   \b      => Open Termianal in New Window
"   \B      => Open Termianal in Current Window
"   \g      => Open Termdebug/GDB with no file (:Termdebug)
"
"   <F2>    => Paste-Mode    > Toggle
"----------------------
" TABs: (For All Tabs)
"----------------------
"   \te     => Wndows Equals Size (Ctrl-W Ctrl-=)
"   \tm     => Left-Column -> :mkview   
"   \ts     => Left-Column -> :loadview
"----------------------
" GUI_Only:
"----------------------
"   Ctrl-Up     => Font-Size > Increase
"   Ctrl-Down   => Font-Size > Decrease
"   Ctrl-kPlus  => Font-Size > Increase
"   Ctrl-kMinus => Font-Size > Decrease
"   Ctrl-kEnter => Font-Size > Initial
"----------------------
"----------------------
" Markers:
"----------------------
"
"   ,/      => Search-Result   > Highlight > Toggle
"   \s      => Spell-Check     > Highlight > Toggle
"   \l      => Show-Invisibles             > Toggle
"
"----------------------
" Plugins:
"----------------------
"
"   Ctrl-p  => Ctrl-P_File-Search
"
"   \v      => Yank-Ring   > Toggle
"   \p      => Nerd-Tree   > Toggle
"   \d      => DelimitMate > Toggle
"
"   Ctrl-o  => TagList   > Toggle
"----------------------
"
"--------------------------------------------------------------------------


"-----------------------------------------------
" General
"-----------------------------------------------

"----------------------------
" Helpers
"----------------------------

" Vimrc Helpers
    " (e)dit (v)imrc (\ev)
    nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
    " (s)ource (v)imrc (\sv)
    nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

":w/:W -> Fix mistake with :W for :w
    command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
    "command! -bang Q quit<bang>

" Paste-Mode > Toggle
    set pastetoggle=<F2>

"-----------------------------------------------
" Navigation
"-----------------------------------------------

"----------------------------
" Nav > Cursor
"----------------------------

" Cursor Stops on Visually Wrapped Lines
    nnoremap j gj
    nnoremap k gk

"----------------------------
" Nav > Window & Tab
"----------------------------
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap ( gT
noremap ) gt

"----------------------------
" Visual Markers
"----------------------------

" Search-Result > Highlighting > Toggle  => (,/)
    nnoremap <silent> ,/ :set hlsearch!<CR>

" Spell-Check > Highlighting > Toggle    => (\s)
    nnoremap <silent> <leader>s :setlocal spell! spelllang=en_us<CR>

"Show-Invisibles Toggle                  => (\l)
    nnoremap <leader>l :set list!<CR>
    "Invisibles-Characters
    set listchars=tab:▸\ ,eol:¬

"----------------------------
"NERD Commenter
"----------------------------
let g:NERDCustomDelimiters = {
    \ 'c': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
\ }
  "-------------------------------------------------
  "-------------------------------------------------
    "\ 'c': { 'left': '// ', 'leftAlt': '/*', 'rightAlt': '*/' },
    "\ 'javascript': { 'left': '// ', 'leftAlt': '/*', 'rightAlt': '*/' },
    "\ 'lua': { 'left': '-- ', 'leftAlt': '--[[', 'rightAlt': ']]' },
    "\ 'python': { 'left': '# ', 'leftAlt': '#' },
    "\ 'sed': { 'left': '# ', 'leftAlt': '#' },
  "-------------------------------------------------
  "-------------------------------------------------
    "\ 'awk': { 'left': '#' },
    "\ 'calibre': { 'left': '//' },
    "\ 'c': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    "\ 'cpp': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    "\ 'cmake': { 'left': '#' },
    "\ 'crontab': { 'left': '#' },
    "\ 'cs': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    "\ 'java': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    "\ 'javascript': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
    "\ 'lua': { 'left': '--', 'leftAlt': '--[[', 'rightAlt': ']]' },
    "\ 'python': { 'left': '# ', 'leftAlt': '#' },
    "\ 'sed': { 'left': '#' },
    "\ 'wget': { 'left': '#' },
    "\ 'yaml': { 'left': '#' },

"----------------------------
" Yank Ring (Paste History)
"----------------------------
" TODO:
"
" TODO: The let statement causes problems in console invocation:
"           - When a file is first opened:
"               - Something may be pasted
"               - The file opens in insert or replace mode.
"
"----------------------------
"TODO: CHANGE Mapping or Remove
nnoremap <silent> <leader>v :YRShow<CR>
"let g:yankring_window_use_horiz = 0
"let g:yankring_window_use_right = 0
"let g:yankring_window_increment = 50
"let g:yankring_window_width = 30
"nnoremap <silent> <F11> :YRShow<CR>
"let g:yankring_replace_n_pkey = '<C-[>'
"let g:yankring_replace_n_nkey = '<C-]>'
"let g:yankring_replace_n_pkey = '<C-[>'
""let g:yankring_replace_n_pkey = '<c-[>'

"-----------------------------------------------
" Terminals
"-----------------------------------------------

" Open Bash Terminal in New Window (\b)
    nnoremap <leader>b :ter<CR>

" Open Bash Terminal Current Window (\B)
    nnoremap <leader>B :ter ++curwin<CR>

" Termdebug
packadd termdebug

    " Open GDB with no File (\g)
        nnoremap <leader>g :Termdebug<CR>

    " Open GDB with no File (\G)
        "nnoremap <leader>G :Termdebug ++curwin<CR>

"-----------------------------------------------
" Tabdo
"-----------------------------------------------

" TabdoFunc()
    "function TabdoFunc(func)
        "tabdo call func()
    "endfunction

" Tabs-Vertical > Half/Even
    " Function => Reset File Type Options
    nnoremap <silent> <leader>te :tabdo wincmd =<CR>
    "nnoremap <silent> <leader>te :tabdo :wincmd =<CR>

" Tabs-Vertical > Left > mkview
" TODO: This may not work as expected if there are 3 columns.
    function MkviewLeft()
        tabdo execute 'wincmd h' | mkview
        "tabdo execute 'wincmd h' | mkview | echom 'Tab Call'
        echom 'View Saved for the Left Window of all Tabs.'
    endfunction
    "nnoremap <silent> <leader>tm :call TabdoFunc(MkviewLeft)<CR>
    nnoremap <silent> <leader>tm :call MkviewLeft()<CR>
    "nnoremap <silent> <leader>tm :tabdo execute 'call MkviewLeft()' <bar> echom 'View Saved for the Left Window of all Tabs.'<CR>
    "TODO: GOOD=> nnoremap <silent> <leader>tm :tabdo call MkviewLeft()<CR>
    "nnoremap <silent> <leader>tm :tabdo execute ':wincmd h' <bar> :mkview'<CR>
    "nnoremap <silent> <leader>tm :tabdo :wincmd h<CR>:mkview<CR>
    "nnoremap <silent> <leader>hv :tabdo :wincmd h :mkview<CR>

" Tabs-Vertical > Left > loadview (lo)
" TODO: This may not work as expected if there are 3 columns.
    function LoadviewLeft()
        tabdo execute 'wincmd h' | loadview
        echom 'View Loaded for the Left Window of all Tabs.'
    endfunction
    nnoremap <silent> <leader>tl :call LoadviewLeft()<CR>
    "nnoremap <silent> <leader>tl :tabdo call LoadviewLeft()<CR>
    "nnoremap <silent> <leader>tl :tabdo :wincmd h<CR>:loadview<CR>


"-----------------------------------------------
" File Exploring
"-----------------------------------------------

"----------------------------
"NERDTree (\p)
"----------------------------
noremap <silent> <Leader>p :NERDTreeToggle<CR>

"----------------------------
"Ctrl-P
"----------------------------
"let g:ctrlp_map = '<c-[>'
let g:ctrlp_arg_map = 1   "When this is set to 1, the <c-o> & <c-y> mappings will accept one extra key as an argument
"set wildignore+=*/node_modules/*
let g:ctrlp_custom_ignore = { 'dir': 'node_modules' }


"-----------------------------------------------
" Syntax, etc.
"-----------------------------------------------

"----------------------------
" Taglist
"----------------------------
nnoremap <silent> <Leader>o :TlistToggle<CR>

"----------------------------
" Tagbar
"----------------------------
"nnoremap <silent> <Leader>o :TagbarToggle<CR>
"let g:tagbar_left = 1

"----------------------------
" SuperTab
"----------------------------
"let g:SuperTabDefaultCompletionType = TODO:\"<c-x><c-o>"
""let g:SuperTabContextDefaultCompletionType = TODO:\"<c-x><c-o>"

"----------------------------
" TODO: REMOVED
" Syntastic
"----------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"----------------------------
" DelimitMate => (\d)
"----------------------------
nnoremap <silent> <Leader>d :DelimitMateSwitch<CR>
"let delimitMate_offByDefault = 1   "Prevent delimitMate from loading until :DelimitMateSwitch is called
let delimitMate_expand_cr = 1
let delimitMate_jump_expansion = 1
"let delimitMate_expand_space = 1


"-----------------------------------------------
" Font Size Adjust
"-----------------------------------------------
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize  = 6
let s:initfontsize = 10
let s:maxfontsize  = 16
function! AdjustFontSize(amount)
  if has("gui_running") && has("gui_gtk2") || has("gui_gtk3")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    if (a:amount == 0)
        let cursize = s:initfontsize
    endif
    let newsize = cursize + a:amount
    "echom fontname
    "echom cursize
    "echom newsize
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      "echom newfont
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! IniterFont()
  call AdjustFontSize(0)
endfunction
command! IniterFont call IniterFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

nnoremap <silent> <C-Up> :LargerFont<CR>
nnoremap <silent> <C-kPlus> :LargerFont<CR>
"nnoremap <silent> <C-+> :LargerFont<CR>
"nnoremap <silent> <C-Plus> :LargerFont<CR>
nnoremap <silent> <C-Down> :SmallerFont<CR>
nnoremap <silent> <C-kMinus> :SmallerFont<CR>
"nnoremap <silent> <C-_> :SmallerFont<CR>
"nnoremap <silent> <C-Minus> :SmallerFont<CR>
nnoremap <silent> <C-kEnter> :IniterFont<CR>
"nnoremap <silent> <C-Equal> :IniterFont<CR>
"nnoremap <silent> <C-=> :IniterFont<CR>


"-----------------------------------------------
" TODO: REVIEW
" FROM vimrc_example
"-----------------------------------------------

"" Show syntax highlighting groups for word under cursor (From Vim
"" Casts)(Conisder Trying HiLinkTrace for this instead)
"nnoremap <C-S-P> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
  "if !exists("*synstack")
    "return
  "endif
  "echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, \"name")')
"endfunc
