" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Turn syntax highlighting on.
syntax on

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set visualbell
set t_vb=
set belloff=all

set timeoutlen=500
set undofile
set undodir=~/.vim/vim
if has('nvim')
set undodir=~/.vim/nvim
endif
set clipboard=unnamed
set backspace=indent,eol,start
set termguicolors
set t_Co=256
set nobackup
set nowb
set noswapfile
set number
set relativenumber

let mapleader = " "


" PLUGINS -----------------------------------------

call plug#begin('~/.vim/plugged')

	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'jremmen/vim-ripgrep'

	Plug 'vim-airline/vim-airline'

	Plug 'tpope/vim-fugitive'

	" lsp setup from https://blog.sidebits.tech/vim-straightforward-lsp-setup-with-autocompletion/
	Plug 'prabirshrestha/vim-lsp'
	Plug 'mattn/vim-lsp-settings'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'prabirshrestha/asyncomplete-lsp.vim'
	Plug 'rhysd/vim-clang-format'

	Plug 'liuchengxu/vim-which-key'
	
	Plug 'github/copilot.vim'

	Plug 'rose-pine/vim'

call plug#end()

" END PLUGINS -------------------------------------

" MAPPINGS ----------------------------------------
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

call which_key#register('<Space>', "g:which_key_map")

let g:which_key_map =  {}
let g:which_key_map['t'] = { 'name' : '+Toggle' }
let g:which_key_map['c'] = { 'name' : '+Clear' }
let g:which_key_map['g'] = { 'name' : '+Git' }
let g:which_key_map['d'] = { 'name' : '+Lsp' }
let g:which_key_map['s'] = { 'name' : '+Explore' }

nmap <leader>w :w<cr>
let g:which_key_map['w'] = 'Write file'

nmap <leader>tw :set wrap!<cr>
nmap <leader>ch :noh<cr>
let g:which_key_map['c']['h'] = 'Clear Highlight'

nmap <leader>gs :Git<cr>
let g:which_key_map['g']['s'] = 'Stage'

" move screen to focus center on up down and next previous
nmap <C-d> <C-d>zz
nmap <C-u> <C-u>zz
nmap n nzzzv
nmap N Nzzzv
nmap n nzzzv
nmap N Nzzzv

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" yy to exit insertmode
imap yy <esc>

" open netrw in current file folder
nmap <leader>sc :Ex %:p:h<cr>
let g:which_key_map['s']['c'] = 'Current folder'
nmap <leader>sw :Ex .<cr>
let g:which_key_map['s']['w'] = 'Root folder'

nmap <leader>dd :LspDefinition<cr>
nmap <leader>dn :LspNextDiagnostic<cr>
nmap <leader>dp :LspPreviousDiagnostic<cr>
nmap <leader>dr :LspRename<cr>
nmap <leader>ds :LspStopServer<cr>
nmap <leader>da :LspCodeAction<cr>
nmap <leader>dh :LspHover<cr>
nmap <leader>df :LspDocumentFormat<cr>

" END MAPPINGS -------------------------------------


" VIMSCRIPT ----------------------------------------
" More Vimscripts code goes here.

" open in same buffer
let g:netrw_chgwin = -1

set background=dark
colorscheme rosepine

" ctrlP ignore some folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|\.git\|obj\|bin'

" basic airline config
let g:airline_symbols = get(g:, 'airline_symbols', {})
let g:airline_symbols.colnr = ' '

let g:airline#extensions#whitespace#enabled = 0

" riggrep binary
" let g:rg_binary = 'c:/rc/Tools/ripgrep/rg.exe'

" If GUI version of Vim is running set these options.
if has('gui_running')

	" Set the background tone.
	set background=dark

	" Display more of the file by default.
	" Hide the toolbar.
	set guioptions-=T

	" Hide the the left-side scroll bar.
	set guioptions-=L

	" Hide the the left-side scroll bar.
	set guioptions-=r

	" Hide the the menu bar.
	set guioptions-=m

	" Hide the the bottom scroll bar.
	set guioptions-=b

	" Map the F4 key to toggle the menu, toolbar, and scroll bar.
	" <Bar> is the pipe character.
	" <CR> is the enter key.
	nmap <F4> :if &guioptions=~#'mTr'<Bar>
		\set guioptions-=mTr<Bar>
		\else<Bar>
		\set guioptions+=mTr<Bar>
		\endif<CR>

endif

" END VIMSCRIPT ------------------------------------



" STATUS LINE --------------------------------------

" Status bar code goes here.
" Clear status line when vimrc is reloaded.
"set statusline=

" Status line left side.
"set statusline+=\ %F%{&modified?'[+]':''}\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
"set statusline+=%=

" Status line right side.
"set statusline+=\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

