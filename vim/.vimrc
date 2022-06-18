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
Plugin 'ycm-core/YouCompleteMe'
Plugin 'rhysd/vim-clang-format'
Plugin 'tpope/vim-surround'
Plugin 'preservim/tagbar'
Plugin 'dpelle/vim-Grammalecte'
Plugin 'plasticboy/vim-markdown'
Plugin 'godlygeek/tabular'
Plugin 'fladson/vim-kitty'
Plugin 'sainnhe/gruvbox-material'
call vundle#end()

filetype plugin on

"=========================
" thesaurus_query.vim
"=========================

let g:tq_enabled_backends = [ 'openoffice_en', 'datamuse_com' ]
let g:tq_mthesaur_file = '~/.vim/thesaurus/words.txt'
let g:tq_openoffice_en_file = '~/.vim/thesaurus/MyThes-1.0/th_en_US_new'

"=========================
" YouCompleteMe
"========================

let g:ycm_confirm_extra_conf = 0
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_use_clang = 1
let g:ycm_clangd_uses_ycmd_caching = 1
let g:ycm_clangd_binary_path = '/home/jjouve/.local/bin/clangd'
let g:ycm_filetype_blacklist = {}
" We don't want the preview window to bother us while we're moving around the
" windows.
let g:ycm_autoclose_preview_window_after_completion = 1

let mapleader = ','
let maplocalleader = ','

nmap <Leader>gg :YcmCompleter GoTo<CR>
nmap <Leader>gd :YcmCompleter GoToDeclaration<CR>
nmap <Leader>gr :YcmCompleter GoToReferences<CR>
nmap <Leader>d :YcmCompleter GetDoc<CR>
nmap <Leader>gt :tab split<CR> :YcmCompleter GoTo<CR>

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

let g:clang_format#command = 'clang-format-12'
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

" =====================
" Grammalecte
" =====================

let g:grammalecte_cli_py = '$HOME/.local/bin/grammalecte-cli.py'

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
let g:pandoc#modules#enabled = [ 'keyboard' ]
let g:pandoc#hypertext#editable_alternates_extensions = ''

"================
" Markdown
"================

let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_no_extensions_in_markdown = 1


"=============================
"Personal configuration
"=============================

set encoding=utf-8
let &colorcolumn="80"
set tw=80

" Syntax Highlighting
syntax enable
syntax on
set background=light
if has('termguicolors')
    set termguicolors
endif
let g:gruvbox_material_background = 'soft'
let g:gruvbox_material_better_performance = 1
let g:airline_theme = 'gruvbox_material'
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_transparent_background = 1
let g:gruvbox_material_diagnostic_line_highlight = 1
colorscheme gruvbox-material


set ttimeoutlen=50
set nowrap
set relativenumber

set tabstop=4
set shiftwidth=4
set expandtab
filetype indent on

" Show tabulations
set list
set listchars=tab:>-,trail:_,nbsp:%

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
au FileType markdown setlocal spell spelllang=fr

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
nmap <Leader>z :VimtexCompile<CR>

" Prelab
au FileType cmake setlocal tabstop=2
au FileType cmake setlocal shiftwidth=2

" Python
" We don't want to break lines in python files.
au FileType python setlocal tw=0

"See the difference between saved file and buffer
"command DiffOrig vert new | set bt=nofile | r ++edit # |0d_ | diffthis | wincmd p | diffthis
