"" vimrc

" mac
if has('mac')
  let g:vimproc_dll_path = $VIMRUNTIME . '/autoload/vimproc_mac.so'
  "" below command ( espacialy <C-h> cant work in windows)
  "" cuz ^H = <C-h> mapping backspace
  "" move with insert mode
  imap     <C-h> <Left>
  imap     <C-j> <Down>
  imap     <C-k> <Up>
  imap     <C-l> <Right>
endif

" default
set number
set nowrap
set nofoldenable "disable folding
set showmatch
set shellslash
set wildmenu
set ambiwidth=double
"set t_Co=256 "not need with iTerm2
source $VIMRUNTIME/macros/matchit.vim "can jump opposite {

" tab, indent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent

" inccommand
" set inccommand=split

" cursor
"set cursorline

" encode
set encoding=utf8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp

" quickfix-window
autocmd QuickFixCmdPost *grep* cwindow

" keymapping
"" unmap
nnoremap <Space> <Nop>

""" change directory in current buffer
"command! -nargs=? -complete=dir -bang CD call s:ChangeCurrentDir('<args>', '<bang>')
"function! s:ChangeCurrentDir(directory, bang)
"  if a:directory == ''
"    lcd %:p:h
"  else
"    execute 'lcd' . a:directory
"  endif
"
"  if a:bang == ''
"    pwd
"  endif
"endfunction
"nnoremap <silent> <Space>cd :<C-u>CD<CR>

"" neosnippet
"imap     <C-m> <Plug>(neosnippet_expand_or_jump)
"smap     <C-m> <Plug>(neosnippet_expand_or_jump)
"xmap     <C-m> <Plug>(neosnippet_expand_target)
"imap     <C-m> <Plug>(neosnippet_expand_or_jump)
""imap <expr><TAB>
"" \ pumvisible() ? '\<C-n>' :
"" \ neosnippet#expandable_or_jumpable() ?
"" \    '\<Plug>(neosnippet_expand_or_jump)' : '\<TAB>'
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ '\<Plug>(neosnippet_expand_or_jump)' : '\<TAB>'
"
"" For conceal markers.
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif

"" denite.nvim
"nnoremap [denite] <Nop>
"nmap     <Space>d [denite]
"" open file under buffer dir
"nnoremap <silent> [denite]o :<C-u>DeniteBufferDir file_rec<CR>
"" open file under open dir
"nnoremap <silent> [denite]c :<C-u>Denite file_rec -highlight-mode-insert=Search<CR>
"" open recent use file buffer
"nnoremap <silent> [denite]h :<C-u>Denite file_mru<CR>
"" yank buffer
"nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>
"" open window  jump changed line
"nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>
"" find target under current cursor
"nnoremap <silent> [denite]* :<C-u>DeniteCursorWord grep<CR>
"" Denite grep
"nnoremap <silent> [denite]g :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
"" resume Denite grep
"nnoremap <silent> [denite]r :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
"nnoremap <silent> [denite]n :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=+1 -immediately<CR>
"nnoremap <silent> [denite]p :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=-1 -immediately<CR>
"
" open file under buffer dir
nnoremap <silent> ;o :<C-u>DeniteBufferDir file_rec<CR>
" open file under open dir
nnoremap <silent> ;c :<C-u>Denite file_rec -highlight-mode-insert=Search<CR>
" open buffer
nnoremap <silent> ;b :<C-u>Denite buffer<CR>
" open recent use file buffer
nnoremap <silent> ;h :<C-u>Denite file_mru<CR>
" yank buffer
nnoremap <silent> ;y :<C-u>Denite neoyank<CR>
"" open window  jump changed line
nnoremap <silent> ;y :<C-u>Denite -mode=normal change jump<CR>
" find target under current cursor
nnoremap <silent> ;w :<C-u>DeniteCursorWord grep<CR>
" Denite grep
nnoremap <silent> ;g :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
" resume Denite grep
nnoremap <silent> ;r :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
nnoremap <silent> ;n :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=+1 -immediately<CR>
nnoremap <silent> ;p :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=-1 -immediately<CR>
" Denite command history
nnoremap <silent> ;; :<C-u>Denite command command_history<CR>

"" denite-gtags
nnoremap  <C-a> :DeniteCursorWord -buffer-name=gtags_context gtags_context<CR>
nnoremap  <C-j> :DeniteCursorWord -buffer-name=gtags_def -mode=normal<CR>
nnoremap  <C-c> :DeniteCursorWord -buffer-name=gtags_ref -mode=normal<CR>
nnoremap  <C-g> :DeniteCursorWord -buffer-name=gtags_grep gtags_grep<CR>
nnoremap  <C-t> :Denite -buffer-name=gtags_completion gtags_completion<CR>
nnoremap  <C-f> :Denite -buffer-name=gtags_file gtags_file<CR>
nnoremap  <C-p> :Denite -buffer-name=gtags_path gtags_path<CR>


" vaffle
nnoremap [Vaffle] <Nop>
nmap     <Space>o [Vaffle]
nnoremap [Vaffle]n :Vaffle ./<CR> 
nnoremap [Vaffle]h :Vaffle ~/<CR>
let g:vaffle_auto_cd = 1

"" nerdtree 
"nnoremap [nerdtree] <Nop>
"nmap     <Space>n [nerdtree]
"nnoremap <silent> [nerdtree]n :NERDTreeToggle<CR>
"nnoremap <silent> [nerdtree]f :NERDTreeFind<CR>
"let g:NERDTreeShowHidden = 1

"" gtags
let g:Gtags_Auto_Map = 0
let g:Gtags_OpenQuickfixWindow = 1
""" go Definition
"map <C-j> :GtagsCursor<CR>
"""" list of function
"nnoremap <C-h> :Gtags -f %<CR><CR>
"""" move Up/Down in QuickFixWindow
"nnoremap <C-n> :cn<CR>
"nnoremap <C-p> :cp<CR>
"""" <C-g> func_name => function jump
"""" <C-g> grep xxx ~> grep xxx in TAG
"nnoremap <C-g> :Gtags <C-r><C-w><CR>
"""" <C-k> move caller function
"nnoremap <C-k> :Gtags -r <C-r><C-w><CR><CR>

"" git-fugitive
nnoremap [fugitive] <Nop>
nmap     <Space>g [fugitive]
nnoremap <silent> [fugitive]t :te tig<CR>
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]r :Gread<CR>
nnoremap <silent> [fugitive]s :Gstatus<CR>
nnoremap <silent> [fugitive]c :Gcommit-v<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>
nnoremap <silent> [fugitive]b :Gblame<CR>
nnoremap <silent> [fugitive]m :Gmerge<CR>


"" git-gutter
let g:gitgutter_max_signs=500 "default value

" previm
"augroup PrevimSettings
"  autocmd!
"  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"augroup END

"let g:previm_open_cmd = ''
"let g:previm_disable_default_css = 1
"let g:previm_custom_css_path = '~/dotfiles/previm/markdown.css'
"nnoremap [previm] <Nop>
"nmap     <Space>p [previm]
"nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
"nnoremap <silent> [previm]r :call previm#refresh()<CR>

"" ALE
" keymapping
"nnoremap [ale] <Nop>
"nmap     <Space>a [ale]
"nnoremap <silent> [ale]<C-p> <Plug>{ale_previous}
"nnoremap <silent> [ale]<C-n> <Plug>{ale_next}
""" message_format
"let g:airline#extensions#ale#enabled = 0
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%] '
""" display error/warning sign always
"let g:ale_sign_column_always = 0
""" execute lint with open file
"let g:ale_lint_on_enter = 0
""" execute lint with save file
"let g:ale_lint_on_save = 0
""" execute lint on editing file
"let g:ale_lint_on_text_changed = 0
""" locationlist
"let g:ale_set_loclist   = 0
""" quickfix
"let g:ale_set_quickfix  = 0
"let g:ale_open_list     = 0
""" open if no error/warning
"let g:ale_keep_list_window_open = 0

" env parameters
"let g:python_host_prog = expand('python')
let g:python3_host_prog = expand('/usr/local/bin/python3')
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
"syntax enable

" color
"colorscheme molokai
colorscheme atom-dark-256

