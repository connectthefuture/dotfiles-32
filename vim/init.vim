if &compatible
  set nocompatible
endif
"----------------------------------------
" dein setup:
set runtimepath^=~/.config/nvim/dein.vim/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.config/nvim/dein.vim'))
call dein#add('Shougo/dein.vim')
"----------------------------------------
" Utility
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimproc.vim', { 'build': 'make' })
call dein#add('tpope/vim-surround')
call dein#add('tomtom/tcomment_vim')
call dein#add('AndrewRadev/switch.vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('soramugi/auto-ctags.vim')
call dein#add('maxbrunsfeld/vim-yankstack')
call dein#add('tpope/vim-sleuth')
call dein#add('bling/vim-bufferline')
" Autocomplete
call dein#add('Shougo/deoplete.nvim')
" Text objects
call dein#add('kana/vim-textobj-user')
call dein#add('michaeljsmith/vim-indent-object')
call dein#add('glts/vim-textobj-comment')
call dein#add('kana/vim-textobj-line')
call dein#add('lucapette/vim-textobj-underscore')
call dein#add('jasonlong/vim-textobj-css')
" Git
call dein#add('tpope/vim-fugitive')
" File nav
call dein#add('scrooloose/nerdtree')
call dein#add('ctrlpvim/ctrlp.vim')
" Linters, etc.
call dein#add('benekastah/neomake')
" Colors
call dein#add('chriskempson/base16-vim')
call dein#add('endel/vim-github-colorscheme')
" Syntax specific
call dein#add('kchmck/vim-coffee-script', { 'on_ft': 'coffee' })
call dein#add('lukaszkorecki/CoffeeTags', { 'on_ft': 'coffee' })
call dein#add('tpope/vim-markdown', { 'on_ft': 'markdown' })
call dein#add('vim-scripts/vim-emblem')
call dein#add('slim-template/vim-slim')
call dein#add('tpope/vim-rails')
"----------------------------------------
call dein#end()
"----------------------------------------
filetype plugin indent on
"----------------------------------------
if dein#check_install()
  call dein#install()
endif
"----------------------------------------

" 256 color terminal
let &t_Co=256

" Change leader key
let mapleader=" "

" Enable syntax highlight
syntax on

" Enable numbers
set number relativenumber

" Font
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h12
  endif
endif

" Modify tab size
set tabstop=2

" Convert tabs to spaces
set expandtab

" Smart indenting
set autoindent

" Display incomplete command
set showcmd

" Always display the status line
set laststatus=2

" Disable swap file
set noswapfile

" Searching tweaks
set gdefault
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" Auto-trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Access colors present in 256 colorspace
let base16colorspace=256
" Set color scheme
set background=dark
colorscheme base16-default
set cursorline

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Autocomplete
let g:deoplete#enable_at_startup = 1

" switch.vim setup
let g:switch_mapping = 'gs'

" CtrlP setup
let g:ctrlp_map = '<Leader>p'
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.sass-cache/*

" Unite settings
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

" Function - window zoom toggle
function! s:ZoomToggle() abort
  if exists('t:zoomed') && t:zoomed
    execute t:zoom_winrestcmd
    let t:zoomed = 0
  else
    let t:zoom_winrestcmd = winrestcmd()
    resize
    vertical resize
    let t:zoomed = 1
  endif
endfunction
command! ZoomToggle call s:ZoomToggle()

nnoremap ; :
nnoremap ;; q:
nnoremap <Leader>j :bprevious<CR>
nnoremap <Leader>k :bnext<CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>x :b#<bar>bd#<CR>
nnoremap <Leader>q :q<CR>

" Insert mode movement
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Search
nnoremap <silent> <Leader>f :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" Dark/light switch
nnoremap <F12> :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Reload config
nnoremap <Leader>rr :so $MYVIMRC<CR>
nnoremap <Leader>ev :e ~/.config/nvim/init.vim<CR>

" NERDTree
nnoremap <Leader>l :NERDTreeToggle<CR>

" Hide Highlight
nnoremap <Esc><Esc> :noh<CR>

" Git keybinds
nnoremap <Leader>gs :Gstatus<CR>

" Splits/window management
nnoremap <Leader>wj <C-w>S<C-w>j
nnoremap <Leader>wl <C-w>v<C-w>l
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
nnoremap ^[h <C-w>h
nnoremap ^[j <C-w>j
nnoremap ^[k <C-w>k
nnoremap ^[l <C-w>l
nnoremap <Leader>z :ZoomToggle<CR>

" Reindent file
nnoremap == gg=G``

