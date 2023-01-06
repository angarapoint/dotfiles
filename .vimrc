setglobal nocompatible
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


call plug#begin('~/.vim/plugged')

" Common
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'joshdick/onedark.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
" Plug 'mcchrish/nnn.vim'
" Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'editorconfig/editorconfig-vim'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()

" Settings

let NERDTreeShowHidden=1
let g:NERDTreeWinPos="left"
let g:NERDTreeDirArrows=0

" Подсвечиваем все что можно подсвечивать
let python_highlight_all = 1

" Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
" В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251

set number
highlight LineNr ctermfg=grey

set ignorecase
set smartcase

set nobackup
set nowritebackup
set nowb
set noswapfile
set bs=2
set hlsearch
set hidden
set autoread

set background=dark
colorscheme onedark
let g:airline_theme = "onedark"

set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
set clipboard=unnamed

" Show whitespaces
set list listchars=tab:→\ ,eol:↲,nbsp:␣,trail:·,space:·,extends:⟩,precedes:⟨

" Bindings

let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>x :x<CR>
" nnoremap <Leader>o :GFiles .<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fa :Rg<CR>
nnoremap <leader>fp :let @+ = expand("%")<CR>
nnoremap <leader>p :Commands<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :StripWhitespace<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>] :tabn<CR>
nnoremap <leader>[ :tabp<CR>
nnoremap <leader>/ :noh<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>


" Replace visual selection by pressing Ctrl+R
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

let g:nnn#set_default_mappings = 0
nnoremap <leader>n :NnnPicker %:p:h<CR>

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>


" Snippets
" ab ssp screenshot_and_save_page
" ab bbg byebug
" ab csl console.log
" ab pdb import pdb; pdb.set_trace()
" ab pudb import pudb; pudb.set_trace()

" https://github.com/vim/vim/blob/master/runtime/doc/russian.txt
" Enable hotkeys for Russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz


