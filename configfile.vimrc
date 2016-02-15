set hidden
set number
set smartcase
set guioptions=emgF
set showtabline=4
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set cursorline
set hlsearch
set incsearch

helptags ~/.vim/doc/

nmap <silent> , :nohlsearch<cr>

function CSV(n)
    let [n2] = a:n
	set showtabline=a:n
	set softtabstop=a:n
	set shiftwidth=a:n
	set tabstop=a:n
	%s/,/\t/g
	set nosplitbelow
	1split
endfunction


autocmd BufNewFile,BufRead Makefile set noexpandtab
"autocmd BufNewFile,BufRead *.csv call CSV(25)

" ################################################
" UTF-8 support
" ################################################

set enc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,prc

" ################################################
" SNIPPETS
" TODO put these into an actual snippets folder
" ################################################

" Bash snippets
autocmd BufNewFile,BufRead *.sh abbr bang #!/bin/bash<cr><cr>

" Python snippets
autocmd BufNewFile,BufRead *.py,*.pyx abbr bang #!/usr/bin/python3<cr># -*- coding: utf-8 -*-<cr><cr>

" ################################################
" Text Manipulation
" ################################################

map <silent> c I# <Esc>
map <silent> <S-c> 0wx
map <silent> <cr> O<Esc>j
map <silent> <Space> i <Esc>
autocmd BufNewFile,BufRead *.java,*.js,*.php,*.c,*.cpp,*.h map <silent> c I// <Esc>
autocmd BufNewFile,BufRead *.tex,*.m map <silent> c I% <Esc>

" ################################################
" File Management
" ################################################

" NERDTree
map <silent> <leader>t :NERDTreeToggle<cr>
autocmd BufEnter * lcd %:p:h

" Tabs
map <silent> <Tab> :tabnext<cr>
map <silent> <S-Tab> :tabprevious<cr>
map  <C-o> :tabe<Space>

" ################################################
" Movement
" ################################################

map <silent> <S-k> <C-u>
map <silent> <S-j> <C-d>

map <silent> <UP> gk
map <silent> <DOWN> gj

nmap <silent> z $

nmap <silent> <C-l> :wincmd l<cr>
nmap <silent> <C-k> :wincmd k<cr>
nmap <silent> <C-j> :wincmd j<cr>
nmap <silent> <C-h> :wincmd h<cr>

" ################################################
" File Managment (Saving)
" ################################################

map <silent> q :q<cr>
map <silent> <S-q> :q!<cr>

map <silent> <F5> :e<cr>

" ################################################
" Window Management
" ################################################

set splitright
set splitbelow

nmap <silent> <C-w> :split<cr>
nmap <silent> <C-f> :vsplit<cr>

" ################################################
" Folds
" ################################################

"set foldenable
"set foldmethod=indent
"map <silent> <leader>f za

" ################################################
" Pathogen (Plugins)
" ################################################

" call pathogen#infect()
" call pathogen#helptags()

" ################################################
" Global Variables
" ################################################

" jedi-vim Python autocomplete plugin
" let g:jedi#goto_assignments_command = "<leader>g"
" let g:jedi#goto_definitions_command = "<leader>d"
" let g:jedi#documentation_command = '?'
" let g:jedi#usages_command = "<leader>n"
" let g:jedi#completions_command = "<C-Space>"
" let g:jedi#rename_command = "<leader>r"
" let g:jedi#show_call_signatures = "1"

" Syntax Highlighting
autocmd BufNewFile,BufRead *       colo syntaxHighlighting
autocmd BufNewFile,BufRead *.log.* colo logHighlighting
