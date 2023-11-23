require("nvim-lsp-installer").setup({})

lspconfig = require("lspconfig")
capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = {
	dynamicRegistration = true,
}

local buf_map = vim.api.nvim_buf_set_keymap
local opts = { noremap = true, silent = true }

-- local util = require("lspconfig/util")

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = false,
	virtual_text = {
		-- ■ ● x ▎
		prefix = "●",
	},
})

local signs = { Error = "▎", Warn = "▎", Hint = "▎", Info = "▎" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

on_attach = function(client, bufnr)
	buf_map(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
	buf_map(bufnr, "n", "gI", ":lua vim.lsp.buf.implementation()<CR>", opts)
	buf_map(bufnr, "n", "gr", ":lua require('telescope.builtin').lsp_references()<CR>", opts)
	buf_map(bufnr, "n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
	buf_map(bufnr, "n", "<Leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
	buf_map(bufnr, "n", "<Leader>gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
	buf_map(bufnr, "n", "<Leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
	buf_map(bufnr, "n", "<Leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
	--buf_map(bufnr, "n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)

	if client.server_capabilities.colorProvider then
		require("document-color").buf_attach(bufnr)
	end
end

-- local servers = {
-- 	"clangd",
-- 	"cssls",
-- 	"cssmodules_ls",
-- 	"emmet_ls",
-- 	"gopls",
-- 	"html",
-- 	"pyright",
-- 	"tailwindcss",
-- 	"tsserver",
-- }
-- for _, server in pairs(servers) do
-- 	lspconfig[server].setup({
-- 		capabilities = capabilities,
-- 		on_attach = on_attach,
-- 	})
-- end


-- Go
lspconfig.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "gopls" },
	settings = {
		gopls = {
			analyses = {
				nilness = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
			},
			experimentalPostfixCompletions = true,
			gofumpt = true,
			staticcheck = true,
			usePlaceholders = true,
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			}
		},
	},
})

