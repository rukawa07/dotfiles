" init autocmd
autocmd!
" set script encoding
scriptencoding utf-8
" stop loading config if it's on tiny or small
if !1 | finish | endif

"Vi互換にしないようにする？
set nocompatible
"行数の表示
set number
"色をつける
syntax enable
"ファイル書き込み時の文字コード
set fileencodings=utf-8,sjis,euc-jp,latin
"Vim内の文字コード
set encoding=utf-8
"編集するファイル名を表示
set title
"Vimに背景色がどのようなものかを伝える
set background=dark
"バックアップファイルを作成しない
set nobackup
"検索後をハイライト
set hlsearch
"インクリメンタルサーチ
set incsearch
"入力中のコマンドを表示
set showcmd
"グローバル コマンドラインに使われる画面上の行数
set cmdheight=1
"ステータスラインを常に表示
set laststatus=2
"カーソルの周囲に確保する行数
set scrolloff=10
"タブをスペース*n個に
set expandtab
"let loaded_matchparen = 1
"shで実行するシェル
set shell=fish
"書き込むファイル名がこの中にあればバックアップファイルを作成しない
set backupskip=/tmp/*,/private/tmp/*


" incremental substitution (neovim)
if has('nvim')
  "文字列置換をインタラクティブに表示
  set inccommand=split
endif

" Suppress appending <PasteStart> and <PasteEnd> when pasting
" set t_BE=

"ステータスメッセージをオフ(これにより高速化できる)
set nosc noru nosm
" Don't redraw while executing macros (good performance config)
set lazyredraw
"set showmatch
" How many tenths of a second to blink when matching brackets
"set mat=2
" Ignore case when searching
"検索パターンにおいて大文字小文字を区別しない
set ignorecase
"大文字で検索するときはignorecaseを無視
set smartcase
" Be smart when using tabs ;)
set smarttab
" indents
filetype plugin indent on
set shiftwidth=2
set tabstop=2
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set backspace=start,eol,indent
" Finding files - Search down into subfolders
set path+=**
set wildignore+=*/node_modules/*

" Turn off paste mode when leaving insert
autocmd InsertLeave * set nopaste

" クリップボード連携
set clipboard^=unnamed,unnamedplus


" Add asterisks in block comments
set formatoptions+=r

"}}}

" Set locale
let $LANG = 'en_US.UTF-8'

" Highlights "{{{
" ---------------------------------------------------------------------
set cursorline
"set cursorcolumn

" Set cursor line color on visual mode
highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40

highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

"}}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

"}}}

" Imports "{{{
" ---------------------------------------------------------------------
runtime ./plug.vim
if has("unix")
  let s:uname = system("uname -s")
  " Do Mac stuff
  if s:uname == "Darwin\n"
    runtime ./macos.vim
  endif
endif

runtime ./maps.vim
"}}}

" Syntax theme "{{{
" ---------------------------------------------------------------------
"
"
if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " for transparent colorscheme
  " autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  " autocmd ColorScheme * highlight CursorLine ctermbg=NONE guibg=NONE
  " autocmd ColorScheme * highlight EndOfBuffer ctermbg=NONE guibg=NONE

  " autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
  " autocmd ColorScheme * highlight LineNr ctermbg=NONE guibg=NONE
  " autocmd ColorScheme * highlight CursorLineNr ctermbg=NONE guibg=NONE
  " autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
  colorscheme iceberg
endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
"
"
set exrc

"}}}


lua << EOF
-- Load custom treesitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- Treesitter configuration
require('nvim-treesitter.configs').setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop,
  -- highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    -- Required for spellcheck, some LaTex highlights and
    -- code block highlights that do not have ts grammar
    additional_vim_regex_highlighting = {'org'},
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/MyDrive/org/*'},
  org_default_notes_file = '~/MyDrive/org/main.org',
  org_todo_keywords = { 'TASK(t)', 'WAIT(w)', '|', 'DONE(d)', 'ABORT(a)', 'SOMEDAY(s)' },
  org_tag_alist = { 'PROJECT:p', 'MEMO:m', 'PETIT:t' },
  org_capture_templates = {
    { key = 't', description = 'Task', template = '* TASK %?  CREATED: %U' },
    { key = 'i', description = 'Idea', template = '* %?  CREATED: %U' },
  },
  org_refile_targets = { '~/MyDrive/org/' },
  org_log_done = 'time',
  org_clock_clocked_in_display = 'frame-title',
})

-- require('org-agenda').setup {
--   org_agenda_span = 1,
--   org_agenda_time_grid = {
--     { 'daily', 'today', 'require-timed' },
--     { '0900', '1200', '1300', '1800', '......', '----------------' },
--   },
--   org_columns_default_format = '%68ITEM(Task) %6Effort(Effort){:} %6CLOCKSUM(Clock){:}',
-- }

EOF

" vim: set foldmethod=marker foldlevel=0:
