set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'wincent/command-t'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree'

" Javascript specific plugins
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'marijnh/tern_for_vim'

" CSS specific
Plugin 'groenewege/vim-less'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" syntastic configuration
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 "quit on :wq, :ZZ :x without check
let g:syntastic_auto_jump = 2 "jump to first error on check,

" some commant t config to ignore certain dirs
set wildignore+=node_modules,dev,dist,doc,reports

" Enable syntax highlighting
set t_Co=256
syntax on

" color scheme solarized
set background=dark
colorscheme solarized

" use bash instead of fish as shell since some of the plugins are not
" compatible with fish
set shell=bash

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

"------------------------------------------------------------
" Must have options {{{1
"

" don't force saving of buffers when switching to another one
set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

"------------------------------------------------------------
" Usability options {{{1
"

" set leader to , instead of \
let mapleader=","

" Enable folding
au FileType javascript call JavaScriptFold()
set foldlevelstart=99

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
"press <Enter> to continue
set cmdheight=2

" Display line numbers on the left
set number

" allow toggling to relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
"set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 2 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2

" intelligent comments
set comments=s1:/*,mb:\ *,elx:\ */

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
noremap <F3> :Autoformat<CR><CR>
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-i> :call NumberToggle()<cr>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
imap <C-c> <CR><Esc>O
nnoremap <Space> za

" mappings for command-t file search
nnoremap <silent> <Leader>f :CommandT<CR>
nnoremap <silent> <Leader>b :CommandTBuffer<CR>

" easy buffer cycling
nnoremap <C-m> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
