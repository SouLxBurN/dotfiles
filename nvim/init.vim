set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
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
filetype plugin on
filetype indent on

call plug#begin('~/.config/nvim/plugged')
    Plug 'mbbill/undotree'

    Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-compe'
    " Plug 'nvim-lua/completion-nvim'
    " Plug 'tjdevries/nlua.nvim'
    Plug 'tjdevries/lsp_extensions.nvim'

	" Statusline
	Plug 'hoob3rt/lualine.nvim'

	" Pretty Icons uwu
	Plug 'ryanoasis/vim-devicons'
	Plug 'kyazdani42/nvim-web-devicons'

	" Environment files
	Plug 'tpope/vim-dotenv'
	Plug 'tpope/vim-commentary'

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
	Plug 'yuezk/vim-js'
	Plug 'maxmellon/vim-jsx-pretty'
	" typescript syntax
	Plug 'HerringtonDarkholme/yats.vim'
	Plug 'heavenshell/vim-jsdoc', {
	  \ 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescipt.tsx'],
	  \ 'do': 'make install'
	\}
    " Adds extra functionality over rust analyzer
    Plug 'simrat39/rust-tools.nvim'

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
hi CursorLine ctermbg=none guibg=none
hi VertSplit ctermfg=241 ctermbg=none guifg=#665c54 guibg=none

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
" nvim-compe
set completeopt=menuone,noselect
let g:compe = {}
let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true
let g:compe.source.emoji = v:true

" nvim-completion
" set completeopt=menuone,noinsert,noselect
" let g:completeion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Quick edit config files
nnoremap <leader>vrc :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>zsh :e ~/.zshrc<CR>

" Telescope mappings
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pa :lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>ca :lua require('telescope.builtin').lsp_code_actions()<CR>
nnoremap <leader>gr :lua require('telescope.builtin').lsp_references()<CR>
nnoremap <leader>gi :lua require('telescope.builtin').lsp_implementations()<CR>
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
nnoremap <leader>gst :Git<CR>
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
lua require('nvim-treesitter.configs').setup{ indent = { enable = true }, highlight = { enable = true, disable = { } } }

" LSP Configurations
lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
 	buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
	buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	buf_set_keymap('n', '[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	buf_set_keymap('n', ']', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
	buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
	buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- local format_async = function(err, result, ctx, config)
--     if err ~= nil or result == nil then return end
--     if not vim.api.nvim_buf_get_option(ctx.bufnr, "modified") then
--         local view = vim.fn.winsaveview()
--         vim.lsp.util.apply_text_edits(result, ctx.bufnr)
--         vim.fn.winrestview(view)
--         if ctx.bufnr == vim.api.nvim_get_current_buf() then
--             vim.api.nvim_command("noautocmd :update")
--         end
--     end
-- end

-- vim.lsp.handlers["textDocument/formatting"] = format_async

-- _G.lsp_organize_imports = function()
--     local params = {
--         command = "_typescript.organizeImports",
--         arguments = {vim.api.nvim_buf_get_name(0)},
--         title = ""
--     }
--     vim.lsp.buf.execute_command(params)
-- end

-- Typescript/Javascript LSP
nvim_lsp["tsserver"].setup {
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		on_attach(client)
	end
}
nvim_lsp["eslint_d"].setup{
    on_attach = on_attach
}

-- local filetypes = {
-- 	javascript = "eslint",
-- 	typescript = "eslint",
-- 	typescriptreact = "eslint",
-- }

-- local linters = {
-- 	eslint = {
-- 		sourceName = "eslint",
-- 		command = "eslint_d",
-- 		rootPatterns = {".eslintrc.js", "package.json"},
-- 		debounce = 100,
-- 		args = {"--stdin", "--stdin-filename", "%filepath", "--format", "json"},
-- 		parseJson = {
-- 			errorsRoot = "[0].messages",
-- 			line = "line",
-- 			column = "column",
-- 			endLine = "endLine",
-- 			endColumn = "endColumn",
-- 			message = "${message} [${ruleId}]",
-- 			security = "severity"
-- 		},
-- 		securities = {[2] = "error", [1] = "warning"}
-- 	}
-- }

-- local formatters = {
-- 	prettier = {command = "prettier", args = {"--stdin-filepath", "%filepath"}}
-- }

-- local formatFiletypes = {
-- 	javascript = "prettier",
-- 	typescript = "prettier",
-- 	typescriptreact = "prettier"
-- }

-- Eslint LSP
-- nvim_lsp["diagnosticls"].setup {
-- 	on_attach = on_attach,
-- 	filetypes = vim.tbl_keys(filetypes),
-- 	init_options = {
-- 		filetypes = filetypes,
-- 		linters = linters,
-- 		formatters = formatters,
-- 		formatFiletypes = formatFiletypes
-- 	}
-- }

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
nvim_lsp["jsonls"].setup {
    on_attach = on_attach,
    capabilities = capabilities
}

-- Html/CSS LSP
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
nvim_lsp["html"].setup {
	on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "html-languageserver", "--stdio" }
}
nvim_lsp["cssls"].setup {
	on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "css-languageserver", "--stdio" }
}

-- Golang LSP
nvim_lsp["gopls"].setup {
	on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	}
}

-- Rust LSP
require('rust-tools').setup({})
nvim_lsp["rust_analyzer"].setup {
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
}

-- Init Statusline
require('lualine').setup{options={theme='gruvbox'}}

EOF

autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()

" I Blame ThePrimeagen... This fixes something...
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup SouLxBurN
	autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
