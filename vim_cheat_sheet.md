
# VIM CHEAT

## 移動系

- カーソル位置の履歴(raw vim)

```vim
<C-o>  元の位置に戻る
<C-i>  次の位置に進む
```

- split 移動

```vim
:sp :vs でスプリット作成
<C-w>j, k, h, l で移動
<C-w>w で一つ隣に移動
```

- コマンドラインモードでLinuxと同じようにカーソルを動かす

```vim
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Delete>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
```

## denite.nvim

```vim
nmap     <Leader>d [denite]
" [l] Buffer で開いたファイルのpwd でのディレクトリのファイル一覧を表示
nnoremap <silent> [denite]l :<C-u>DeniteBufferDir file buffer -split=floating file:new<CR>
" [f] Buffer で開いたファイルのpwd でのディレクトリ配下(/recursive)のファイル一覧を表示
nnoremap <silent> [denite]f :<C-u>DeniteBufferDir file/rec buffer 
  \ -split=floating file:new<CR>
" [b] 現在の buffer 一覧を開く
nnoremap <silent> [denite]b :<C-u>Denite buffer -split=floating file:new<CR>
" [h] 最近利用したファイル一覧(history) buffer を開く
nnoremap <silent> [denite]h :<C-u>Denite file_mru -split=floating file:new<CR>
" [y] yank buffer
nnoremap <silent> [denite]y :<C-u>Denite neoyank -split=floating file:new<CR>
" [c] 変更箇所の一覧(change) buffer を開く
nnoremap <silent> [denite]c :<C-u>Denite -mode=normal change jump 
  \ -split=floating file:new<CR>
" [w] find target under current cursor
nnoremap <silent> [denite]w :<C-u>DeniteCursorWord grep -split=floating file:new<CR>
" [g] Denite grep
" Denite grep するたびに画面が変わってしまうと、前のgrep結果をもう一度見たりする場合に
" 不便なため resume オプションでbuffer-nameを指定
nnoremap <silent> [denite]g :<C-u>Denite grep -buffer-name=search-buffer-denite 
  \ -split=floating file:new<CR>
" resume(履歴） Denite grep
" [r] Denite grep 結果を開き直す
nnoremap <silent> [denite]r :<C-u>Denite -resume -buffer-name=search-buffer-denite<CR>
" [j] Denite grep 結果で一つ上を開く(結果を開き直さなくてもよい）
nnoremap <silent> [denite]j :<C-u>Denite -resume 
  \ -buffer-name=search-buffer-denite -select=+1 -immediately<CR>
" [k] Denite grep 結果で一つ下を開く(結果を開き直さなくても良い）
nnoremap <silent> [denite]k :<C-u>Denite -resume 
  \ -buffer-name=search-buffer-denite -select=-1 -immediately<CR>
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
```

## Coc.nvim(LSP)

.vimrc でインストールされる
node.js(> 8.0), yarn が必要な点のみ注意
チェックする場合、以下のコマンド

```vim
:CheckHealth
```

また、Lint, Completion, ErrorCheck などが入るため、
deoplete.nvim やら tags やら ale やらがいらなくなった
expansions が存在する場合は、CocInstall コマンドでよいが
ない場合は、:CocConfig に記入が必要

今の状態(:CocList)は以下である

```vim
:CocInstall coc-prettier
:CocInstall coc-python
:CocInstall coc-json
:CocInstall coc-yaml
:CocInstall coc-toml
:CocInstall coc-rls (RUST)
:CocInstall coc-git
:CocInstall coc-docker
:CocInstall coc-sh
:CocInstall coc-markdownlint
:CocInstall coc-eslint
:CocInstall coc-tsserver
:CocInstall coc-eslint
:CocInstall coc-angular
:CocInstall coc-docker
```
