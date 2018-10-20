" General {{{
  let mapleader="," "set map leader to comma
  set mouse=a "full mouse support
  set clipboard+=unnamed "use macOS clipboard
  autocmd BufWritePre * %s/\s\+$//e "remove trailing spaces on :w
"}}}

" Docker {{{
  set noswapfile
  set nobackup
  set nowb
"}}}

" Appearance {{{
  set number "show line numbers
  set noshowmode "hide vim mode as lightline will display it
  set ttyfast "faster redrawing
  set laststatus=2 "show additional information on lightline
  set list
"}}}

" Searching {{{
  set ignorecase " case insensitive searching
  set smartcase " case-sensitive if expresson contains a capital letter
  set hlsearch " highlight search results
  set incsearch " set incremental search, like modern browsers
  set nolazyredraw " don't redraw while executing macros
  set magic " set magic on, for regex
  set inccommand=nosplit "preview substitute regex
" }}}

"Indentation {{{
  set autoindent
  set smartindent
  set smarttab
  set shiftwidth=2
  set softtabstop=2
  set tabstop=2
  set expandtab
  filetype plugin on
  filetype indent on
"}}}

"persistent undo
if has('persistent_undo') && isdirectory(expand('~').'/.config/nvim/backups')
  silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
  set undodir=~/.config/nvim/backups
  set undofile
endif

"code completion
set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/plugins_settings.vim

"color theme
syntax enable
set background=dark
colorscheme onedark
