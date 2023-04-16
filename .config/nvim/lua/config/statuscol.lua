local builtin = require("statuscol.builtin")

require("statuscol").setup({
    relculright = true,
    bt_ignore = { "nofile" },
    clickhandlers = { -- builtin click handlers
        Lnum                   = false, -- builtin.lnum_click,
        FoldClose              = false, -- builtin.foldclose_click,
        FoldOpen               = false, -- builtin.foldopen_click,
        FoldOther              = false, -- builtin.foldother_click,
        DapBreakpointRejected  = false, -- builtin.toggle_breakpoint,
        DapBreakpoint          = false, -- builtin.toggle_breakpoint,
        DapBreakpointCondition = false, -- builtin.toggle_breakpoint,
        DiagnosticSignError    = false, -- builtin.diagnostic_click,
        DiagnosticSignHint     = false, -- builtin.diagnostic_click,
        DiagnosticSignInfo     = false, -- builtin.diagnostic_click,
        DiagnosticSignWarn     = false, -- builtin.diagnostic_click,
        GitSignsTopdelete      = false, -- builtin.gitsigns_click,
        GitSignsUntracked      = false, -- builtin.gitsigns_click,
        GitSignsAdd            = false, -- builtin.gitsigns_click,
        GitSignsChange         = false, -- builtin.gitsigns_click,
        GitSignsChangedelete   = false, -- builtin.gitsigns_click,
        GitSignsDelete         = false, -- builtin.gitsigns_click,
    }
})
