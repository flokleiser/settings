syntax on
set re=0
filetype plugin indent on

"let mapleader = ','

set t_u7=
set t_RF=
set t_RB=
set t_RV=
set mouse=a
set number
set clipboard=unnamed
set ignorecase
set smartcase

nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k

vnoremap <C-c> "+y
map <C-v> "+p

" nmap gh :call CocActionAsync('doHover')<CR>
" nmap gd <Plug>(coc-definition)

if &term =~ 'xterm'
let &t_EI = "\e[2 q"

let &t_SI = "\e[5 q"

autocmd VimEnter * silent !echo -ne "\e[2 q"
endif

call plug#begin()
Plug 'tomasiser/vim-code-dark'
Plug 'tpope/vim-commentary'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" nnoremap \ :echo 'test'

let g:tpipeline_autoembed = 1

colorscheme codedark
