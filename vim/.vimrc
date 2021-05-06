set nocompatible              " be iMproved, required

"=============================
" Vundle
"=============================
filetype off                  " Needed for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'rhysd/vim-grammarous'
Plugin 'tpope/vim-speeddating'
Plugin 'lervag/vimtex'
Plugin 'ron89/thesaurus_query.vim'
Plugin 'dylanaraps/wal.vim'
call vundle#end()

filetype plugin on

"=========================
" thesaurus_query.vim
"=========================

let g:tq_enabled_backends = [ 'openoffice_en', 'datamuse_com' ]

"=========================
" YouCompleteMe
"========================

let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_use_clang = 1
let g:ycm_clangd_binary_path = '/usr/bin/clangd'
let g:ycm_filetype_blacklist = {}

let mapleader = ','
let maplocalleader = ','

nmap <Leader>gg :YcmCompleter GoTo<CR>
nmap <Leader>gd :YcmCompleter GoToDeclaration<CR>
nmap <Leader>gr :YcmCompleter GoToReferences<CR>
nmap <Leader>d :YcmCompleter GetDoc<CR>
nmap <Leader>gt :tab split<CR> :YcmCompleter GoTo<CR>

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

"=============================
" Clang Format
"=============================

 let g:clang_format#code_style = 'mozilla'
 let g:clang_format#detect_style_file = 1
 let g:clang_format#auto_format_on_insert_leave = 1
 let g:clang_format#style_options = {
             \ 'BreakConstructorInitializers' : 'BeforeColon',
             \ 'BreakBeforeBraces' : 'Allman',
             \ 'ColumnLimit': 80,
             \ 'AccessModifierOffset': -2,
             \ 'BreakBeforeBinaryOperators' : 'NonAssignment'
             \ }

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

nmap <Leader>cn :cn<CR>
nmap <Leader>cp :cp<CR>
nmap <Leader>cr :cdo normal .<CR>

nmap <Leader>f :ClangFormat<CR>

"=============================
"Vim-airline configuration
"=============================

set laststatus=2

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline_section_c='%t'
let g:airline_section_y=''
let g:airline_section_z='%p%% %l/%L : %c'

au FileType tex let g:airline_section_z='%{wordcount()["words"]} words %p%% %l/%L : %c'

"==============
" Pandoc
"==============

let g:pandoc#modules#disabled = [ 'folding' ]

"===============
" Jupytext
"===============

let g:jupytext_fmt = 'py:percent'

"===============
" Coquille
"===============

" hi CheckedByCoq ctermbg=7
" hi SendToCoq ctermbg=12
" let g:coquille_auto_move = 'true'

"=============================
"Personal configuration
"=============================

syntax enable
syntax on
set background=light
set t_co=256
set encoding=utf-8
let &colorcolumn="80"
set tw=80
colorscheme wal

set ttimeoutlen=50
set nowrap
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab
filetype indent on
" Show tabulations
set list
set listchars=tab:>-

" Unicode characters
inoremap ,< «
inoremap ,> »

" Keyboard witout < and > for the french layout
noremap ² <
inoremap ² <
inoremap ¬ >
noremap ¬ >

"Prolog
au FileType prolog setlocal tabstop=2
au FileType prolog setlocal shiftwidth=2

"Ocaml
au FileType ocaml setlocal tabstop=2
au FileType ocaml setlocal shiftwidth=2

"XML
au FileType xml setlocal tabstop=2
au FileType xml setlocal shiftwidth=2
"
"XML
au FileType c,cpp setlocal tabstop=2
au FileType c,cpp setlocal shiftwidth=2

"HTML
au FileType html setlocal tabstop=2
au FileType html setlocal shiftwidth=2
au FileType html nmap <Leader>ws :BlogSave<CR>

au FileType php setlocal tabstop=2
au FileType php setlocal shiftwidth=2

"Makefiles
au FileType make setlocal noexpandtab

"Markdown
au FileType markdown setlocal noexpandtab

"Latex
au FileType tex setlocal tabstop=2 shiftwidth=2 spell spelllang=fr
let g:tex_comment_nospell = 1
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'process',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape',
    \ ],
    \}

"Coq
au FileType coq nmap <C-j> :CoqNext<CR>
au FileType coq nmap <C-k> :CoqUndo<CR>
au FileType coq nmap <C-L> :CoqToCursor<CR>

" Prelab
au FileType cmake setlocal tabstop=2
au FileType cmake setlocal shiftwidth=2

" Python
" autoread for better interaction with jupytext
au FileType python setlocal autoread 

"See the difference between saved file and buffer
"command DiffOrig vert new | set bt=nofile | r ++edit # |0d_ | diffthis | wincmd p | diffthis
