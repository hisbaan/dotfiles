-- Setup lspconfig
local lspconfig = require("lspconfig")

-- TODO change these to lua mappings
local function on_attach(client, bufnr)
    -- set up buffer keymaps, etc.
    vim.cmd([[
    nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
    nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
    nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
    nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
    nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
    nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
    nnoremap <silent> <C-n> <cmd>lua vim.diagnostic.goto_next()<CR>
    nnoremap <silent> <C-p> <cmd>lua vim.diagnostic.goto_prev()<CR>
]]   )
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.foldingRange = {
    dynamicRegistration = true,
    lineFoldingOnly = true,
}

require('lua-dev').setup({})
lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace"
            },
            diagnostics = {
                globals = { "vim", "use" },
            },
        },
    },
})

lspconfig.jdtls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.intelephense.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.volar.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.ltex.setup({
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        require("ltex_extra").setup{
            load_langs = { "en-CA", "en-US" },
            init_check = true,
            path = os.getenv("HOME") .. "/.config/nvim/dictionaries",
            log_level = "none",
        }
    end,
    capabilities = capabilities,
    settings = {
        ltex = {
            disabled = { "markdown", "org", "gitcommit" },
            enabled = { "latex", "tex", "bib" },
            language = "en-CA",
            dictionary = { ["en-CA"] = { "Hisbaan", "Noorani" } },
            disabledRules = {
                ["en-CA"] = {
                    "PROFANITY",
                    "EN_QUOTES",
                    "PASSIVE_VOICE",
                    "WHITESPACE_RULE",
                    "TOO_LONG_SENTENCE",
                    -- 'MORFOLOGIK_RULE_EN_CA',
                },
            },
            additionalRules = {
                enablePickyRules = true,
                motherTongue = "en-CA",
            },
            latex = {
                environments = {
                    verbatim = { "ignore" },
                    Verbatim = { "ignore" },
                    minted = { "ignore" },
                    texttt = { "ignore" },
                    forest = { "ignore" },
                },
            },
            markdown = {
                nodes = {
                    CodeBlock = { "ignore" },
                    FencedCodeBlock = { "ignore" },
                    AutoLink = { "dummy" },
                    Code = { "dummy" },
                },
            },
        },
    },
})

lspconfig.bashls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.clangd.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.emmet_ls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          -- ["bem.enabled"] = true,
        },
      },
    }
})

lspconfig.html.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.jsonls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.tsserver.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

vim.o.signcolumn = "yes:1"
