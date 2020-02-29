" ------------------------------------------------------------
"  Plugins
" ------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Language support
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-pug'
Plug 'wavded/vim-stylus'
Plug 'cakebaker/scss-syntax.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'rhysd/npm-debug-log.vim'
Plug 'scrooloose/nerdtree'
Plug 'othree/jspc.vim'
Plug 'elzr/vim-json'
Plug 'Quramy/tsuquyomi'
Plug 'Quramy/vim-js-pretty-template'
Plug 'posva/vim-vue'
Plug 'neoclide/coc.nvim', { 'tag': '*', 'branch': 'release' }
Plug 'burner/vim-svelte'
Plug 'amadeus/vim-mjml'
Plug 'chooh/brightscript.vim'
Plug 'bumaociyuan/vim-swift'

" finder
Plug 'ctrlpvim/ctrlp.vim'

" git
Plug 'airblade/vim-gitgutter'
Plug 'jreybert/vimagit'

" utils
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'yggdroot/indentline'
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-unimpaired'
Plug 'editorconfig/editorconfig-vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'alvan/vim-closetag'
Plug 'Shougo/echodoc.vim'
Plug 'othree/jsdoc-syntax.vim'

" Add plugins to &runtimepath
call plug#end()
" ------------------------------------------------------------

" ------------------------------------------------------------
" Edition
" ------------------------------------------------------------
syntax on

set mouse=a

" fuentes: https://github.com/powerline/fonts
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
autocmd FileType java setlocal shiftwidth=4 softtabstop=4

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

set hlsearch

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

" dont fold by default
set nofoldenable

"-----------------------------------------------------------------------------------------------------
" ctrlp 
"-----------------------------------------------------------------------------------------------------
map fb :CtrlPBuffer<cr>

map ft :CtrlPBufTag<cr>

let g:ctrlp_show_hidden = 1

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules|build|Resources|dist$',
  \ 'file': '\v\.(exe|so|dll|pyc)$'
  \ }

"-----------------------------------------------------------------------------------------------------
" nerdtree
"-----------------------------------------------------------------------------------------------------
let g:NERDTreeHijackNetrw = 0

nnoremap <Leader>n :NERDTreeToggle<CR>

"-----------------------------------------------------------------------------------------------------
" Vim airline
"-----------------------------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts = 1

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
" Unimpaired
"---------------------------------------------------------------------------
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e

" Bubble multiple lines
vmap <C-J> ]egv
vmap <C-k> [egv

"---------------------------------------------------------------------------
" Visually select the text that was last edited/pasted
"---------------------------------------------------------------------------
nmap gV `[v`]


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
let g:vim_json_syntax_conceal = 0

"-----------------------------------------------------------------------------------------------------
" Theme
"-----------------------------------------------------------------------------------------------------
" no wrap
set nowrap

" wrap line
set colorcolumn=80

highlight Pmenu ctermbg=gray guibg=gray

set cursorline

set encoding=UTF-8

"set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete:h14
set guifont=Hack:h14

if (has("termguicolors"))
 set termguicolors
endif

"set background=dark

"colorscheme shades_of_purple
"colorscheme cyberpunkneon
"colorscheme neuromancer
colorscheme demo

"-----------------------------------------------------------------------------------------------------
" vim-javascript
"-----------------------------------------------------------------------------------------------------
"let g:jsx_ext_required = 0
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=indent
augroup END

"-----------------------------------------------------------------------------------------------------
" #COC
"-----------------------------------------------------------------------------------------------------
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> <Leader>K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

"-----------------------------------------------------------------------------------------------------
" vim-closetag
"-----------------------------------------------------------------------------------------------------
let g:closetag_filenames = '*.xml,*.html'

"-----------------------------------------------------------------------------------------------------
" escape
"-----------------------------------------------------------------------------------------------------
map <Leader>ee :call escape#entitie()<CR>
map <Leader>eu :call escape#unicode()<CR>

"-----------------------------------------------------------------------------------------------------
" Edit
"-----------------------------------------------------------------------------------------------------
vnoremap <C-c> "+y
nnoremap <C-v> "+p
inoremap <C-v> <Esc>"+p A

"-----------------------------------------------------------------------------------------------------
" Echodoc
"-----------------------------------------------------------------------------------------------------
" Or, you could use vim's popup window feature.
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'popup'
" To use a custom highlight for the popup window,
" change Pmenu to your highlight group
highlight link EchoDocPopup Pmenu
