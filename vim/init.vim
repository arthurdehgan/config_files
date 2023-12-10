set termguicolors
set encoding=utf-8
set nocompatible              " required
filetype off                  " required

"F6 to hide or show line numbers
nnoremap <F6> :set number! norelativenumber!<CR>
set clipboard+=unnamedplus

"auto insert " around inner word
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>[ viw<esc>a]<esc>bi[<esc>lel

"m and M to insert new lines
nnoremap m o<Esc>k
nnoremap M O<Esc>j

"moving around
nnoremap H _
nnoremap L $

set updatetime=300

call plug#begin()

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plug 'vim-scripts/indentpython.vim'
Plug 'loctvl842/monokai-pro.nvim'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvie/vim-flake8'
Plug 'psf/black'
Plug 'SirVer/ultisnips'
Plug 'itchyny/lightline.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'xuhdev/vim-latex-live-preview'
" Plug 'lervag/vimtex'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

" All of your Plugins must be added before the following line
call plug#end()

" Latex parameters
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'okular'

" pydocstring config
let g:pydocstring_doq_path =  '/home/arthur/.pyenv/shims/doq'
let g:pydocstring_formatter = 'numpy'

" Autodelete trailing space
autocmd BufWritePre * %s/\s\+$//e

" Black
autocmd BufWritePre *.py execute ':Black'

" Error checking with ale
let g:ale_linters = {'python': ['flake8', 'mypy', 'pylint']}

" Show lines
set nu relativenumber

" Python specifics
au BufNewFile,BufRead *.py;
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=88
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Make code pretty
let python_highlight_all=1
syntax on
set background=dark

" Monokai Pro config
colorscheme monokai-pro
let g:lightline = {
    \ 'colorscheme': 'monokaipro',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status'
    \ },
    \ }

" Use autocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
luafile /home/arthur/.config/nvim/monokai.lua

" Whitespace marking
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.tex match BadWhitespace /\s\+$/

" Remaps
noremap <F4> :set hlsearch! hlsearch?<CR>
nmap <silent> <F8> <Plug>(pydocstring)
autocmd FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
autocmd FileType tex nnoremap <buffer> <F9> :LLPStartPreview<cr>
inoremap jk <Esc>
inoremap <Esc> <Nop>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
set splitbelow
set splitright

" cov Vim autocomplete remaps
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use F2 and C-F2 to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> <F2> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-F2> <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction


" Config for F9
augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END

"Folding Enabled
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:python3_host_prog = '/home/arthur/.pyenv/versions/nvim/bin/python'
