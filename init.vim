set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax on
set wrap
set relativenumber
set showcmd
set encoding=UTF-8
set showmatch
set laststatus=2
set noshowmode
set hidden
set nocompatible

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
Plug 'bluz71/vim-nightfly-colors'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'EdenEast/nightfox.nvim', { 'tag': 'v1.0.0' }
Plug 'ryanoasis/vim-devicons'

"IDE
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

"tmux
Plug 'christoomey/vim-tmux-navigator'

"autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"git
Plug 'tpope/vim-fugitive'

"comments
Plug 'tpope/vim-commentary'

call plug#end()

"---------Plug config----------

" Vimscript initialization file
colorscheme nightfox

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
      \ 'colorscheme': 'nightfox',
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

"NerdTree
"
"Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

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

"OpenTerminal
nnoremap <Leader>tv :botright vnew <Bar> :term<cr>
nnoremap <Leader>th :botright new <Bar> :term<cr>

"Prettier config
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nnoremap <leader>f :Prettier<CR>

"comments config
vnoremap <leader>" :Commentary<CR>

map <Leader>d :NERDTreeToggle<CR>
map <Leader>p :Files<CR>
map <Leader>t :FileTypes<CR>
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

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
let g:UltiSnipsSnippetDirectories=[$HOME.'/nvim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" use same javascript snipets to jsx
autocmd FileType javascriptreact UltiSnipsAddFiletypes javascript
