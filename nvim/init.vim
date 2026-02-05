set tabstop=4 softtabstop=4 shiftwidth=4
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

    " LSP
    Plug 'neovim/nvim-lspconfig'
	Plug 'hrsh7th/nvim-compe'
    " Plug 'nvim-lua/completion-nvim'
    " Plug 'tjdevries/nlua.nvim'
    Plug 'tjdevries/lsp_extensions.nvim'

    Plug 'github/copilot.vim'

	" Statusline
	Plug 'hoob3rt/lualine.nvim'
    Plug 'alemidev/vim-combo'

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
    Plug 'nvim-treesitter/nvim-treesitter-context'

    " Nerdtree and plugins
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " https://github.com/tiagofumo/vim-nerdtree-syntax-highlight/issues/53

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
    " Java
    Plug 'mfussenegger/nvim-jdtls'

	" Floating Terminals
	Plug 'voldikss/vim-floaterm'

    " Color Scheme
    Plug 'gruvbox-community/gruvbox'
    Plug 'catppuccin/nvim', {'as': 'catppuccin'}
    Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

" Color and Transparency
" colorscheme gruvbox
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
" let g:gruvbox_invert_selection='0'

" let g:catppuccin_flavour = 'mocha' " latte, frappe, macchiato, mocha
" lua << EOF
" require("catppuccin").setup()
" EOF
" colorscheme catppuccin
" colorscheme spaceduck
" colorscheme dracula
let g:tokyonight_style = "night"
colorscheme tokyonight

hi Normal guibg=none ctermbg=none
hi NormalNC guibg=none ctermbg=none
hi StatusLine guibg=none cterm=none ctermbg=none ctermfg=223 guifg=#ebdbb2
hi StatusLineNC gui=none guibg=none cterm=none ctermbg=none ctermfg=223 guifg=#ebdbb2
hi SignColumn guibg=none cterm=none ctermbg=none
hi CursorLine ctermbg=none guibg=none
hi VertSplit ctermfg=241 ctermbg=none guifg=#665c54 guibg=none
hi LineNr ctermbg=none guibg=none
hi EndOfBuffer ctermbg=none guibg=none

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
lua require('treesitter-context').setup{}

" LSP Configurations
lua << EOF
vim.lsp.set_log_level(1)
local nvim_lsp = require('lspconfig')
local on_attach = require('lspattach')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

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
    on_attach = on_attach
--	on_attach = function(client)
--		client.resolved_capabilities.document_formatting = false
--		on_attach(client)
--	end
}
nvim_lsp["eslint"].setup{
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

require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
	flags = {
		debounce_text_changes = 150,
	}
}

-- local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
-- local workspace_dir = '/Users/a206581293/projects/java-workspaces/' .. project_name

-- nvim_lsp["jdtls"].setup{
--     on_attach = on_attach,
--     cmd = {
--         '/Users/a206581293/.jenv/versions/19/bin/java',
--         '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--         '-Dosgi.bundles.defaultStartLevel=4',
--         '-Declipse.product=org.eclipse.jdt.ls.core.product',
--         '-Dlog.protocol=true',
--         '-Dlog.level=ALL',
--         '-Xms1g',
--         '--add-modules=ALL-SYSTEM',
--         '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--         '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--         '-javaagent:/Users/a206581293/tools/lombok.jar',
--         '-Xbootclasspath/a:/Users/a206581293/tools/lombok.jar',
--
--         '-jar', '/usr/local/Cellar/jdtls/1.15.0/libexec/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
--         '-configuration', '/usr/local/Cellar/jdtls/1.15.0/libexec/config_mac',
--         '-data', workspace_dir,
--     },
--     init_options = {
--         jvm_args = {
--             "-javaagent:/Users/a206581293/tools/lombok.jar"
--         },
--         workspace = workspace_dir
--     }
-- }

-- Init Statusline
local function combo()
  return string.format("%s",vim.g.combo)
end
require('lualine').setup{
    options={theme='tokyonight'},
    sections={lualine_x={combo, 'encoding', 'fileformat', 'filetype'}}
}

EOF

autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll
autocmd BufWritePre *.go lua vim.lsp.buf.format()

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
