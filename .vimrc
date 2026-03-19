"THIS IS MY CUSTOM ~/.vimrc ... Feel free to use it for ideas. Comments are rough as they are for me but I am relatively precise. Usually... 
"Very obviously: PLEASE NOTE - Running this alone will result in an unstable system unless you install all of the plugins like Ale, for instance, and a number of others. This is an incredibly customized setup 

"Color scheme list: https://alta3.com/blog/vimcolorscheme

"tell vim to check files immediately - even before they are saved
"autocmd BufEnter * ALELint

"Enable highlighted search
set hlsearch

"Ignore whitespace with $
nnoremap $ g_

"Remove whitespace before saving
autocmd BufWritePre * :%s/\s\+$//e

set background=dark " Set background to dark or light, depending on your preference
"basic syntax on
syntax on

" Define a new highlight group for Ale's title bar
highlight AleTitleBar guibg=#RRGGBB guifg=#RRGGBB
" Set Ale to use the new highlight group for the title bar
let g:ale_virtualtext_highlight = 'AleTitleBar'
" Define a new highlight group for the terminal title bar
highlight TermTitle  guibg=#RRGGBB guifg=#RRGGBB

"autocmd FileType python syntax on
"Supertab
packloadall

"Attempt to disable Polyglot feature
let g:polyglot_disabled = ['markdown', 'markdown.plugin', 'python']
"let g:polyglot_disabled = ['markdown.plugin']
"This Python disabling measure is VERY important. Ain't nobody wanna deal with
"the grusome red - an unlightly spectacle presented by dear polyglot linting
"let g:polyglot_disabled = ['python']

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

command! Tnew tabnew | execute 'source /etc/vim/vimrc'
"For polyglot
set nocompatible

"Python audoindent was set up using the Vimjas plugin
call plug#begin()
Plug 'kamykn/spelunker.vim'
"contentious for Python. NOTE: Python syntax has been disabled above for good
"reason
"Resource for polyglot: https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'
Plug 'vim-autoformat/vim-autoformat'
"Plug 'Vimjas/vim-python-pep8-indent'
Plug 'dense-analysis/ale'
Plug 'ambv/black'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chriskempson/base16-vim'
Plug 'vim-voom/VOoM'
Plug 'thaerkh/vim-workspace'
call plug#end()
let g:enable_spelunker_vim = 1
let g:spelunker_check_type = 2
"let g:spelunker_highlight_type = 1
"Autoindent bash
filetype indent on

"Autoindnent all
set autoindent

filetype plugin indent on
"Added on 01.04.23
set undofile
set undodir=~/.vim/undodir
set backup
set backupdir=~/tmp/vim-backupdir
set backupext=.bak

:nnoremap <expr> z<esc> 'mz' . v:count . 'o<esc>`z'

nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==
inoremap <c-j> <Esc>:m .+1<CR>==gi
inoremap <c-k> <Esc>:m .-2<CR>==gi
vnoremap <c-j> :m '>+1<CR>gv=gv
vnoremap <c-k> :m '<-2<CR>gv=gv

"airline theme

let g:airline_theme='jellybeans'

let g:airline#extensions#disable_rtp_load=1

let g:ale_linters={
\ 'python': ['pylint'],
\}


" ALE: reasonable defaults from webinstall.dev/vim-ale
source ~/.vim/plugins/ale.vim

"Ale highlight fix
"highlight link ALEErrorLine SpellBad

"No comments
autocmd FileType * set formatoptions-=cro

"Disable linting features for ale: doc string check, trailing newlines, trailing whitespace\

"Custom changes to linter - regarding ale parameters. These have been very distracting from day one
let g:ale_python_pylint_options = '--disable=missing-module-docstring' " Disable missing module-level docstring check
let g:ale_python_pylint_options .= ', --disable=missing-class-docstring' " Disable missing class-level docstring check
let g:ale_python_pylint_options .= ', --disable=missing-function-docstring' " Disable missing function-level docstring check
let g:ale_python_pylint_options .= ', --disable=trailing-newlines' " Disable trailing newlines check
let g:ale_python_pylint_options .= ', --disable=trailing-whitespace' " Disable trailing whitespace check
let g:ale_python_pylint_options .= ', --disable=invalid-name' " Disable snake_case (invalid name) check

"Below added on Sept 24 - incorporated because the linter wasn't correcting fast enough ...
let g:ale_lint_on_text_changed = 'always'
let g:ale_lint_on_buffer_enter = 1

"Java configs
let g:ale_java_javac_executable = 'javac'

"Best autosave
"NOTE: uses workspace plugin - not native
let g:workspace_autosave_always = 1
let g:workspace_autosave_interval = 15

"search for strings - for all occurences in buffer
"g/string/#

"fix highlighting issues - 02.23.25
autocmd cursorhold * set nohlsearch
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
"noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?

" Force Bash syntax/filetype for .bashrc so vim-polyglot doesn't default it to sh
" This is intentionally scoped only to files named .bashrc
augroup force_bash_for_bashrc
  autocmd!
  autocmd BufRead,BufNewFile */.bashrc setlocal filetype=bash
augroup END

" F2: insert a space at the cursor without moving it or overwriting text

"NOT BAD
"nnoremap <Bar> i <C-o>l<Esc>

"NOTE: '[shift] + [|]': moves the object or whitespace the cursor is on
"forward once without changing the cursor position
nnoremap <Bar> i <Esc>i





