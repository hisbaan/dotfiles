vim.cmd [[packadd packer.nvim]]

local packer = require('packer')
packer.init {
    enable = true,
    threshold = 0,
}

local use = packer.use
packer.reset()

packer.startup({function()
    -- put plugins here
end})

-- put plugin config here
