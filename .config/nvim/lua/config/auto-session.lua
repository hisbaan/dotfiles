require("auto-session").setup {
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/Downloads", "/", "~/.config/nvim" },
    post_restore_cmds = {
        function()
            vim.opt.cmdheight = 1
        end
    }
}

vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
