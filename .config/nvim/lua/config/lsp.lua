-- Setup lspconfig
local lspconfig = require("lspconfig")

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

lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim", "use" },
            },
        },
    },
})

lspconfig.jdtls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    --[[ settings = { ]]
    --[[     java = { ]]
    --[[         import = { ]]
    --[[             gradle = { ]]
    --[[                 wrapper = { ]]
    --[[                     enabled = false, ]]
    --[[                 }, ]]
    --[[             }, ]]
    --[[         }, ]]
    --[[     }, ]]
    --[[ }, ]]
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
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ltex = {
            disabled = { "markdown", "org", "gitcommit" },
            enabled = { "latex", "tex", "bib" },
            language = "en-CA",
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
            dictionary = {
                ["en-CA"] = {
                    "TODO",
                    "Hisbaan",
                    "Noorani",
                    "Bo",
                    "Deidra",
                    "mux",
                    "circ",
                    "Weise",
                    "Akshat",
                    "Naik",
                    "Organoids",
                    "Fubini",
                    "Cavalieri",
                    "logisim",
                    "combinational",
                    "Laposa",
                    "Pelley",
                    "Medicago",
                    "Covifenz",
                    "deque",
                    "parametrization",
                    "irrotational",
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
