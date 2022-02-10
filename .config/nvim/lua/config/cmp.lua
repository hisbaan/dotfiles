local cmp = require('cmp')
local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "ﰠ",
	Variable = "",
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
	Struct = "פּ",
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
				ultisnips = "[UltiSnips]",
                luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end
	},
	mapping = {
		['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
        -- TODO work in progress
        -- - after using CMP to complete something that is a snippet, it then triggers ultisnips completion on the next TAB. Try mapping a global variable to ignore ultisinps bindings after a complete tab until a space is pressed or something like that? I don't know how to set it back but it should be ignored once someone starts using cmp and reset once it becomes invisible. Is there a way to watch the visibliity of cmp?
        -- ["<Tab>"] = cmp.mapping(function(fallback)
        --     if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
        --         vim.fn["UltiSnips#ExpandSnippet"]()
        --     elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
        --         vim.fn["UltiSnips#"]()
        --     elseif cmp.visible() then
        --         cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
        --     else
        --         fallback()
        --     end
        -- end),
        -- ["<S-Tab>"] = cmp.mapping(function(fallback)
        --     if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        --         vim.fn["UltiSnips#JumpForwards"]()
        --     elseif cmp.visible() then
        --         cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
        --     else
        --         fallback()
        --     end
        -- end),
	},
	-- mapping = {
	-- 	['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
	-- 	['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
	-- 	['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
	-- 	['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
	-- 	['<C-e>'] = cmp.mapping({
	-- 		i = cmp.mapping.abort(),
	-- 		c = cmp.mapping.close(),
	-- 	}),
	-- 	['<CR>'] = cmp.mapping.confirm({ select = true }),
	-- },
    documentation = {
        -- border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
    },
	sources = cmp.config.sources(
		{
			{ name = 'nvim_lsp' },
			{ name = 'ultisnips' },
			{ name = 'luasnip' },
			{ name = 'orgmode' },
			{ name = 'path' },
		},
		{
			{ name = 'buffer' },
		}
    )
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' },
		{ name = 'path' },
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
