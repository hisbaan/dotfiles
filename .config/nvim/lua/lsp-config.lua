-- Keybindings
vim.cmd([[
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
]])
-- vim.api.nvim_set_keymap("n", "gd", "v:vim.lsp.buf.definition()", { noremap = false, expr = true })
-- vim.api.nvim_set_keymap("n", "gD", "v:vim.lsp.buf.declaration()", { noremap = false, expr = true })
-- vim.api.nvim_set_keymap("n", "gr", "v:vim.lsp.buf.references()", { noremap = false, expr = true })
-- vim.api.nvim_set_keymap("n", "gi", "v:vim.lsp.buf.implementation()", { noremap = false, expr = true })
-- vim.api.nvim_set_keymap("n", "K", "v:vim.lsp.buf.hover()", { noremap = false, expr = true })
-- vim.api.nvim_set_keymap("n", "<C-k>", "v:vim.lsp.buf.signature_help()", { noremap = false, expr = true })
-- vim.api.nvim_set_keymap("n", "<C-p>", "v:vim.lsp.diagnostic.goto_prev()()", { noremap = false, expr = true })
-- vim.api.nvim_set_keymap("n", "<C-n>", "v:vim.lsp.diagnostic.goto_next()", { noremap = false, expr = true })

-- Auto-format on save
-- vim.cmd([[
-- autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
-- autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
-- autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
-- ]])


-- Setup nvim-cmp.
vim.o.completeopt = "menuone,noselect"
local cmp = require'cmp'

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = ""
}

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end
	},
	mapping = {
		['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
		['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
		['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
		['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		['<C-e>'] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'ultisnips' },
	},
		{ { name = 'buffer' }, 
		})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
			{ name = 'cmdline' }
		})
})

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Language servers
-- Installation:
-- 	- pacman -S bash-language-server clang pyright
-- 	- paru -S vscode-langservers-extracted java-language-server kotlin-language-server vim-language-server
require('lspconfig')['bashls'].setup{ capabilities = capabilities }
require('lspconfig')['clangd'].setup{ capabilities = capabilities }
require('lspconfig')['cssls'].setup{ capabilities = capabilities }
require('lspconfig')['eslint'].setup{ capabilities = capabilities }
require('lspconfig')['html'].setup{ capabilities = capabilities }
require('lspconfig')['java_language_server'].setup{ capabilities = capabilities }
require('lspconfig')['jsonls'].setup {
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
			end
		}
	},
	capabilities = capabilities,
}
require('lspconfig')['kotlin_language_server'].setup{ capabilities = capabilities }
require('lspconfig')['pyright'].setup{ capabilities = capabilities }
require('lspconfig')['vimls'].setup{ capabilities = capabilities }
