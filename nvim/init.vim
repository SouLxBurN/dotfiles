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

	" Statusline
	Plug 'hoob3rt/lualine.nvim'

	" Pretty Icons uwu
	Plug 'ryanoasis/vim-devicons'
	Plug 'kyazdani42/nvim-web-devicons'

	" Environment files
	Plug 'tpope/vim-dotenv'

	" Markdown
	Plug 'godlygeek/tabular'
	Plug 'plasticboy/vim-markdown'
	" Requires yarn, if yarn wasn't present on :PlugInstall
	" run :call mkdp#until#install()
	Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

    " Improved Syntax Highlight/Parsing
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Nerdtree and plugins
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
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
	Plug 'yuezk/vim-js'
	Plug 'maxmellon/vim-jsx-pretty'
	Plug 'HerringtonDarkholme/yats.vim' " typescript syntax

	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-java', 'coc-java-lombok', 'coc-groovy', 'coc-docker', 'coc-floaterm']

	" Floating Terminals
	Plug 'voldikss/vim-floaterm'

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
hi Normal guibg=none ctermbg=none
hi StatusLine guibg=none cterm=none ctermbg=none ctermfg=223 guifg=#ebdbb2
hi StatusLineNC gui=none guibg=none cterm=none ctermbg=none ctermfg=223 guifg=#ebdbb2
hi SignColumn guibg=none cterm=none ctermbg=none

" Go syntax highlighting
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1

" Auto formatting and importing
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_debug_preserve_layout = 0

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

" Coc.nvim mappings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" OS Copy Paste
noremap <Leader>y "*y
noremap <Leader>p "*p

" Easier split navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap - <C-w>5-<CR>
nnoremap + <C-w>5+<CR>
nnoremap <silent> <leader>> :vertical resize +10<CR>
nnoremap <silent> <leader>< :vertical resize -10<CR>

" NerdTree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeFind<CR>

" Undotree Mapping
nnoremap <leader>u :UndotreeShow<CR>

" Git Mapping
nnoremap <leader>gst :Gstatus<CR>
nnoremap <leader>vd :Gdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

" Terminal Mapping
nnoremap <leader>t :bo sp \| resize 20 \| terminal<CR>
nnoremap <leader>T :vsp \| terminal<CR>
tnoremap <Esc> <C-\><C-n>

" Floatterm
nnoremap <C-b> :FloatermPrev<CR>
nnoremap <C-f> :FloatermNext<CR>
tnoremap <C-b> <C-\><C-n>:FloatermPrev<CR>
tnoremap <C-f> <C-\><C-n>:FloatermNext<CR>
nnoremap <leader>fs :FloatermToggle<CR>
nnoremap <leader>fl :CocList floaterm<CR>
nnoremap <leader>fd :FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating lazydocker<CR>
nnoremap <leader>fg :FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating lazygit<CR>
nnoremap <leader>fr :FloatermNew --autoclose=2 --height=0.75 --width=0.75 --wintype=floating ranger<CR>
nnoremap <leader>ft :FloatermNew --autoclose=2 --height=0.9 --width=0.9 --wintype=floating<CR>

" Markdown Mapping
autocmd FileType markdown nmap <leader>md :MarkdownPreview<CR>

" Quickfix placement
autocmd FileType qf wincmd J

" Connecting and initializing language servers
lua require('telescope').setup{}
lua require('telescope').load_extension('fzy_native')
lua require('nvim-treesitter.configs').setup{ highlight = { enable = true, disable = { } } }
lua require('lspconfig').gopls.setup{on_attach=require'completion'.on_attach}

" Init Statusline
lua require('lualine').setup{options={theme='gruvbox'}}

function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

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
