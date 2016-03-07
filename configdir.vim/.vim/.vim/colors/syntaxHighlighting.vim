set background=dark

hi clear
if exists("syntax_on")
  "syntax reset
endif

let g:colors_name = "syntaxHighlighting"

syntax match Braces '[{}()\[\]]'
syntax match Operators '[\!\*\/\+\-\=\<\>\|\&\.]'
syntax match Optimize '[Oo][Pp][Tt][Ii][Mm][Ii][Zz][Ee]:'
syntax match SemiColon ';'
syntax match whitespaceEOL '\s\+$'

syntax match Comment '//.*$'
syntax match Comment '\/\*.\{-}\_.\{-}\*\/'

" The Basic (Normal) Text Style

hi CursorLine    ctermfg=NONE ctermbg=NONE  cterm=bold
hi Search        ctermfg=11   ctermbg=NONE  cterm=bold,underline

hi Normal        ctermfg=1    ctermbg=NONE  cterm=NONE

hi Boolean       ctermfg=38   ctermbg=NONE  cterm=NONE
hi Braces        ctermfg=11   ctermbg=NONE  cterm=NONE
hi Character     ctermfg=142  ctermbg=NONE  cterm=NONE
hi Comment       ctermfg=243  ctermbg=NONE  cterm=NONE
hi Conditional   ctermfg=123  ctermbg=NONE  cterm=NONE
hi Error         ctermfg=255  ctermbg=172   cterm=bold
hi Fixme         ctermfg=253  ctermbg=NONE  cterm=bold
hi Float         ctermfg=1    ctermbg=NONE  cterm=NONE
hi Function      ctermfg=155  ctermbg=NONE  cterm=NONE
" cterm of Identifier used to be underline
hi Identifier    ctermfg=2    ctermbg=NONE  cterm=NONE
hi Include       ctermfg=118  ctermbg=NONE  cterm=NONE
hi Number        ctermfg=202  ctermbg=NONE  cterm=NONE
hi Operator      ctermfg=123  ctermbg=NONE  cterm=NONE
hi Operators     ctermfg=93   ctermbg=NONE  cterm=NONE
hi Optimize      ctermfg=253  ctermbg=NONE  cterm=bold
hi PreProc       ctermfg=81   ctermbg=NONE  cterm=NONE
hi Special       ctermfg=81   ctermbg=NONE  cterm=NONE
hi SemiColon     ctermfg=11   ctermbg=NONE  cterm=NONE
hi Statement     ctermfg=4    ctermbg=NONE  cterm=NONE
hi String        ctermfg=5    ctermbg=NONE  cterm=NONE
hi Todo          ctermfg=253  ctermbg=NONE  cterm=bold
hi whitespaceEOL ctermfg=NONE ctermbg=238   cterm=NONE


"Vim Stuff

hi ErrorMsg      ctermfg=255  ctermbg=172   cterm=bold
hi Folded        ctermfg=67   ctermbg=16    cterm=bold
hi FoldColumn    ctermfg=67   ctermbg=16    cterm=NONE
hi IncSearch     ctermfg=253  ctermbg=66    cterm=NONE
hi LineNr        ctermfg=58   ctermbg=NONE  cterm=NONE
hi MatchParen    ctermfg=16   ctermbg=215   cterm=bold
hi NonText       ctermfg=58   ctermbg=NONE  cterm=NONE
hi Pmenu         ctermfg=81   ctermbg=16    cterm=NONE
hi PmenuSel      ctermfg=202  ctermbg=16    cterm=NONE
hi PmenuSbar     ctermfg=81   ctermbg=16    cterm=NONE
hi PmenuThumb    ctermfg=81   ctermbg=16    cterm=NONE
hi VertSplit     ctermfg=232  ctermbg=244   cterm=NONE
hi Visual        ctermfg=253  ctermbg=235   cterm=NONE
hi TabLine       ctermfg=3    ctermbg=NONE  cterm=NONE
hi TabLineSel    ctermfg=14   ctermbg=NONE  cterm=bold
hi TabLineFill   ctermfg=46   ctermbg=NONE  cterm=NONE

" All the Python related stuff
if (&ft == 'python')
    syntax match Self 'self'
    hi Self ctermfg=253 ctermbg=NONE cterm=NONE

    syntax match Operators ':'

    syntax match Constructs 'False'
    syntax match Constructs 'True'
    syntax match Constructs 'None'
    hi Constructs ctermfg=194 ctermbg=NONE cterm=NONE
    hi Constants  ctermfg=194 ctermbg=NONE cterm=NONE
endif
