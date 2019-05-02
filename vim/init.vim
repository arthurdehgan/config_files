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

call plug#begin()

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plug 'vim-scripts/indentpython.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'Valloric/YouCompleteMe'
Plug 'w0rp/ale'
Plug 'nvie/vim-flake8'
Plug 'ambv/black'
Plug 'SirVer/ultisnips'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'lervag/vimtex'

" All of your Plugins must be added before the following line
call plug#end()

" Latex parameters
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'okular'

" Autocompletion parameters
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = 'python'
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

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
colorscheme gruvbox

" Whitespace marking
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.tex match BadWhitespace /\s\+$/

" Remaps
noremap <F2> :lnext<CR>
noremap <C-F2> :lprevious<CR>
noremap <F4> :set hlsearch! hlsearch?<CR>
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
