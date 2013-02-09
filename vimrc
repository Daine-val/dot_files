"""""""""""
" General "
"""""""""""

set nocompatible " get out of horrible vi-compatible mode
filetype on " detect the type of file
set history=1000 " How many lines of history to remember
set cf " enable error files and error jumping
filetype plugin on " load filetype plugins
set viminfo+=! " make sure it can save viminfo
set isk+=_,$,@,%,#,- " none of these should be word dividers, so make them not be
" stops crappy vim tab completion
set wildmode=list:longest,full

"""""""""""""""""
" Theme/Colours "
"""""""""""""""""
set background=dark " we are using a dark background
syntax on " syntax highlighting on
" Some good colours: koehler, murphy, pablo, ron
colorscheme koehler 
set encoding=utf-8

"""""""""""""""""
" Files/Backups "
"""""""""""""""""
set nobackup
set nowritebackup


""""""""""
" Vim UI "
""""""""""
set lsp=0 " space it out a little more (easier to read)
set wildmenu " turn on wild menu
set ruler " Always show current positions along the bottom
set cmdheight=2 " the command bar is 2 high
set lz " do not redraw while running macros (much faster) (LazyRedraw)
set hid " you can change buffer without saving
set backspace=2 " make backspace work normal
set whichwrap+=<,>,h,l  " backspace and cursor keys wrap to
set shortmess=atI " shortens messages to avoid 'press a key' prompt
set report=0 " tell us when anything is changed via :...
set noerrorbells " don't make noise

"""""""""""""""
" Visual Cues "
"""""""""""""""
set ts=4
set cindent shiftwidth=4
" Expand tabs to be spaces
set et
" show matching brackets
set showmatch
" how many tenths of a second to blink matching brackets for
set mat=4
" do not highlight searched for phrases
"set nohlsearch
" BUT do highlight as you type you search phrase
set incsearch
" only search case sensitive if you include case
set ignorecase smartcase
set novisualbell " don't blink
set noerrorbells " no noises
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [POS=%04l,%04v][%p%%]
" .t file are perl too
autocmd BufRead *.t set filetype=perl
" do indent comments in perl files
autocmd BufRead *.pl,*.pm,*.t set cindent cinkeys=0{,0},:,!^F,o,O,e

""""""""""""
" Mappings "
""""""""""""

" switch windows
map <tab> <C-W>w
" resize window
map <C-H> <C-W>h<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map Oa <C-W>-
map Ob <C-W>+

" ctrl-s saves
map  :w<CR>
map!  :w<CR><Insert>

" Ctrl-left/right move between words
"map [C w
"map [D b
"" map! [C wa
"" map! [D ba
"imap [C wa
"imap [D ba

" Numpad puts in numbers
map Oq 1
map!  Oq 1
map Or 2
map!  Or 2
map Os 3
map!  Os 3
map Ot 4
map!  Ot 4
map Ou 5
map!  Ou 5
map Ov 6
map!  Ov 6
map Ow 7
map!  Ow 7
map Ox 8
map!  Ox 8
map Oy 9
map!  Oy 9
map Op 0
map!  Op 0
map Ol +
map!  Ol +
map OS -
map!  OS -
map OR *
map!  OR *
map OQ /
map!  OQ /
map On .
map! On .

nmap :W :w
nmap :X :x
nmap :Q :q

map <F2> :set hls!<CR>
map <F3> :set number!<CR>
map <F5> :set wrap!<CR>
map <F6> :set paste!<CR>
map <F7> :set et!<CR>
map <F7> :sp <cfile><CR>
map <F8> :vs <cfile><CR>

map <F9> :bn<CR>
map <F10> :bp<CR>

nmap j gj
nmap k gk


