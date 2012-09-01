set nocompatible

set number
set ruler

" Set encoding
set encoding=utf-8

" Whitespace stuff
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Status bar
set laststatus=2

" Show column line for 80 characters
" set colorcolumn=80

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>nt :NERDTreeToggle<CR>

" CTags
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

function s:setupWrapping()
  set wrap
  set wm=2
  set textwidth=72
endfunction

function s:setupMarkup()
  call s:setupWrapping()
endfunction

" make and python use real tabs
au FileType make                                     set noexpandtab

" Thorfile, Rakefile and Gemfile are Ruby
au BufRead,BufNewFile {Gemfile,Rakefile,Thorfile,config.ru}    set ft=ruby

" md, markdown, and mk are markdown and define buffer-local preview
au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn} call s:setupMarkup()

" au BufRead,BufNewFile *.txt call s:setupWrapping()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a tab edit command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" Inserts the path of the currently edited file into a command
" Command mode: Ctrl+P
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Unimpaired configuration
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Use modeline overrides
set modeline
set modelines=10

" Default color scheme
"color blackpearl2
set background=dark
"color solarized

" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"Run the pathogen stuff
call pathogen#infect()
syntax on
filetype plugin indent on

let g:user_zen_expandabbr_key = '<D-e>' 

"handy mapping for vertical split windows
map <leader>v :vsplit <cr>

"re-select after indenting
vnoremap < <gv
vnoremap > >gv

" Map the escape key to 
inoremap jj <Esc>
inoremap jk <Esc>

"remove search hilighting
set nohlsearch
noremap <silent><Leader>/ :noh <CR>
nnoremap <leader><space> :noh<cr>

" make vim regexs behave like normal regexes
nnoremap / /\v
vnoremap / /\v

noremap <F1> <Esc>

"mappings for working with buffers
noremap <C-n> :bn <Enter>
noremap <C-p> :bp <Enter>
noremap <leader>c :enew <Enter>

"Mappings for working with buffers
noremap <leader>n :bn <Enter>
noremap <leader>p :bp <Enter>
noremap <leader>l :ls <Enter>
noremap <leader>c :enew <Enter>
set hidden

"Customization of ctrl-p plugin
noremap <leader>t :CtrlP <Enter>
let g:ctrlp_working_path_mode = 2

"Handy text processing commands
command TrimWhiteSpace %s/\s\+$//
command TitleCase s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g

"Automatically remove trailing whitespace
autocmd FileType ruby,python,javascript,java autocmd BufWritePre <buffer> :%s/\s\+$//e

"Handy mapping to cd to current files directory
noremap <leader>cd :cd %:p:h <Enter>

"Automatically read file changes from disk
set autoread

"Turn off the any audible or visual bell
set vb t_vb=
