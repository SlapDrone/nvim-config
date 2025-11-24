local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  return
end

toggleterm.setup({
  direction = "float",
})

local Terminal = require("toggleterm.terminal").Terminal
local float_1 = Terminal:new({ direction = "float", name = "float_1", count = 101 })
local float_2 = Terminal:new({ direction = "float", name = "float_2", count = 102 })

local map_opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>a", function() float_1:toggle() end, map_opts)
vim.keymap.set("n", "<Leader>A", function() float_2:toggle() end, map_opts)
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], map_opts) -- quick escape from terminal mode
