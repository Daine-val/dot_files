"-- General ------------------------------------------------------------------"
set history=150    " How many lines of history to remember
set encoding=utf-8 " we want utf-8 encoding
"set viminfo+=!     " make sure it can save viminfo

" Enable Pathogen
execute pathogen#infect()

"-- Theme/Colours ------------------------------------------------------------"
set background=dark " Use a dark background
set t_Co=256        " Use 256 colours
filetype plugin on  " Enable file detection
syntax on           " Enable syntax highlighting
colorscheme badwolf " Set our colour scheme


"-- Spaces and Tabs ----------------------------------------------------------"
set expandtab            " Expand tabs to be spaces
set softtabstop=4        " Number of spaces in tab when editing
set cindent shiftwidth=4 " How many spaces to indent with > and <


"-- Searching ----------------------------------------------------------------"
set incsearch            " Search as you type
set hlsearch             " Highlight Search results
set ignorecase smartcase " Only search case sensitive if you include case

" turn off search highlight with "\ "
nnoremap <leader><space> :nohlsearch<CR>


"-- Files/Backups ------------------------------------------------------------"
set nobackup " Don't keep a copy of the file


"-- Vim UI -------------------------------------------------------------------"
" Avoid "Hit ENTER to continue" messages
set shortmess=aI       " shortens messages to avoid 'press a key' prompt
"set cmdheight=1        " the command bar is 2 high

set lazyredraw         " do not redraw while running macros (much faster)
set hidden             " you can change buffer without saving

set backspace=2        " make backspace work normal
set whichwrap+=<,>,[,] " Cursor keys wrap too

set report=0           " Always show what the changed via commands
set ruler              " Always show current positions along the bottom
set laststatus=2       " Always show the statusline

set noerrorbells       " don't make noise on errors
set novisualbell       " don't blink

set scrolloff=5        " Keep 5 lines above and below visable

filetype indent on     " load filetype-specific indent files

" Fallback status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [POS=%04l,%04v][%p%%]


"-- Folding ------------------------------------------------------------------"
"set foldenable        " enable folding
"set foldlevelstart=10 " open most folds by default
"set foldmethod=indent " fold based on indent level


"-- Configure vim-airline ----------------------------------------------------"
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1

let g:ansible_attribute_highlight = 'ab'

"-- Visual Cues --------------------------------------------------------------"
set showmatch                  " show matching brackets

set cursorline                 " Highlight the current line
set number                     " show line numbers
set colorcolumn=80             " highlight column 80

set wildmenu                   " turn on wild menu
set wildmode=list:longest,full " better tab completion


"-- Autocmds -----------------------------------------------------------------"
" Remeber position from last time the fiel was opened
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Vagrantfiles should be ruby
autocmd BufRead Vagrantfile set filetype=ruby


"-- Mappings -----------------------------------------------------------------"
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

" Corrections for common typos
nmap :W :w
nmap :X :x
nmap :Q :q

" Move vertically by visual line
nmap j gj
nmap k gk

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
