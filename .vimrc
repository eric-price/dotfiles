call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-signify' " git changes
Plug 'ctrlpvim/ctrlp.vim'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'mileszs/ack.vim'
Plug 'ntpeters/vim-better-whitespace'
"Plug 'raimondi/delimitmate' " provides automatic closing of quotes, parenthesis, brackets
Plug 'saltstack/salt-vim'
Plug 'sheerun/vim-polyglot' " syntax and indentation support
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive' " git intergration
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
call plug#end()

syntax enable
filetype plugin indent on

" Create backup directory if it doesn't exist
if !isdirectory($HOME."/.vim/tmp")
  call mkdir($HOME."/.vim/tmp", "p")
endif

set autoindent
set nocompatible
set autoread " detect file changes and read again
set backspace=start,eol,indent " fix backspace
set confirm " dialogue asking if you wish to save changed files
set expandtab " tabs are spaces
set ignorecase " ignore case when searching
set incsearch " search as characters are entered
set hlsearch " highlight search pattern
set laststatus=2 " always display status line
set mouse=a " enable mouse support
set noerrorbells
set noshowmode " Don't show the current mode (lightline.vim takes care of this)
set nostartofline " stop certain movements from always going to the first character of a line
set number " show line numbers
set scrolloff=3 " lines display above/below cursor when scrolling
set shiftwidth=4 " normal mode indentation commands use 2 spaces
set showcmd " show command in bottom bar
set showmatch " highlight matching [{()}]
set smartcase " search case sensitive when uppercase is used
set softtabstop=4 " number of spaces in tab when editing
set tabstop=4 " number of visual spaces per TAB
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
set shiftround " when shifting lines, round the indentation to the nearest multiple of shiftwidth.
set hidden

" show line break character
set breakindent
set breakindentopt=sbr
set showbreak=..

if has('unix')
  if has('mac')
    set clipboard=unnamed " copy/paste to system clipboard
  else
    set clipboard=unnamedplus " copy/paste to system clipboard
  endif
endif

" ===== Display ======

set background=dark
"set t_Co=256  " 256 colours in terminal.
"set term=xterm-256color
"set term=screen-256color
silent! colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
" Fix vim colorscheme in tmux
if &term =~# '^screen'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
if (has("termguicolors"))
  set termguicolors
endif

" ===== Shortcuts =====

let mapleader = "\<Space>"  " leader is space key
map <C-n> :NERDTreeToggle<CR>

set pastetoggle=<F2>
nnoremap <Leader>q :set number!<CR>

" Map tab to % - moves to nearest bracket match
nnoremap <tab> %
vnoremap <tab> %

let g:ackprg = 'rg --vimgrep --no-heading' " Use ripgrep when searching via ack.vim
nnoremap <Leader>a :Ack!<space>

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

" Clear search highlight
nnoremap <silent><esc><esc> :nohlsearch<CR>

" Buffers
nnoremap <Leader>b :buffers<CR>:buffer<Space>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprev<CR>

" EasyMotion
map <Leader>f <Plug>(easymotion-bd-f)
map <Leader>w <Plug>(easymotion-bd-w)

" Netrw
"map <Leader>e :Explore<CR>
"map <Leader>s :Sexplore<CR>
"map <Leader>v :Vexplore<CR>

" Use ripgrep when using Ctrl-P
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {'gitbranch': 'fugitive#head'},
      \ }
