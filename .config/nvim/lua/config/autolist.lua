local autolist = require("autolist")

local default_config = {
	enabled = true,
	list_cap = 50,
	colon = {
		indent_raw = true,
		indent = true,
		preferred = "-",
	},
	invert = {
		indent = false,
		toggles_checkbox = true,
		ul_marker = "-",
		ol_incrementable = "1",
		ol_delim = ".",
	},
	lists = {
		markdown = {
			"unordered",
			"digit",
			"ascii",
			"roman",
		},
		text = {
			"unordered",
			"digit",
			"ascii",
			"roman",
		},
		tex = { "latex_item" },
		plaintex = { "latex_item" },
	},
	list_patterns = {
		unordered = "[-+*]", -- - + *
		digit = "%d+[.)]", -- 1. 2. 3.
		ascii = "%a[.)]", -- a) b) c)
		roman = "%u*[.)]", -- I. II. III.
		latex_item = "\\item",
	},
	checkbox = {
		left = "%[",
		right = "%]",
		fill = "x",
	},
}

autolist.setup({
    colon = {
        indent_raw = false,
        indent = false,
        preferred = "-",
    },
    lists = {
        preloaded = {
            generic = {
                "unordered",
                "digit",
                "ascii",
            },
        },
        filetypes = {
            generic = {
                "org",
                "markdown",
                "text",
            },
            latex = {},
        },
    },
    list_patterns = {
        unordered = "[-+]",
    },
    checkbox = {
        left = "%[",
        right = "%] ",
        fill = "X",
    },
})

autolist.create_mapping_hook("i", "<CR>", autolist.new)
autolist.create_mapping_hook("n", "dd", autolist.force_recalculate)
autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
vim.api.nvim_create_autocmd("TextChanged", {
    pattern = "*",
    callback = function()
        vim.cmd.normal({autolist.force_recalculate(nil, nil), bang = false})
    end
})

