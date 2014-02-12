" Use Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect()

"-------------------------------------
" General config
"-------------------------------------

filetype plugin indent on

set encoding=utf-8              " Enforce UTF-8

set nocompatible                " Adjust some values to Vim, not Vi
set hidden                      " Allow switching between unsaved buffers
set ttyfast                     " Send more characters to the terminal, improving window redraw
set nowrap                      " Turn off line wrap
"set virtualedit=all            " Allow moving to areas with no text

set title                       " Show filename on the footer
set ruler                       " Show cursor position on the footer
set number                      " Show line numbers
set colorcolumn=120             " Show a guideline at column 120
set linespace=1                 " Adjust the vertical space between lines

set showmatch                   " Show tags related to that under the cursor
set incsearch                   " Show results as the search term is typed
set hlsearch                    " Highlight search results
set ignorecase smartcase        " Search case-insensitively if search term contains only lowercase letters

set expandtab                   " Convert tabs to spaces
set tabstop=4                   " Tabs are four spaces wide
set shiftwidth=4                " Auto indent tabs are four spaces wide
set softtabstop=4               " <Backspace> goes back four spaces when on an indentation
set autoindent                  " Keep previous line's indentation when creating a new one
set backspace=indent,eol,start  " <Backspace> works on autoindents, line breaks and start of line


set t_Co=256                    " Activate 256 colors support
set background=light            " Set background
syntax on                       " Enable syntax highlighting
colorscheme solarized           " Set colorscheme


"-------------------------------------
" Custom mappings
"-------------------------------------

""" Remap leader to ','
let mapleader=","

""" Switch between splits with <C-hjkl>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

""" Switch between files with ',,'
nnoremap <Leader><Leader> <C-^>

""" Copy selection to clipboard with ',y'
map <Leader>y "*y

""" Use ',f' for CtrlP
map <Leader>f <C-p>

""" Disable arrows for moving around
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

""" <Enter> cleans search results
function! MapCR()
  nnoremap <CR> :nohlsearch<CR>
endfunction
call MapCR()

""" <Tab> completes if not on the start
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <TAB> <C-r>=InsertTabWrapper()<CR>
inoremap <S-TAB> <C-n>

""" Rename the current file with ',n'
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

"-------------------------------------
" Custom autocmds
"-------------------------------------
augroup vimrcEx
  autocmd!
  " Go to the last line seen on this file
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

"-------------------------------------
" Specific config
"-------------------------------------
""" SQL
let g:sql_type_default = 'mysql'