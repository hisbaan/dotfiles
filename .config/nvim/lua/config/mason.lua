require("mason").setup {
    ui = {
        border = "none", -- none, rounded, single, double, etc.
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
}
require("mason-lspconfig").setup {
    ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "emmet_ls",
        "html",
        "jdtls",
        "jsonls",
        "ltex",
        "intelephense",
        "rust_analyzer",
        "sumneko_lua",
        "tsserver",
        "volar",
    }
}
