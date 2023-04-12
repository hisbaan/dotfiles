require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
        mocha = {
            -- rosewater = "#F5E0DC",
            -- flamingo = "#F2CDCD",
            -- mauve = "#DDB6F2",
            -- pink = "#F5C2E7",
            -- red = "#F28FAD",
            -- maroon = "#E8A2AF",
            -- peach = "#F8BD96",
            -- yellow = "#FAE3B0",
            -- green = "#ABE9B3",
            -- blue = "#96CDFB",
            -- sky = "#89DCEB",
            -- teal = "#B5E8E0",
            -- lavender = "#C9CBFF",

            -- warmer surface
            text = "#D9E0EE",
            subtext1 = "#BAC2DE",
            subtext0 = "#A6ADC8",
            overlay2 = "#C3BAC6",
            overlay1 = "#988BA2",
            overlay0 = "#6E6C7E",
            surface2 = "#6E6C7E",
            surface1 = "#575268",
            surface0 = "#302D41",

            -- mantle = "#1A1826",
            mantle = "#1F1D2E",
            crust = "#161320",
            base = "#191724", -- darker base
        },
    },
    highlight_overrides = {
        mocha = function(cp)
            return {
                -- General
                FloatBorder = { fg = cp.overlay0 },

                -- Toggle term
                ToggleTerm1FloatBorder = { fg = cp.overlay0 },

                -- Telescope
                TelescopeBorder = { fg = cp.overlay0 },
                TelescopeSelection = { bg = cp.surface0 },
                TelescopeMatching = { fg = cp.flamingo },
                TelescopeSelectionCaret = { bg = cp.surface0 },

                -- Folds
                UfoFoldedBg = { bg = cp.mantle },
                Folded = { bg = cp.mantle },
                Visual = { bg = cp.surface0 },

                -- org-bullets
                OrgBulletsDash = { fg = cp.flamingo, link = nil },
                OrgBulletsPlus = { fg = cp.flamingo, link = nil },
                OrgBulletsStar = { fg = cp.flamingo, link = nil },
            }
        end,
    },
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
