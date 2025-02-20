syntax on
filetype plugin indent on

nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k

if &term =~ 'xterm'
let &t_EI = "\e[2 q"

let &t_SI = "\e[5 q"

autocmd VimEnter * silent !echo -ne "\e[2 q"
endif


call plug#begin()
Plug 'tomasiser/vim-code-dark'
call plug#end()

colorscheme codedark
