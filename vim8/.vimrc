set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'dracula/vim', { 'name': 'dracula' }
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-fugitive'
Plugin 'camspiers/animate.vim'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'https://github.com/kien/ctrlp.vim.git'
Plugin 'https://github.com/rking/ag.vim.git'
Plugin 'https://github.com/ajh17/VimCompletesMe'
Plugin 'https://github.com/Valloric/YouCompleteMe.git'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'pangloss/vim-javascript'
" Plugin 'hotoo/jsgf.vim'
Plugin 'mxw/vim-jsx'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()
filetype plugin indent on

color gruvbox 
set background=dark
set nowrap
set number
set tabstop=4
set shiftwidth=4
set colorcolumn=120
set noerrorbells
set noswapfile
set smartindent
set incsearch
set smartcase
syntax on
hi Normal guibg=NONE ctermbg=NONE

" vim-javascript vim-jsx configuration
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1

" nerdtree configuration
let NERDTreeMinimalUI = 1

" YCM
" The best part.
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

" key maps
let mapleader = " "
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ag_working_path_mode="r"

" ag items.  I need the silent ag.
if executable('ag')
  " Use ag over grep "
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore "
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache "
  let g:ctrlp_use_caching = 0
endif
" AG
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
nnoremap <Leader>ps :Ag<SPACE>


" window movement
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" For simple sizing of splits.
map - <C-W>-
map + <C-W>+
nnoremap <silent> <Leader>vr :vertical resize 30<CR>
nnoremap <silent> <Leader>v+ :vertical resize +5<CR>
nnoremap <silent> <Leader>v- :vertical resize -5<CR>
" NerdTree mappings
map <silent> <C-n> :NERDTreeFocus<CR>,
nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
"+Autocompletion
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType js,javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" OS Copy Paste
noremap <Leader>y "*y
noremap <Leader>p "*p

" Quick highlight
nmap <leader><leader> V
