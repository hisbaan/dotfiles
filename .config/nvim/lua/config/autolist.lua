require('autolist').setup({
	enabled = true,
	create_enter_mapping = true,
	new_entry_on_o = true,
	list_cap = 50,
	colon = {
		indent_raw = true,
		indent = true,
		preferred = "-"
	},
	invert = {
		mapping = "<c-r>",
		normal_mapping = "",
		toggles_checkbox = true,
		ul_marker = "-",
		ol_incrementable = "1",
		ol_delim = ".",
	},
	lists = {
		preloaded = {
			generic = {
				"[-+]", -- in place of unordered
				"digit",
				"ascii",
			},
			latex = {
				"latex_item",
			},
		},
		filetypes = {
			generic = {
				"markdown",
                "org",
				"text",
			},
			latex = {
				-- "tex",
				-- "plaintex",
			},
		},
	},
	recal_hooks = {
		"invert",
		"new",
	},
	checkbox = {
		left = "%[",
		right = "%]",
		fill = "X",
	},
    insert_mappings = {
		invert = { "<c-r>+[catch]" },
		new = { "<CR>" },
		tab = {},
		detab = {},
		recal = {},
		indent = {
			"",
			"",
		},
	},
	normal_mappings = {
		new = {
			"o",
			"O+(true)",
		},
		tab = {},
		detab = {},
		recal = { "dd" },
	},
})
