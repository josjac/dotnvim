" ------------------------------------------------------------
"  Plugins
" ------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'

"snipets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

"nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" sytastic
Plug 'scrooloose/syntastic'

" syntaxs
Plug 'digitaltoad/vim-jade'
Plug 'wavded/vim-stylus'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'
Plug 'OrangeT/vim-csharp'

" finder
Plug 'ctrlpvim/ctrlp.vim'

" colors
Plug 'flazz/vim-colorschemes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" utils
Plug 'terryma/vim-multiple-cursors'
Plug 'maksimr/vim-jsbeautify'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-unimpaired'
Plug 'mattn/emmet-vim'
Plug 'unicodeswitch.vim'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'
Plug 'tmhedberg/SimpylFold'

Plug 'carlitux/deoplete-ternjs'

" Add plugins to &runtimepath
call plug#end()
" ------------------------------------------------------------

" ------------------------------------------------------------
" Edition
" ------------------------------------------------------------
syntax on

" fuentes: https://github.com/powerline/fonts
set guifont=Droid\ Sans\ Mono\ for\ Powerline:h14
set lsp=3

" line numbers
set nu

" Use spaces instead tabs
set expandtab

" tabstops of 
set tabstop=2

" indents of 
set shiftwidth=2

" filetype indent
autocmd FileType python setlocal shiftwidth=4 softtabstop=4

" Error tab
match errorMsg /[^\t]\zs\t\+/

" Set mapleader
let mapleader = ","
let g:mapleader = ","

" Do not redraw, when running macros.. lazyredraw
set lz

" Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase
set incsearch
set smartcase

" Set magic on
set magic

" No sound on errors.
set noerrorbells
set novisualbell

" show matching bracets
set showmatch
set showmode
set ruler

" Remove the Windows ^M
noremap <Leader>dos2unix :%s/<C-V><cr>/<C-V><cr>/ge<cr>'tzt'm

" Remove indenting on empty lines
map <F2> :%s/\s*$//g<cr>:noh<cr>''

" Change dos to unix fileformat
map <Leader>unix :e ++ff=dos<cr>:setlocal ff=unix<cr><cr>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" no wrap
set nowrap

" wrap line
set colorcolumn=80

"---------------------------------------------------------------------------
" Files and Backups
"---------------------------------------------------------------------------
set nobackup
set nowb
set noswapfile


" Folding
"--------------------------------------------------------------------------
" fold based on indent
set foldmethod=indent

" deepest fold is 10 levels
set foldnestmax=10

" dont fold by default
set nofoldenable

" this is just what i use
set foldlevel=1


"---------------------------------------------------------------------------
" save CTRL-S
"--------------------------------------------------------------------------
nmap <C-s> :w<CR>
imap <C-s> <Esc>:w<CR>a

"---------------------------------------------------------------------------
" window split 
"--------------------------------------------------------------------------
noremap <silent>,hs :vsplit<CR>
noremap <silent>,s :split<CR>

"---------------------------------------------------------------------------
" Easy split navigation
"--------------------------------------------------------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"---------------------------------------------------------------------------
" window control 
"--------------------------------------------------------------------------
function Maxwin()
  :res 9999<CR>
  :vertical res 9999<CR>
endfunction

nnoremap <C-w-_> :res 9999<CR>
noremap <silent>,m :call Maxwin()<CR>
noremap <silent>,0 :<C-w-=><CR>

"---------------------------------------------------------------------------
" NERDTree
"---------------------------------------------------------------------------
noremap <silent>,n :NERDTreeToggle<CR>
noremap <silent>,fn :NERDTreeFind<CR>
let NERDTreeIgnore=['\~$','\.pyc$']
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_autoclose=0

"---------------------------------------------------------------------------
" Tab nav
"---------------------------------------------------------------------------
nnoremap <C-TAB> :tabn<CR>
noremap <CS-TAB> :tabp<CR>

"---------------------------------------------------------------------------
  " Bubble single lines
"---------------------------------------------------------------------------
nmap <C-k> [e
nmap <C-j> ]e


"---------------------------------------------------------------------------
" Bubble multiple lines
"---------------------------------------------------------------------------
vmap <C-J> ]egv
vmap <C-k> [egv

"---------------------------------------------------------------------------
" Visually select the text that was last edited/pasted
"---------------------------------------------------------------------------
nmap gV `[v`]

"-----------------------------------------------------------------------------------------------------
" syntastic
"-----------------------------------------------------------------------------------------------------
map <C-ENTER> :SyntasticCheck<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'


"-----------------------------------------------------------------------------------------------------
" ctrlp 
"-----------------------------------------------------------------------------------------------------
map fb :CtrlPMRU<cr>
map ff :CtrlP pwd<cr>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules|build$',
  \ 'file': '\v\.(exe|so|dll|pyc)$'
  \ }

"-----------------------------------------------------------------------------------------------------
" snippets 
"-----------------------------------------------------------------------------------------------------
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/snippets'

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"-----------------------------------------------------------------------------------------------------
" vim-jsbeautify
"-----------------------------------------------------------------------------------------------------
let g:config_Beautifier = {
  \ 'js': { 'indent_style': 'space', 'indent_size': 2 }
  \ }
noremap <leader>jsformat :call JsBeautify()<cr>

"-----------------------------------------------------------------------------------------------------
" Emmet
"-----------------------------------------------------------------------------------------------------
let g:user_emmet_leader_key = '<c-e>'


"-----------------------------------------------------------------------------------------------------
" titatinum
"-----------------------------------------------------------------------------------------------------
au BufNewFile,BufRead *.tss,*.webapp set filetype=tsscl

"-----------------------------------------------------------------------------------------------------
" Vim airline
"-----------------------------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"-----------------------------------------------------------------------------------------------------
" Color
"-----------------------------------------------------------------------------------------------------
set background=dark
"colors PaperColor
"let g:airline_theme='PaperColor'

colors hybrid_material
let g:airline_theme="hybrid"

"-----------------------------------------------------------------------------------------------------
" functions
"-----------------------------------------------------------------------------------------------------
source ~/.config/nvim/functions/quickrun.vim
source ~/.config/nvim/functions/entities.vim
source ~/.config/nvim/functions/unicode.vim
source ~/.config/nvim/functions/regexp.vim
