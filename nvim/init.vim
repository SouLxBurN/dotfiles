set tabstop=4 softtabstop=4
set shiftwidth=4
" set expandtab
set smartindent

set exrc
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set smartcase
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set report=2
set splitbelow
set splitright

call plug#begin('~/.config/nvim/plugged')
    Plug 'mbbill/undotree'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
    Plug 'tjdevries/nlua.nvim'
    Plug 'tjdevries/lsp_extensions.nvim'

	" Markdown
	Plug 'godlygeek/tabular'
	Plug 'plasticboy/vim-markdown'
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    " Improved Syntax Highlight/Parsing
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Nerdtree and plugins
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    " Telescope
    Plug 'BurntSushi/ripgrep'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'

    " Git Plugins
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'

    " Language Specific Plugins
    Plug 'fatih/vim-go'

    " Color Scheme
    Plug 'gruvbox-community/gruvbox'
call plug#end()

" Color and Transparency
colorscheme gruvbox
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
hi Normal guibg=none ctermbg=NONE

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"

" Status line types/signatures
let g:go_auto_type_info = 1

" Markdown Config
let g:vim_markdown_folding_disabled = 1

" Always thank the leader
let mapleader = " "

" Autocomplete adjustments
set completeopt=menuone,noinsert,noselect
let g:completeion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Quick edit config files
nnoremap <leader>vrc :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>zsh :e ~/.zshrc<CR>

" Telescope mappings
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pa :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>ph :lua require'telescope.builtin'.treesitter()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>

" OS Copy Paste
noremap <Leader>y "*y
noremap <Leader>p "*p

" Easier split navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap - :wincmd -<CR>
nnoremap + :wincmd +<CR>

" NerdTree mappings
" map <silent> <C-n> :NERDTreeFocus<CR>,
" nnoremap <silent> <Leader>pv :NERDTreeFind<CR>
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Undotree Mapping
nnoremap <leader>u :UndotreeShow<CR>

" Terminal Mapping
nnoremap <leader>t :bo sp \| resize 20 \| terminal<CR>
nnoremap <leader>T :vsp \| terminal<CR>
tnoremap <Esc> <C-\><C-n>

" Connecting and initializing language servers
lua require'telescope'.setup{}
lua require('telescope').load_extension('fzy_native')
lua require'nvim-treesitter.configs'.setup{ highlight = { enable = true, disable = { } } }
lua require'lspconfig'.gopls.setup{on_attach=require'completion'.on_attach}
lua require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}

" I Blame ThePrimeagen... This fixes something...
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup SouLxBurN
	autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
	autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
