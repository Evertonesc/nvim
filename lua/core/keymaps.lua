local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

vim.wo.number = true
vim.wo.relativenumber = true

map("n", "<Leader>sf", ":Telescope find_files<CR>", opts)
map("n", "<Leader>fg", ":Telescope live_grep<CR>", opts)
map("n", "<Leader>fb", ":Telescope buffers<CR>", opts)
map("n", "<Leader>fh", ":Telescope help_tags<CR>", opts)


map("n", "<C-n>", ":NvimTreeToggle<CR>", opts)
map("n", "<Leader>r", ":NvimTreeRefresh<CR>", opts)


map("n", "<Leader>gd", ":Gitsigns diffthis<CR>", opts)
map("n", "<Leader>gb", ":Gitsigns toggle_current_line_blame<CR>", opts)

map("n", "<Leader>ab", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<Leader>ar", ":lua require'dap'.repl.open()<CR>", opts)
map("n", "<F10>", ":lua require'dap'.terminate()<CR>", opts)
map("n", "<F9>", ":lua require'dap'.continue()<CR>", opts)
map("n", "<F8>", ":lua require'dap'.step_over()<CR>", opts)
map("n", "<F7>", ":lua require'dap'.step_into()<CR>", opts)
map("n", "<F6>", ":lua require'dap'.step_out()<CR>", opts)
map("n", "<F4>", ":lua require'dapui'.toggle()<CR>", opts)
