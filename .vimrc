set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'

Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'valloric/youcompleteme'

Plugin 'godlygeek/tabular'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Color scheme
Plugin 'altercation/vim-colors-solarized'

call vundle#end()

syntax on
filetype plugin indent on

" Show existing tab with 2 spaces width
set tabstop=2

" When indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab

" Showing line numbers
set number 
set numberwidth=3
" set relativenumber
set ruler

" Switching normal to relative numbers"
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
                  
nnoremap <C-N> :call NumberToggle()<cr>

" Only use relative numbers when in focus
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" Don't use relative numbers in insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" For general swagger
set ic hls is cursorline

" Store temporary files in a central spot
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Move the splits arround!
nmap <silent> <c-s-k> <C-W>k
nmap <silent> <c-s-j> <C-W>j
nmap <silent> <c-s-h> <C-W>h
nmap <silent> <c-s-l> <C-W>l

" Nerdtree
autocmd vimenter * NERDTree
map <C-n>: :NERDTreeToggle<CR>

" Nerdtree git plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"    : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"     : "✗",
\ "Clean"     : "✔︎",
\ "Unknown"   : "?"
\ }

" NERDcommenter
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERTrimTrailingWhitespace = 1

set laststatus=2
set t_Co=256

" ctrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" closetag.vim
let g:closetag_filenames = "*.html,*.xhtml,*.phtml"

" Solarized
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Tagbar
nmap <F8> :TagbarToggle<CR>

ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O>

hi Normal ctermbg=none

" Airline theme
let g:airline_theme='solarized'
let g:airline_solarized_dark_inactive_border = 1
