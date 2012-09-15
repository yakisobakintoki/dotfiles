"---- Bandle 
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'altercation/vim-colors-solarized'
Bundle 'fuenor/qfixgrep'
Bundle 'Shougo/neocomplcache'
"---- font solarized

if has('gui_running')
 syntax enable
 call togglebg#map("<F5>")
 set background=dark
 colorscheme solarized
 set guifont=Ricty\ 14
" set guifontwide=Ricty\ 14
 set ambiwidth=double
else
 syntax enable
endif

let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化

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
"シフト移動幅
set shiftwidth=4
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch
"検索時に大文字を含んでいたら大/小を区別
set smartcase
"新しい行を作ったときに高度な自動インデントを行う
set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
"カーソルを行頭、行末で止まらないようにする
"set whichwrap=b,s,h,l,<,>,[,]
"検索をファイルの先頭へループしない
"set nowrapscan
"au GUIEnter * simalt ~x




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
:hi clear CursorLine
:hi CursorLine gui=underline
if has('gui_running')
else
	highlight CursorLine ctermbg=NONE ctermfg=NONE cterm=underline 
endif
" 日本語入力中にカーソルの色を変更する
if has('multi_byte_ime') || has('xim')
            " 日本語入力ON時のカーソルの色を設定
                highlight CursorIM guibg=LightCyan guifg=NONE
endif

"set laststatus=2
"set statusline=%F%r%h%=

set noexpandtab
"---------
nnoremap <C-j> <PageDown>
nnoremap <C-k> <PageUp>

nnoremap <C-h>  X
nnoremap <C-l>  x
inoremap <C-h>  <BS>
inoremap <C-l>  <Del>

inoremap <Leader>date <C-R>=strftime('%Y/%m/%d (%a)')<CR>
inoremap <Leader>time <C-R>=strftime(':%H:%M')<CR>

