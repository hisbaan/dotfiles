vim.g.termguicolors = true

-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).
require("nvim-tree").setup {
    auto_reload_on_write = true,
    create_in_closed_folder = false,
    disable_netrw = true,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    open_on_setup = false,
    ignore_buffer_on_setup = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = true,
    reload_on_bufenter = true,
    respect_buf_cwd = true,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = false,
        update_cwd = true,
        ignore_list = { ".git", "node_modules", ".cache" }
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
    },
    trash = {
        cmd = "trash-put",
        require_confirm = true,
    },
    view = {
        adaptive_size = true,
        width = '15%',
        number = false,
        relativenumber = false,
        side = "left",
        signcolumn = "yes",
        mappings = {
            custom_only = false,
            list = {
                -- custom user mappings go here
            },
        },
    },
    renderer = {
        add_trailing = true,
        group_empty = false,
        highlight_git = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
    },
    -- icons = {
    --     webdev_colors = true,
    --     git_placement = "before",
    --     padding = " ",
    --     symlink_arrow = " ➛ ",
    --     show = {
    --         file = true,
    --         folder = true,
    --         folder_arrow = true,
    --         git = true,
    --     },
    --     glyphs = {
    --         default = "",
    --         symlink = "",
    --         folder = {
    --             arrow_closed = "",
    --             arrow_open = "",
    --             default = "",
    --             open = "",
    --             empty = "",
    --             empty_open = "",
    --             symlink = "",
    --             symlink_open = "",
    --         },
    --         git = {
    --             unstaged = "",
    --             staged = "S",
    --             unmerged = "",
    --             renamed = "➜",
    --             deleted = "",
    --             untracked = "U",
    --             ignored = "◌"
    --         },
    --     },
    --     special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "README.org", "readme.org" },
    -- },
    git = {
        enable = true,
        ignore = true,
        timeout = 400
    },
}
