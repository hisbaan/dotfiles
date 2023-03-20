 vim.api.nvim_create_autocmd(
    "User",
    {
        pattern = "UnceptionEditRequestReceived",
        callback = function()
             vim.cmd([[ToggleTermToggleAll]])
        end
    }
)
