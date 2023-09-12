
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://stackoverflow.com/a/48390668

function! UseTabs()
    set tabstop=4     " Size of a hard tabstop (ts).
    set shiftwidth=4  " Size of an indentation (sw).
    set noexpandtab   " Always uses tabs instead of space characters (noet).
    set autoindent    " Copy indent from current line when starting a new line (ai).
endfunction

function! UseSpaces()
    set tabstop=8     " Size of a hard tabstop (ts). " Set to 8 so tabs don't masquerade as spaces
    set shiftwidth=4  " Size of an indentation (sw).
    set expandtab     " Always uses spaces instead of tab characters (et).
    set softtabstop=0 " Number of spaces a <Tab> counts for. When 0, featuer is off (sts).
    set autoindent    " Copy indent from current line when starting a new line.
    set smarttab      " Inserts blanks on a <Tab> key (as per sw, ts and sts).
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call UseSpaces ()

set background=dark
set number

nmap ` <ESC>i
nmap t p

" Clear search on space
set hlsearch
highlight Search guibg=LightBlue
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set incsearch
set ignorecase
set smartcase

set backspace=indent,eol,start

set scrolloff=25

" 2 line statusbar
set laststatus=2

" Line wrapping
set nowrap

" Hidden open buffers
set hidden

" Q / KDB
" source ~/.vim/nested.vim
" source ~/.vim/syntax/k.vim
" source ~/.vim/syntax/q.vim
" filetype plugin indent on " Vundle wants this off
syntax on

" Trailing spaces
highlight ExtraWhiteSpace ctermbg=red guibg=red
2match ExtraWhiteSpace /\s\+$/

" Get the match nonsense to work correctly for multiple windows
autocmd VimEnter * autocmd WinEnter * let w:created = 1
autocmd WinEnter * if (!exists ("w:created")) | 2match ExtraWhiteSpace /\s\+$/ | endif

" Highlighting stays after cursor moves
nnoremap <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>

source ~/scripts/visual_select.vim

" Clear last seach
nnoremap <Space> :match<CR> :noh<CR>

" Set Ctrl + {Left|Right} Arrow to move between windows
nnoremap <C-Right> <C-W>l
nnoremap <C-Left> <C-W>h
" nnoremap <C-Up> <C-W>k
" nnoremap <C-Down> <C-W>j

" Ctrl + Backspace like Windows
nnoremap <A-BackSpace> db

" Tab contol
nnoremap <A-Left> :tabprev<CR>
nnoremap <A-Right> :tabnext<CR>

" Set Ctrl + {Up|Down} Arrow to move line
nnoremap <C-Up> :call feedkeys (line ('.') == 1 ? '' : 'ddkP') <CR>
nnoremap <C-Down> ddp

" Stop vim from unfolding everything below when an unmatched paren given
" http://stackoverflow.com/questions/4630892/vim-folds-open-up-when-giving-an-unmatched-opening-brace-parenthesis
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

nnoremap <C-Tab> <C-W>l
nnoremap <C-S-Tab> <C-W>h

" Setup vertical split of a single file
:noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" Get rid of nonsense F1 style help
nnoremap <F1> <nop>

map <ESC>[D <C-Left>
map <ESC>[C <C-Right>

