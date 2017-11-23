"" vimrc

" mac
if has('mac')
  let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
endif

" default
set number
set wrap
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

"" move with insert mode
imap     <C-h> <Left>
imap     <C-j> <Down>
imap     <C-k> <Up>
imap     <C-l> <Right>

"" neosnippet
"imap     <C-m> <Plug>(neosnippet_expand_or_jump)
"smap     <C-m> <Plug>(neosnippet_expand_or_jump)
"xmap     <C-m> <Plug>(neosnippet_expand_target)

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
let g:Gtags_Auto_Map = 0
let g:Gtags_OpenQuickfixWindow = 1
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

" ALE
"" keymapping
nnoremap [ale] <Nop>
nmap     <Space>a [ale]
nnoremap <silent> [ale]<C-p> <Plug>{ale_previous}
nnoremap <silent> [ale]<C-n> <Plug>{ale_next}
"" message_format
"let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '[%linter%] %s [%serverity%]'
"" display error/warning sign always
let g:ale_sign_column_always = 1
"" execute lint with open file
let g:ale_lint_on_enter = 1
"" execute lint with save file
let g:ale_lint_on_save = 1
"" execute lint on editing file
"let g:ale_lint_on_text_changed = 'never'
"" quickfix
let g:ale_set_loclist   = 0
let g:ale_set_quickfix  = 1
let g:ale_open_list     = 1
let g:ale_keep_list_window_open = 1

" env parameters
let g:python_host_prog = expand('python')
" let g:python3_host_prog = expand('$PYENV_ROOT/shims/python3')
let s:dein_path = expand('~/.cache/dein')

if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  " vimshell
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })
  
  " colorscheme
  call dein#add('gosukiwi/vim-atom-dark')

  " toml-env setting
  let g:toml_dir  = expand('~/.cache/dein/toml_dir')
  let s:toml      = g:toml_dir . '/plugins.toml'
  let s:lazy_toml = g:toml_dir . '/plugins_lazy.toml'

  " read toml
  call dein#load_toml(s:toml,      {'lazy':0})
  call dein#load_toml(s:lazy_toml, {'lazy':1})

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

