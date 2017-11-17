call plug#begin('~/.vim/plugged')
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'raimondi/delimitmate'
Plug 'tomasr/molokai'
Plug 'saltstack/salt-vim'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
call plug#end()

syntax enable
filetype plugin indent on

set autoindent
set backspace=start,eol,indent " fix backspace
set confirm " dialogue asking if you wish to save changed files
set copyindent " copy the previous indentation on autoindenting
set expandtab " tabs are spaces
set ignorecase " ignore case when searching
set incsearch " search as characters are entered
set laststatus=2 " always display status line
set mouse=a " enable mouse support
set nocompatible " remove vi compatibility
set noerrorbells
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " stop certain movements from always going to the first character of a line
set number " show line numbers
set scrolloff=3 " lines display above/below cursor when scrolling
set shiftwidth=2 " normal mode indentation commands use 2 spaces
set showcmd " show command in bottom bar
set showmatch " highlight matching [{()}]
set smartcase " search case sensitive when uppercase is used
set smartindent
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set softtabstop=2 " number of spaces in tab when editing
set tabstop=2 " number of visual spaces per TAB
set title " Show the filename in the window titlebar
set visualbell " Use visual bell instead of audible bell
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store,*/.git/*,.swp
set wildmenu " visual autocomplete for command menu
set wildmode=longest,list,full
set complete-=i " word completion (options .,w,b,u,t,i) in insert mode (ctrl-p)
set lazyredraw " don’t update screen during macro and script execution
set backupdir=~/.vim/tmp/ " backup files
set directory=~/.vim/tmp/ " swap files
set relativenumber " show relative line numbers
set shiftround " when shifting lines, round the indentation to the nearest multiple of shiftwidth.

" show line break character
set breakindent
set breakindentopt=sbr
set showbreak=↪>\

if has('unix')
  if has('mac')
    set clipboard=unnamed " copy/paste to system clipboard
    set rtp+=/usr/local/opt/fzf " enable fzf support
  else
    set clipboard=unnamedplus " copy/paste to system clipboard
    set rtp+=~/.fzf " enable fzf support
  endif
endif

" ===== Display ======

if (has("termguicolors"))
 set termguicolors
endif
set background=dark
"set t_Co=256  " 256 colours in terminal.
let g:airline_theme='molokai'
colorscheme molokai
set term=xterm-256color

" ===== Shortcuts =====

let mapleader = "\<Space>"  " leader is space key
map <silent> <C-n> :NERDTreeFocus<CR>
" Map tab to % - moves to nearest bracket match
nnoremap <tab> %
vnoremap <tab> %

let g:ackprg = 'rg --vimgrep --no-heading' " Use ack.vim to search via rg
nnoremap <Leader>a :Ack!<space>

nnoremap <Leader>1 i{{ salt['ktpillar.get']('') }}<ESC>4hi

" split pane vertically
nnoremap <Leader>w <C-w>v<C-w>l

nnoremap <Leader>f :Vexplore<CR>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" move focus on window panes
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>k <C-w>k
nnoremap <Leader>j <C-w>j

" disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nmap ; :buffers<CR>:buffer<Space>

" Use ripgrep when using Ctrl-P
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
