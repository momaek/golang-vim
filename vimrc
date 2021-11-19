call plug#begin('~/.vim/plugged')
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/mru.vim'
Plug 'vim-scripts/netrw.vim'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
call plug#end()

let g:go_fmt_command = "gofmt"
" disable autoimport
let g:go_imports_autosave = 0

set shell=/bin/sh
set autoread
" Personal setting
" =======================================  start  =======================================
" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","
se cursorline
set foldcolumn=1

" disable vim-go goto definition
let g:go_def_mapping_enabled = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

" golang highlight
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_function_calls = 1


" coc.vim default config
" =================================================
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> <c-]> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>
"====================================================
" gi go install
nmap gi <ESC>:GoInstall<CR>

" line numbers
set relativenumber
set nu

" Enable filetype plugins
"
syntax on
filetype on
filetype plugin on
filetype indent on

imap sw <ESC>:w<CR>
nmap sw <ESC>:w<CR>
noremap qq <ESC>:q!<CR>
imap jj <ESC>
nmap 1t 1gt
nmap 2t 2gt
nmap 3t 3gt
nmap 4t 4gt
nmap 5t 5gt
colorscheme desert

"Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Height of the command bar
set cmdheight=2

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" backspace acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ \ Column:\ %c,

" move between windows
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Remap VIM 0 to first non-blank character
map 0 ^

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" close tab
nmap cw <ESC>:tabc<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" ================================ end ================================

" netrw config
"
set nocp
nnoremap <Leader><Leader> :Tlist<CR><C-W>h<C-W>s:e .<CR><C-W>l:let g:netrw_chgwin=winnr()<CR><C-W>h
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 55
let g:netrw_liststyle=0         " thin (change to 3 for tree)
let g:netrw_banner=0            " no banner
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically

augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

" CTRL-P
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<c-f>'
map <leader>j :CtrlP<cr>
map <c-b> :CtrlPBuffer<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'

" easymotion
let g:EasyMotion_smartcase = 1
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><leader>l <Plug>(easymotion-lineforward)
map <Leader><leader>. <Plug>(easymotion-repeat)

" golint
" set rtp+=/path/to/your/golint
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
"
" pretty tag
" set rtp+=/path/to/your/formattag
" autocmd BufWritePost,FileWritePost *.go execute 'PrettyTag' | checktime


