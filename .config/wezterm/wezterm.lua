local wezterm = require('wezterm')
local act = wezterm.action

return {
    -- fonts
    font = wezterm.font('Meslo LGS Nerd Font Mono'),
    font_size = 11.0,

    -- key bindings
    use_dead_keys = false,
    keys = {
        {
            key = 'j',
            mods = 'CTRL|SHIFT',
            action = act.ScrollByLine(1),
        },
        {
            key = 'k',
            mods = 'CTRL|SHIFT',
            action = act.ScrollByLine(-1),
        },
        {
            key = 'h',
            mods = 'SHIFT|CTRL',
            action = wezterm.action.Search { Regex = '[a-f0-9]{6,}' },
        },
    },
    adjust_window_size_when_changing_font_size = false,

    -- functionality
    scrollback_lines = 10000,
    window_close_confirmation = "NeverPrompt",

    -- aesthetics
    hide_tab_bar_if_only_one_tab = true,
    colors = require('colors'),
    underline_thickness = '0.75pt',
    window_padding = {
        left = '1cell',
        right = '1cell',
        top = '0.5cell',
        bottom = '0.5cell',
    },
    -- enable_kitty_graphics = true,
}
