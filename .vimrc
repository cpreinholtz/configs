set number 
set tabstop=2 
set shiftwidth=2 
set expandtab


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright             " when splitting, force new location
set noequalalways                     " when splitting, split current window, don't resize others.
set ruler                             " show the cursor position all the time
set showmode                          " Mode shown in command line
set scrolloff=4                       " Don't let cursor rail to top or bottom
set showmatch                         " flash to matching brackets
set matchtime =2                      " be quick about it
set hlsearch                          " highlight the last used search pattern.
set incsearch                         " do incremental searching
set number                            " show line numbers
set wildmenu                          " use tab for complete options in command line
set wildmode =list:longest,full       " be fairly comprehensive
"tab settings
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab shiftround smarttab
set smartindent
set breakindent                       " line-wrap maintains block indentation level
set breakindentopt=min:40,shift:-1    " but don't make it less than 40 cols, and since we're marking with a leading ※, shift it left once.
"hi Comment ctermfg=LightBlue
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable mouse if exists.
if has('mouse')
  set mouse=a
  "set mouse=i
   "this only uses mouse in inset mode
   "HOLD SHIFT WHILE SELECTING TXT TO SKIP VISUAL MODE!!!!
endif
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif
" Block cursor for normal mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
  \ | wincmd p | diffthis
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"F11 toggles line numbers
:nmap <F11> :set invnumber<CR>
"space clears highlights
nnoremap <space> :nohlsearch<CR>
"F12 is spelling
nnoremap <F12> :setlocal spell! spelllang=en<cr>
