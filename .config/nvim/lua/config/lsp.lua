-- Keybindings (go to definition, etc.)
vim.cmd([[
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.diagnostic.goto_prev()<CR>
]])

-- Setup nvim-cmp.
vim.o.completeopt = "menuone,noselect"

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup lsp servers.
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
lsp_installer.on_server_ready(function(server)
	local opts = {}
	opts.capabilities = capabilities

	-- Ignore certain diagnostics in lua
	if server.name == "sumneko_lua" then
		opts.settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim', 'use' }
				}
			}
		}
	end
    if server.name == "ltex" then
        opts.settings = {
            ltex = {
                enabled = { 'latex', 'tex', 'bib', 'markdown', 'org' },
                language = 'en-CA',
                disabledRules = { ['en-CA'] = {
                    'PROFANITY',
                    'EN_QUOTES',
                    'PASSIVE_VOICE',
                    'WHITESPACE_RULE',
                    'TOO_LONG_SENTENCE',
                } },
                dictionary = {
                    ['en-CA'] = {
                        'TODO',
                        'Hisbaan',
                        'Noorani',
                        'Bo',
                        'Deidra',
                        'mux',
                        'circ',
                        'Weise',
                        'Akshat',
                        'Naik',
                        'Organoids',
                        'Fubini',
                        'Cavalieri',
                        'logisim',
                        'combinational',
                    }
                },
                additionalRules = {
                    enablePickyRules = true,
                    motherTongue = 'en-CA',
                },
                latex = {
                    environments = {
                        verbatim = { 'ignore' },
                        Verbatim = { 'ignore' },
                        minted = { 'ignore' },
                        texttt = { 'ignore' },
                        forest = { 'ignore' },
                    },
                },
                markdown = {
                    nodes = {
                        CodeBlock = { 'ignore' },
                        FencedCodeBlock = { 'ignore' },
                        AutoLink = { 'dummy' },
                        Code = { 'dummy' },
                    },
                },
            }
        }
    end

    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

vim.o.signcolumn="yes:1"
