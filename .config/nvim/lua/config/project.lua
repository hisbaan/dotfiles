require("project_nvim").setup {
    patterns = { ".git", ".svn", "Makefile", "package.json" },
    detection_methods = { "lsp", "pattern" },
}
