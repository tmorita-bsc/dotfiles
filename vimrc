""" vimrc

""" mac-environment
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

""" カーソル位置の履歴(raw vim)
" <C-o>  元の位置に戻る
" <C-i>  次の位置に進む

""" split 移動
" :sp :vs でスプリット作成
" <C-w>j, k, h, l で移動
" <C-w>w で一つ隣に移動

""" default parameter
set history=10000
set number
"" 関数などのフォルダ化をしない
set nofoldenable "disable folding
"" wrap（画面右端での折りたたみをしない)
set nowrap
"" エラーメッセージでビープを鳴らさない
set noerrorbells
"" 検索マッチをハイライト
set showmatch
"" windows でパス区切文字をスラッシュで扱う
set shellslash
"" コマンドラインにて補間が見やすくなる
set wildmenu
"" コマンドを表示する
set showcmd
"" Esc二回で検索ハイライトを消す
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
"" スクロールに対して以下の余白行を保持する
set scrolloff=4
"" 全角文字を打つために必要な設定
set ambiwidth=double
"set t_Co=256 "not need with iTerm2
source $VIMRUNTIME/macros/matchit.vim "can jump opposite {
"" w!! でsudoを忘れても上書き保存
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

""" tab, indent parameter
" 最近の仕様により、pythonやらRUSTやら言語によって
" デフォルト設定が優先されるみたい
" RUST の修正を最下部に実施
set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

""" cursorline
"" 操作中のラインをハイライト
set cursorline

""" encode
set encoding=utf8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp

""" LSP
"" LSPの処理の頻度をあげるため
set updatetime=200
" if hidden is not set, TextEdit might fail.
set hidden
"" いくつかのLSPでバグがあるため
set nobackup
set nowritebackup
"" いつでもエラー表示列を表示
set signcolumn=yes
" Better display for messages
set cmdheight=2
"" don't give |ins-completion-menu| messages.
set shortmess+=c

""" quickfix-window
autocmd QuickFixCmdPost *grep* cwindow

""" keymapping
"" mappingのコマンド説明(再帰的にコマンドを実行しない　真ん中を主に利用）
" :map :noremap :unmap ノーマル、ビジュアル、選択、オペレータ待機
" :nmap :nnoremap :nunmap ノーマル
" :vmap :vnoremap :vunmap ビジュアル、選択
" :smap :snoremap :sunmap 選択
" :xmap :xnoremap :xunmap ビジュアル
" :omap :onoremap :ounmap オペレータ待機
" :map! :noremap! :unmap! 挿入、コマンドライン
" :imap :inoremap :iunmap 挿入
" :lmap :lnoremap :lunmap 挿入、コマンドライン、Lang-Arg
" :cmap :cnoremap :cunmap コマンドライン
"" 特殊キー表記
" <BS>	バックスペース
" <Tab>	タブ
" <Enter>	エンター
" <Plug> コマンド用の実行文字　デフォルトは「:(コロン)」
" <CR>	キャリッジリターン。エンター押下時の改行と同じ
" <Esc>	エスケープ
" <Space>	スペース
" <Bar>	垂直バー（パイプ）
" <Up>	上カーソル
" <Down>	下カーソル
" <Left>	左カーソル
" <Right>	右カーソル
" <S-何か>	Shift押しながら
" <C-何か>	Ctrl押しながら
" <S-C-何か>	ShiftとCtrl押しながら
" <F1> - <F12>	F1〜F12
" <Leader> mapleaderで割り当てたキー : let mapleader = \<Space>" とすると Leader = Space
"" 動作
" <Nop> 何もさせない
" <silent>
" 実行するコマンドがコマンドラインに表示されないようにする
" :map <silent> ,a <C-a><CR>

"" mapleader
let mapleader = "\<Space>"
"" Leaderを使った例
" nmap <Leader>w [window]
" nnoremap [window]h <C-w>h
" nnoremap [window]j <C-w>j
" nnoremap [window]k <C-w>k
" nnoremap [window]l <C-w>l

"" コマンドラインモードでLinuxと同じようにカーソルを動かす
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>

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
nmap     <Leader>d [denite]
" [l] Buffer で開いたファイルのpwd でのディレクトリのファイル一覧を表示
" nnoremap <silent> [denite]l :<C-u>DeniteBufferDir file buffer -split=floating file:new<CR>
nnoremap <silent> [denite]l :<C-u>DeniteBufferDir file buffer<CR>
" [f] Buffer で開いたファイルのpwd でのディレクトリ配下(/recursive)のファイル一覧を表示
" nnoremap <silent> [denite]f :<C-u>DeniteBufferDir file/rec buffer -split=floating file:new<CR>
nnoremap <silent> [denite]f :<C-u>DeniteBufferDir file/rec buffer<CR>
" [b] 現在の buffer 一覧を開く
" nnoremap <silent> [denite]b :<C-u>Denite buffer -split=floating file:new<CR>
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>
" [h] 最近利用したファイル一覧(history) buffer を開く
" nnoremap <silent> [denite]h :<C-u>Denite file_mru -split=floating file:new<CR>
nnoremap <silent> [denite]h :<C-u>Denite file_mru<CR>
" [y] yank buffer
" nnoremap <silent> [denite]y :<C-u>Denite neoyank -split=floating file:new<CR>
nnoremap <silent> [denite]y :<C-u>Denite neoyank<CR>
" [c] 変更箇所の一覧(change) buffer を開く
" nnoremap <silent> [denite]c :<C-u>Denite -mode=normal change jump -split=floating file:new<CR>
nnoremap <silent> [denite]c :<C-u>Denite -mode=normal change jump<CR>
" [w] find target under current cursor
" nnoremap <silent> [denite]w :<C-u>DeniteCursorWord grep -split=floating file:new<CR>
nnoremap <silent> [denite]w :<C-u>DeniteCursorWord grep<CR>
" [g] Denite grep
" Denite grep するたびに画面が変わってしまうと、前のgrep結果をもう一度見たりする場合に
" 不便なため resume オプションでbuffer-nameを指定
" nnoremap <silent> [denite]g :<C-u>Denite grep -buffer-name=search-buffer-denite -split=floating file:new<CR>
nnoremap <silent> [denite]g :<C-u>Denite grep -buffer-name=search-buffer-denite<CR>
" resume(履歴） Denite grep
" [r] Denite grep 結果を開き直す
nnoremap <silent> [denite]r :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
" [j] Denite grep 結果で一つ上を開く(結果を開き直さなくてもよい）
nnoremap <silent> [denite]j :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=+1 -immediately<CR>
" [k] Denite grep 結果で一つ下を開く(結果を開き直さなくても良い）
nnoremap <silent> [denite]k :<C-u>Denite -resume -buffer-name=search-buffer-denite -select=-1 -immediately<CR>
" vim でのコマンド履歴
nnoremap <silent> ;; :<C-u>Denite command command_history<CR>

" buffer での操作
" denite v3 では、grep や file/rec などの検索などの window も buffer 扱い
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  " [Enter/o] 新しいbufferで開き、j-k で移動
  nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
  nnoremap <silent><buffer><expr> o denite#do_map('do_action')
  " [s] ウィンドウを水平分割してファイルを開く
  nnoremap <silent><buffer><expr> s denite#do_map('do_action', 'split')
  " [v] ウィンドウを垂直分割してファイルを開く
  nnoremap <silent><buffer><expr> v denite#do_map('do_action', 'vsplit')
  " [d] buffer 一覧から消す -> これは buffer 一覧表示の時のみだと思われる
  " それ以外だとエラー
  nnoremap <silent><buffer><expr> d denite#do_map('do_action', 'delete')
  " [p] preview windowとして開く
  nnoremap <silent><buffer><expr> p denite#do_map('do_action', 'preview')
  " [q] buffer を消し、元の操作に戻る
  nnoremap <silent><buffer><expr> q denite#do_map('quit')
  " [i] buffer の検索欄を開き insertモードへ移行　検索はスペース区切りなどまでいける
  nnoremap <silent><buffer><expr> i denite#do_map('open_filter_buffer')
  " [Space+j] 複数行を選択
  nnoremap <silent><buffer><expr> <Space> denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  " Denite grep などで フィルタ検索で insert 中に normal モードに戻る
  imap <silent><buffer> <ESC> <Plug>(denite_filter_quit)
  " buffer を消し、元の操作に戻る
  nnoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
  inoremap <silent><buffer><expr> <C-c> denite#do_map('quit')
endfunction

"" nerdtree 
nmap     <Leader>n [nerdtree]
nnoremap <silent> [nerdtree]n :NERDTreeToggle<CR>
nnoremap <silent> [nerdtree]f :NERDTreeFind<CR>

"" git-fugitive
nmap     <Leader>g [fugitive]
nnoremap <silent> [fugitive]t :te tig<CR>
nnoremap <silent> [fugitive]a :Gwrite<CR>
nnoremap <silent> [fugitive]r :Gread<CR>
nnoremap <silent> [fugitive]s :Gstatus<CR>
nnoremap <silent> [fugitive]c :Gcommit-v<CR>
nnoremap <silent> [fugitive]d :Gdiff<CR>
nnoremap <silent> [fugitive]b :Gblame<CR>
nnoremap <silent> [fugitive]m :Gmerge<CR>

"" git-gutter
" hunk移動(hunk：変更点の塊）
nnoremap [n <Plug>GitGutterNextHunk
nnoremap [N <Plug>GitGutterPrevHunk

"" previm
augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
"nnoremap [previm] <Nop>
"nmap     <Leader>pv [previm]
"nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
"nnoremap <silent> [previm]r :call previm#refresh()<CR>

""" dein env parameters(dont edit)
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

  " LSP
  call dein#add('neoclide/coc.nvim', { 'merged': 0 })

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
autocmd FileType rust setlocal sw=2 sts=0 ts=2 et

""" nvim color scheme
"colorscheme molokai
colorscheme atom-dark-256

