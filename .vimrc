" Load default settings
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

"-------------------------------------
" APPEARANCE
"-------------------------------------

set title
set number
set nowrap
set colorcolumn=120

set background=dark
let g:gruvbox_invert_selection=0


"-------------------------------------
" TEXT EDITING
"-------------------------------------

set encoding=utf-8

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

set showmatch

" Copy selection to clipboard with '\y'
map <Leader>y "*y

" Paste from clipboard into a new line with '\p'
nmap <Leader>p :pu *<CR>

" Disable arrow keys for moving around
noremap <Up> <NOP>
inoremap <Up> <NOP>
noremap <Down> <NOP>
inoremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Disable quote concealing in JSON files
let g:vim_json_syntax_conceal = 0


"-------------------------------------
" SEARCHING
"-------------------------------------

set hlsearch
set ignorecase smartcase

" Mute search highlighting with <C-l>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>


"-------------------------------------
" FILE MANAGEMENT
"-------------------------------------

set hidden

" Switch between files with '\\'
nnoremap <Leader><Leader> <C-^>

" Git: Always go to the first line when writing a Git commit message
if has("autocmd")
  augroup gitCommitMessage
    autocmd!
    autocmd BufReadPost COMMIT_EDITMSG
      \ exe "normal! gg"
  augroup END
endif
