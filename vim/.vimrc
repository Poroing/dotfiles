set nocompatible              " be iMproved, required

"=============================
" Vundle
"=============================
filetype off                  " Needed for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'hsanson/vim-android'
Plugin 'rhysd/vim-grammarous'
Plugin 'the-lambda-church/coquille'
Plugin 'let-def/vimbufsync'
Plugin 'jceb/vim-orgmode'
Plugin 'tpope/vim-speeddating'

call vundle#end()
filetype plugin on

"=========================
" YouCompleteMe
"========================

let g:ycm_confirm_extra_conf = 0
let g:ycm_python_binary_path = '/usr/bin/python2'
let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:EclimCompletionMethod = 'omnifunc'

"===========================
" UltiSnips (Not installed)
"===========================

"let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsListSnippets = '<C-l>'
"let g:UltiSnipsExpandTrigger = '<C-l>'
"let g:UltiSnipsJumpForwardTrigger = '<C-j>'
"let g:UltiSnipsJumpBackwardTrigger = '<C-k>'

"=============================
" Eclim
"============================

let g:EclimProjectRefreshFiles = 0

"============================
" Rainbow (Not installed)
"===========================

" let g:rainbow_active = 1
" let g:rainbow_ctermfgs = ['blue', 'red', 'green', 'yellow']

"============================
"Functions
"============================

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"============================
"Mapping
"============================

let mapleader = ','
let maplocalleader = ','

"Remove trailing white space
map <Leader>rs mr:%s/\s\+$//g<CR>'r
map <Leader>t :TagbarToggle<CR>

"Copy selected in clipboard
vmap <Leader>c <Esc>`>a<CR><Esc>`<i<CR><Esc>V!xsel -b<CR>kJJ

nmap <Leader>gd :YcmCompleter GoTo<CR>
nmap <Leader>gr :YcmCompleter GoToReferences<CR>
nmap <Leader>d :YcmCompleter GetDoc<CR>

nmap <Leader>cn :cn<CR>
nmap <Leader>cp :cp<CR>
nmap <Leader>cr :cdo normal .<CR>

nmap <Leader>f :ClangFormat<CR>

"=============================
"Vim-airline configuration
"=============================

set laststatus=2

let g:airline_left_sep='▓▒░'
let g:airline_right_sep='░▒▓'

let g:airline_theme='road'

let g:airline_section_c='%t'
let g:airline_section_y=''
let g:airline_section_z='%p%% %l/%L : %c'

au FileType tex let g:airline_section_z='%{wordcount()["words"]} words %p%% %l/%L : %c'

"===============
" Coquille
"===============

hi CheckedByCoq ctermbg=7
hi SendToCoq ctermbg=12
let g:coquille_auto_move = 'true'

"=========================
"Syntastic confiuration (Not installed)
"========================

"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_checkers = [ 'gcc' ]


"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

"let g:syntastic_tex_checkers = []

"=============================
"Personal configuration
"=============================

syntax enable
syntax on
set background=light
set t_co=256
set encoding=utf-8
let &colorcolumn="80"

set ttimeoutlen=50
set nowrap
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab
filetype indent on

"Ocaml
au FileType ocaml setlocal tabstop=2
au FileType ocaml setlocal shiftwidth=2

"XML
au FileType xml setlocal tabstop=2
au FileType xml setlocal shiftwidth=2

"HTML
au FileType html setlocal tabstop=2
au FileType html setlocal shiftwidth=2

au FileType php setlocal tabstop=2
au FileType php setlocal shiftwidth=2

"Makefiles
au FileType make setlocal noexpandtab

"Markdown
au FileType markdown setlocal noexpandtab

"Latex
au BufNewFile,BufRead *.tex setlocal filetype=tex
au FileType tex setlocal tabstop=2 shiftwidth=2 spell spelllang=fr
au FileType tex nmap <Leader>m :w<CR> :!latexmk -pdf %<CR>

"Coq
au FileType coq nmap <C-j> :CoqNext<CR>
au FileType coq nmap <C-k> :CoqUndo<CR>
au FileType coq nmap <C-L> :CoqToCursor<CR>


"See the difference between saved file and buffer
"command DiffOrig vert new | set bt=nofile | r ++edit # |0d_ | diffthis | wincmd p | diffthis
