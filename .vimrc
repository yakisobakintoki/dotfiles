"---- Bandle
"-----------------------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'fuenor/qfixgrep'
"Bundle 'fuenor/im_control'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimfiler'
Bundle 'Shougo/neocomplcache'
Bundle 'astashov/vim-ruby-debugger'


"---- Unite
"-----------------------------------------------------------------------------
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
let g:vimfiler_as_default_explorer = 1

cnoremap <silent> fy :<C-u>Unite history/yank<CR>
cnoremap <silent> fb :<C-u>Unite buffer<CR>
cnoremap <silent> ff :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
cnoremap <silent> fr :<C-u>Unite -buffer-name=register register<CR>
cnoremap <silent> fu :<C-u>Unite file_mru buffer<CR>


"---- font solarized
"-----------------------------------------------------------------------------

syntax enable
if has('gui_running')
 call togglebg#map("<F5>")
 set background=dark
 colorscheme solarized
 set guifont=Ricty\ 14
" set guifontwide=Ricty\ 14
 set ambiwidth=double
else
 set guifont=Ricty\ 14
" set guifontwide=Ricty\ 14
endif

"let g:neocomplcache_enable_at_startup = 0 " 起動時に有効化

"---- 動作設定
"-----------------------------------------------------------------------------
"新しい行のインデントを現在行と同じにする
set autoindent
"バックアップファイルを作るディレクトリ
set backupdir=$HOME/vimbackup
"ファイル保存ダイアログの初期ディレクトリをバッファファイル位置に設定
set browsedir=buffer 
"クリップボードをWindowsと連携
set clipboard=unnamed
"Vi互換をオフ
set nocompatible
"スワップファイル用のディレクトリ
set directory=$HOME/vimbackup
"タブの代わりに空白文字を挿入する
set expandtab
"変更中のファイルでも、保存しないで他のファイルを表示
set hidden
"インクリメンタルサーチを行う
set incsearch
"タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
"set listchars=eol:$,tab:>\ ,extends:<
"行番号を表示する
set number
" ルーラーを表示 (noruler:非表示)
set ruler
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"カーソルを行頭、行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
"set nowrapscan
"au GUIEnter * simalt ~x

" tab
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"シフト移動幅
set shiftwidth=2
"ファイル内の <Tab> が対応する空白の数
set tabstop=2
" 単語単位でラップする。
set linebreak


"---- 視覚化
"-----------------------------------------------------------------------------

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/
set cursorline

" カレントウィンドウにのみ罫線を引く
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorline
autocmd WinEnter,BufRead * set cursorline
augroup END
if has('gui_running')
else
	:hi clear CursorLine
	:hi CursorLine gui=underline
	highlight CursorLine ctermbg=NONE ctermfg=NONE cterm=underline 
endif
" 日本語入力中にカーソルの色を変更する
if has('multi_byte_ime') || has('xim')
            " 日本語入力ON時のカーソルの色を設定
                highlight CursorIM guibg=LightCyan guifg=red
endif
"set laststatus=2
"set statusline=%F%r%h%=
set noexpandtab


"--------- hotkey
"-----------------------------------------------------------------------------
source ~/wk/gen-inputrc/gen.inputrc.vimrc


nnoremap <C-l> :
vnoremap <C-l> <Esc>
inoremap <C-l> <Esc>
cnoremap <C-l> <Esc> 
"nnoremap <C-k> :
"vnoremap <C-k> <Esc> "inoremap <C-k> <Esc>
"cnoremap <C-k> <Esc> 
vnoremap <C-q> <Esc>
inoremap <C-q> <ESC>
cnoremap <C-q> <ESC>

nnoremap <C-j> <Return>
vnoremap <C-j> <S-O><Esc>
inoremap <C-j> <Return>
cnoremap <C-j> <Return> 

nnoremap <C-h>  "zX
"nnoremap <C-l>  "zx
inoremap <C-h>  <BS>
"inoremap <C-l>  <Del>

nnoremap <C-g>a	<HOME>
cnoremap <C-g>a	<END>
nnoremap <C-g>A	<ESC>^
cnoremap <C-g>A	<ESC>^

inoremap <C-y>fda	<C-R>=strftime('%Y/%m/%d (%a)')<CR>
cnoremap <C-y>fda	<C-R>=strftime('%Y/%m/%d (%a)')<CR>
nnoremap <C-y>h1	77i=<ESC><S-O>■
nnoremap <C-y>h2	77i-<ESC><S-O>●
inoremap <C-y>h1	<ESC>77i=<ESC><S-O>■
inoremap <C-y>h2	<ESC>77i-<ESC><S-O>●

"aefb"
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-b> <Left>

nnoremap <Leader>==	77i=<ESC><S-O>■
nnoremap <Leader>=-	77i-<ESC><S-O>●
inoremap <Leader>date <C-R>=strftime('%Y/%m/%d (%a)')<CR>
inoremap <Leader>time <C-R>=strftime(':%H:%M')<CR>
" paste
inoremap <C-S-v> <ESC>pa<ESC>

nmap <Tab> gt
nmap <S-Tab> gT

" gq テキスト整形

" surround shortcut
nmap gw	BysW

" 起動時設定
"-----------------------------------------------------------------------------

if has('gui_running')
    " Show popup menu if right click.
    set mousemodel=popup

    " Don't focus the window when the mouse pointer is moved.
    set nomousefocus
    " Hide mouse pointer on insert mode.
"    set mousehide
endif

" マウスを右クリック許可
if has('gui_running')
    " Show popup menu if right click.
    set mousemodel=popup

    " Don't focus the window when the mouse pointer is moved.
    "set nomousefocus
    " Hide mouse pointer on insert mode.
    "set mousehide
endif

"set t_Co=16




