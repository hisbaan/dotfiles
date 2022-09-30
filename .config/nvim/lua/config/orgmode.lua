-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.org = {
--   install_info = {
--     url = 'https://github.com/milisims/tree-sitter-org',
--     revision = 'f110024d539e676f25b72b7c80b0fd43c34264ef',
--     files = {'src/parser.c', 'src/scanner.cc'},
--   },
--   filetype = 'org',
-- }

require('orgmode').setup_ts_grammar()

require 'nvim-treesitter.configs'.setup {
    -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
    highlight = {
        enable = false,
        -- disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
        additional_vim_regex_highlighting = { 'org' }, -- Required since TS highlighter doesn't support all syntax features (conceal)
    },
    ensure_installed = { 'org' }, -- Or run :TSUpdate org
}

require('orgmode').setup({
    org_agenda_files = { '~/Documents/org/*' },
    org_default_notes_file = '~/Documents/org/refile.org',
    mappings = {
        org = {
            org_meta_return = { '<Leader><CR>', '<C-CR>' }
        }
    }
})
