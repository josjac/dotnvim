" ------------------------------------------------------------
"  Plugins
" ------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" neomake
Plug 'neomake/neomake'

" Language support
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-pug'
Plug 'wavded/vim-stylus'
Plug 'cakebaker/scss-syntax.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript',{ 'do': './install.sh' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rhysd/npm-debug-log.vim'
Plug 'neovim/node-host', { 'do': 'npm install' }
Plug 'steelsojka/deoplete-flow'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
"Plug 'ternjs/tern_for_vim'


" finder
Plug 'ctrlpvim/ctrlp.vim'

" ui
Plug 'bling/vim-airline'
Plug 'flazz/vim-colorschemes'
Plug 'ayu-theme/ayu-vim-airline'
Plug 'ayu-theme/ayu-vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" utils
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'
Plug 'tmhedberg/SimpylFold'

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
" ctrlp 
"-----------------------------------------------------------------------------------------------------
set autochdir
map fb :CtrlPBuffer<cr>
let g:ctrlp_show_hidden = 1

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules|build|Resources|dist$',
  \ 'file': '\v\.(exe|so|dll|pyc)$'
  \ }

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


"-----------------------------------------------------------------------------------------------------
" Emmet
"-----------------------------------------------------------------------------------------------------
let g:user_emmet_leader_key = '<c-e>'


"-----------------------------------------------------------------------------------------------------
" json
"-----------------------------------------------------------------------------------------------------
au BufRead .* set conceallevel=0

"-----------------------------------------------------------------------------------------------------
" Vim airline
"-----------------------------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"-----------------------------------------------------------------------------------------------------
" Color
"-----------------------------------------------------------------------------------------------------
set background=dark
let ayucolor="mirage"
colorscheme ayu

"-----------------------------------------------------------------------------------------------------
" neomake
"-----------------------------------------------------------------------------------------------------
let g:neomake_javascript_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

"-----------------------------------------------------------------------------------------------------
" vim-javascript
"-----------------------------------------------------------------------------------------------------
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END
let g:used_javascript_libs = 'jquery,requirejs,lodash,underscore'


"-----------------------------------------------------------------------------------------------------
" deoplete
"-----------------------------------------------------------------------------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#tern_bin = '/Users/jayon/.nvm/versions/node/v8.11.3/bin/tern'

"-----------------------------------------------------------------------------------------------------
" functions
"-----------------------------------------------------------------------------------------------------
source ~/.config/nvim/functions/entities.vim
source ~/.config/nvim/functions/unicode.vim
