set background=dark

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "logHighlighting"

" Syntax additions
if (&ft == 'python')
endif

syntax match Fatal 'FATAL'
syntax match Error 'ERROR'
syntax match Warning 'WARNING'
syntax match Info 'INFO'
syntax match Debug 'DEBUG'

syntax match date '[0-9]\+-[0-9]\+-[0-9]\+ [0-9]\+:[0-9]\+:[0-9]\+'
syntax match fileName '[a-zA-Z]\+.[a-zA-Z]\+:[0-9]\+'

hi Fatal ctermfg=232 ctermbg=1 cterm=NONE
hi Error ctermfg=232 ctermbg=1 cterm=NONE
hi Warning ctermfg=232 ctermbg=226 cterm=NONE
hi Info ctermfg=232 ctermbg=82 cterm=NONE
hi Debug ctermfg=232 ctermbg=21 cterm=NONE

hi date ctermfg=82 ctermbg=NONE cterm=NONE
hi fileName ctermfg=14 ctermbg=NONE cterm=NONE

syntax match Braces '[{}()\[\]]'

" The Basic (Normal) Text Style

hi CursorLine  term=bold  cterm=bold
hi Search      ctermfg=11 ctermbg=NONE    cterm=bold,underline

hi Normal      ctermfg=1  ctermbg=NONE  cterm=NONE

" All the Python related stuff

hi whitespaceEOL ctermfg=255 ctermbg=234 cterm=NONE
hi Braces      ctermfg=11   ctermbg=NONE  cterm=NONE
hi Number      ctermfg=208  ctermbg=NONE  cterm=NONE
hi Float       ctermfg=208  ctermbg=NONE  cterm=NONE
hi Statement   ctermfg=123  ctermbg=NONE  cterm=NONE
hi Function    ctermfg=35   ctermbg=NONE  cterm=NONE
hi Conditional ctermfg=123  ctermbg=NONE  cterm=NONE
hi Operator    ctermfg=123  ctermbg=NONE  cterm=NONE
hi Operators    ctermfg=93  ctermbg=NONE  cterm=NONE
hi Todo        ctermfg=253  ctermbg=NONE  cterm=bold
hi Fixme       ctermfg=253  ctermbg=NONE  cterm=bold
hi Optimize       ctermfg=253  ctermbg=NONE  cterm=bold
hi Comment     ctermfg=240  ctermbg=NONE  cterm=NONE
hi Special     ctermfg=81   ctermbg=NONE  cterm=NONE
hi String      ctermfg=169  ctermbg=NONE  cterm=NONE
hi Include     ctermfg=118  ctermbg=NONE  cterm=NONE
hi Error       ctermfg=88   ctermbg=172   cterm=bold
hi PreProc     ctermfg=81   ctermbg=NONE  cterm=NONE
hi Boolean     ctermfg=38   ctermbg=NONE  cterm=NONE
hi Character   ctermfg=142  ctermbg=NONE  cterm=NONE

"Vim Stuff

hi Visual      ctermfg=253  ctermbg=235   cterm=NONE
hi VertSplit   ctermfg=232  ctermbg=244   cterm=NONE
hi ErrorMsg    ctermfg=88   ctermbg=172   cterm=bold
hi MatchParen  ctermfg=16   ctermbg=215   cterm=bold
hi Folded      ctermfg=67   ctermbg=16    cterm=bold
hi FoldColumn  ctermfg=67   ctermbg=16    cterm=NONE
hi LineNr      ctermfg=58   ctermbg=NONE  cterm=NONE
hi NonText     ctermfg=58   ctermbg=NONE  cterm=NONE
hi Pmenu       ctermfg=81   ctermbg=16    cterm=NONE
hi PmenuSel    ctermfg=202  ctermbg=16    cterm=NONE
hi PmenuSbar   ctermfg=81   ctermbg=16    cterm=NONE
hi PmenuThumb  ctermfg=81   ctermbg=16    cterm=NONE
hi IncSearch   ctermfg=253  ctermbg=66    cterm=NONE
hi TabLine     ctermfg=3    ctermbg=NONE  cterm=NONE
hi TabLineSel  ctermfg=14   ctermbg=NONE  cterm=bold
hi TabLineFill ctermfg=46   ctermbg=NONE  cterm=NONE
