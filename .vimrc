"Windows Terminal theme inspired by Gruber Darker - tsoding
"https://github.com/drsooch/gruber-darker-vim/blob/master/colors/GruberDarker.vim
colorscheme GruberDarker
"hi clear CursorLine
"augroup CLClear
	"autocmd! GruberDarker * hi clear CursorLine
"augroup END

set cursorline
"set cursorcolumn
set relativenumber
set number
set nocompatible
set showmode
set ruler
set smartindent
set autochdir
set shiftwidth=4

filetype indent on

syntax on

"https://thevaluable.dev/fzf-vim-integration/
" fzf native plugin
"Plug 'junegunn/fzf'
" fzf.vim
"Plug 'junegunn/fzf.vim'

set backspace=2
set belloff=all

"https://vi.stackexchange.com/questions/27599/colorscheme-displayed-wrongly-with-neovim
set termguicolors

let &t_ti.="\e[2 q"
let &t_SI.="\e[1 q"
let &t_EI.="\e[2 q"
let &t_te.="\e[2 q"

"https://til.acm.illinois.edu/vim/default-netrw-to-tree-liststyle/
let g:netrw_liststyle = 1
