"" vimrc

" default
set number
set nowrap
set showmatch
set shellslash
set wildmenu
"set t_Co=256 "not need with iTerm2
source $VIMRUNTIME/macros/matchit.vim "can jump opposite {

" tab, indent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent

" cursor
set cursorline

" encode
set encoding=utf8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp

" quickfix-window
autocmd QuickFixCmdPost *grep* cwindow

" keymapping
"" unmap
nnoremap <Space> <Nop>

"" denite.nvim
nnoremap [denite] <Nop>
nmap     <Space>d [denite]
nnoremap <silent> [denite]h :<C-u>Denite file_mru<CR>
nnoremap <silent> [denite]g :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
nnoremap <silent> [denite]r :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>

"" nerdtree 
nnoremap [nerdtree] <Nop>
nmap     <Space>n [nerdtree]
nnoremap <silent> [nerdtree]n :NERDTreeToggle<CR>
nnoremap <silent> [nerdtree]f :NERDTreeFind<CR>

"" gtags
map <C-j> :GtagsCursor<CR><CR>
nnoremap <C-h> :Gtags -f %<CR><CR>
nnoremap <C-n> :cn<CR>
nnoremap <C-p> :cp<CR>
nnoremap <C-g> :Gtags
nnoremap <C-k> :Gtags -r <C-r><C-w><CR><CR>

"" git-fugitive
nnoremap :ga :Gwrite
nnoremap :gr :Gread
nnoremap :gs :Gstatus
nnoremap :gl :Glog
nnoremap :gb :Gblame
nnoremap :gd :Gdiff

"" git-gutter
let g:gitgutter_max_signs=500 "default value

"" previm
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

let g:previm_open_cmd = ''
let g:previm_disable_default_css = 1
let g:previm_custom_css_path = '~/dotfiles/previm/markdown.css'
nnoremap [previm] <Nop>
nmap     <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>

" env parameters
"let g:python_host_prog = expand('$PYENV_ROOT/shims/python')
let g:python3_host_prog = expand('$PYENV_ROOT/shims/python3')
let s:dein_path = expand('~/.vim/dein')

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  " dein.vim
  call dein#add('Shougo/dein.vim')

  " color
  call dein#add('tomasr/molokai')
  call dein#add('gosukiwi/vim-atom-dark')
  
  " UI
  "call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/denite.nvim')
  call dein#add('scrooloose/nerdtree')

  " Completion
  "call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')

  " Shaping
  call dein#add('vim-syntastic/syntastic')
  call dein#add('nathanaelkane/vim-indent-guides')
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  " Git
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('thinca/vim-quickrun')

  " Gtags
  call dein#add('lighttiger2505/gtags.vim')

  " Previm
  call dein#add('tyru/open-browser.vim')
  call dein#add('kannokanno/previm')

  " custom command for denite.nvim

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" end of dein script

" required
filetype plugin indent on
syntax enable

" color
"colorscheme molokai
colorscheme atom-dark-256
