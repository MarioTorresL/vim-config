set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax on
set relativenumber
set showcmd
set encoding=UTF-8
set showmatch
set laststatus=2
set noshowmode
set hidden

"Plugs
call plug#begin('~/.config/nvim/plugged')

"syntax
Plug 'sheerun/vim-polyglot'

"status bar
Plug 'maximbaz/lightline-ale'
Plug 'itchyny/lightline.vim'

"tree
Plug 'scrooloose/nerdtree'

"typing
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'

"themes
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'

"IDE
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'

"tmux
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"git
Plug 'tpope/vim-fugitive'

call plug#end()

"---------Plug config----------

colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"


" HTML, JSX
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'


" COC SETTING
let g:coc_global_extensions = ['coc-tsserver']


"FZF
let $FZF_DEFAULT_OPTS='--layout=reverse'


" lightline
let g:airline_powerline_fonts = 1
let g:lightline = {
      \ 'active': {
      \   'left': [['mode', 'paste'], ['relativepath', 'modified']],
      \   'right': [['gitbranch'], ['filetype', 'percent', 'lineinfo']]
      \ },
      \ 'inactive': {
      \   'left': [['inactive'], ['relativepath']],
      \   'right': [['bufnum']]
      \ },
      \ 'component': {
      \   'bufnum': '%n',
      \   'inactive': 'inactive'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'colorscheme': 'gruvbox',
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
      \}


"-------- vim fugitive --------
command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


" always show signcolumns
set signcolumn=yes


" fugitive always vertical diffing
set diffopt+=vertical


"tree config
let NERDTreeShowHidden=1
"---------coc config ---------

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"Maps keys

let mapleader=" "

"Plugs
map <Leader>d :NERDTreeToggle<CR>
map <Leader>p :Files<CR>
map <Leader>ag :Ag<CR>

"quick semi
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

"split resize
nnoremap <Leader>> 10<C-w>>
nnoremap <Leader>< 10<C-w><

"buffers
map <Leader>b :Buffers<Cr>

" faster scrolling
nmap <Leader>s <Plug>(easymotion-s2)
