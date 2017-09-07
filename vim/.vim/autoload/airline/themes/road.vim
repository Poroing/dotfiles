" Each theme is contained in its own file and declares variables scoped to the
" file.  These variables represent the possible "modes" that airline can
" detect.  The mode is the return value of mode(), which gets converted to a
" readable string.  The following is a list currently supported modes: normal,
" insert, replace, visual, and inactive.
"
" Each mode can also have overrides.  These are small changes to the mode that
" don't require a completely different look.  "modified" and "paste" are two
" such supported overrides.  These are simply suffixed to the major mode,
" separated by an underscore.  For example, "normal_modified" would be normal
" mode where the current buffer is modified.
"
" The theming algorithm is a 2-pass system where the mode will draw over all
" parts of the statusline, and then the override is applied after.  This means
" it is possible to specify a subset of the theme in overrides, as it will
" simply overwrite the previous colors.  If you want simultaneous overrides,
" then they will need to change different parts of the statusline so they do
" not conflict with each other.
"
" First, let's define an empty dictionary and assign it to the "palette"
" variable. The # is a separator that maps with the directory structure. If
" you get this wrong, Vim will complain loudly.
let g:airline#themes#road#palette = {}

" First let's define some arrays. The s: is just a VimL thing for scoping the
" variables to the current script. Without this, these variables would be
" declared globally. Now let's declare some colors for normal mode and add it
" to the dictionary.  The array is in the format:
" [ guifg, guibg, ctermfg, ctermbg, opts ]. See "help attr-list" for valid
" values for the "opt" value.
let s:N1   = [ '#2c2e37' , '#c48c7d' , 0  , 9 ]
let s:N2   = [ '#bddee4' , '#47645b' , 7  , 8 ]
let s:N3   = [ '#47645b' , '#bddee4' , 8 , 7 ]
let g:airline#themes#road#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let s:I1 = [ '#2c2e37' , '#2b85d9' , 0  , 12  ]
let s:I2   = [ '#bddee4' , '#47645b' , 7  , 8 ]
let s:I3   = [ '#47645b' , '#bddee4' , 8 , 7 ]
let g:airline#themes#road#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)

let g:airline#themes#road#palette.replace = copy(g:airline#themes#road#palette.insert)

let s:V1 = [ '#2c2e37' , '#75b27b' , 0 , 10 ]
let s:V2   = [ '#bddee4' , '#47645b' , 7  , 8 ]
let s:V3   = [ '#47645b' , '#bddee4' , 8 , 7 ]
let g:airline#themes#road#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

let s:IA1 = [ '#47645b' , '#2c2e37' , 8 , 0 ]
let s:IA2   = [ '#bddee4' , '#47645b' , 7  , 8 ]
let s:IA3   = [ '#47645b' , '#bddee4' , 8 , 7 ]
let g:airline#themes#road#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
