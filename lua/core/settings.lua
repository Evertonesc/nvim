local set = vim.opt
local cmd = vim.api.nvim_command

cmd("language en_US")

if vim.fn.has("termguicolors") then
	set.termguicolors = true
end


vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*.go',
	callback = function()
		vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
	end
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("silent! lua require('telescope.builtin').find_files()")
	end,
})

