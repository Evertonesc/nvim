local null_ls = require("null-ls")

-- register any number of sources simultaneously
local sources = {
	null_ls.builtins.formatting.prettier,
	null_ls.builtins.diagnostics.write_good,
	null_ls.builtins.code_actions.gitsigns,
	null_ls.builtins.formatting.gofumpt,
	null_ls.builtins.formatting.goimports_reviser,
	null_ls.builtins.formatting.golines,
	null_ls.builtins.formatting.black,
	--null_ls.builtins.diagnostics.mypy,
	--null_ls.builtins.diagnostics.ruff,
}

null_ls.setup({ 
	sources = sources,
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
