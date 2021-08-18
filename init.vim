" ------------------------------------------------------------
"  Plugins
" ------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" Language support
"Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', { 'tag': '*', 'branch': 'release' }
"Plug 'amadeus/vim-mjml'
"Plug 'chooh/brightscript.vim'
" ---------------------------------------------
" A collection of language packs for Vim.
Plug 'sheerun/vim-polyglot'
" ---------------------------------------------

" finder
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" utils
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'chrisbra/vim-xml-runtime'
"Plug 'tpope/vim-surround'

" ---------------------------------------------
" This plugin is used for displaying thin vertical lines at each indentation
" level 
Plug 'yggdroot/indentline'
" ---------------------------------------------
"
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'alvan/vim-closetag'
Plug 'othree/jsdoc-syntax.vim'
Plug 'ap/vim-css-color'

" theme
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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
set rnu

" Use spaces instead tabs
set expandtab

" tabstops of 
set tabstop=2

" indents of 
set shiftwidth=2

" filetype 
autocmd FileType python setlocal shiftwidth=4 softtabstop=4
autocmd FileType java setlocal shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufRead *.tss set syntax=scss

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
set fdm=indent

" dont fold by default
set nofoldenable

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
"set guifont=Hack:h14
set guifont=Fira\ Code:h14

if (has("termguicolors"))
 set termguicolors
endif

let ayucolor="mirage" 
colorscheme ayu

hi! Normal ctermbg=NONE guibg=NONE 
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

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
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-tabnine',
  \ 'coc-pairs',
  \ 'coc-eslint',
  \ 'coc-highlight',
  \ 'coc-explorer',
  \ 'coc-actions'
  \]

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Muestra la documentacion ,K
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
" coc-command
command! -nargs=0 EslintFix :CocCommand eslint.executeAutofix
command! -nargs=0 TsserverFix :CocCommand tsserver.executeAutofix
"-----------------------------------------------------------------------------------------------------


"-----------------------------------------------------------------------------------------------------
" coc-explorer
nnoremap <space>e :CocCommand explorer<CR>
"-----------------------------------------------------------------------------------------------------

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
" vim-javascript
"-----------------------------------------------------------------------------------------------------
let g:javascript_plugin_jsdoc = 1

"-----------------------------------------------------------------------------------------------------
" kristijanhusak/vim-js-file-import
let g:js_file_import_use_fzf = 1
"-----------------------------------------------------------------------------------------------------

"-----------------------------------------------------------------------------------------------------
" Telescope
"-----------------------------------------------------------------------------------------------------
map <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
map fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
