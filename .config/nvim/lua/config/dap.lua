local dap = require('dap')

dap.defaults.fallback.external_terminal = {
    command = '/usr/bin/alacritty',
    args = {'-e'},
}

-- vim.fn.sign_define('DapBreakpoint', { text={'B'}, texthl='', linehl='', numhl='' })
-- vim.fn.sign_define('DapBreakpointCondition', { text={'C'}, texthl='', linehl='', numhl='' })
-- vim.fn.sign_define('DapLogPoint', { text={'L'}, texthl='', linehl='', numhl='' })
-- vim.fn.sign_define('DapStopped', { text={'→'}, texthl='', linehl='', numhl='' })
-- vim.fn.sign_define('DapBreakpointRejected', { text={'R'}, texthl='', linehl='', numhl='' })
