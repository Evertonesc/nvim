local dap = require('dap')
local dapui = require('dapui')

vim.fn.sign_define("DapBreakpoint", { text = "⬢", texthl = "Red", linehl = "", numhl = "Red" })
vim.fn.sign_define("DapStopped", { text = "▶", texthl = "Green", linehl = "ColorColumn", numhl = "Green" })


dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close

return dap
