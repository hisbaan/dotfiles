local wezterm = require('wezterm')
local act = wezterm.action

return {
    -- fonts
    font = wezterm.font('Meslo LGS Nerd Font Mono'),
    font_size = 14.0,
    warn_about_missing_glyphs = false,

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
            key = 'm',
            mods = 'SUPER',
            action = wezterm.action.DisableDefaultAssignment,
        },
    },
    adjust_window_size_when_changing_font_size = false,

    -- functionality
    scrollback_lines = 10000,
    window_close_confirmation = "NeverPrompt",
    check_for_updates = false,
    max_fps = 120,

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
    enable_kitty_graphics = true,
    audible_bell="Disabled",
    default_cursor_style = "SteadyBlock",
    cursor_blink_rate = 0,
}
