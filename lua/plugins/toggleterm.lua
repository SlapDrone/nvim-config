local ok, toggleterm = pcall(require, "toggleterm")
if not ok then
  return
end

toggleterm.setup({
  direction = "float",
})

local Terminal = require("toggleterm.terminal").Terminal
-- Use counts outside LunarVim's defaults (101-103) to avoid clashing with <M-1..3> terminals.
local float_1 = Terminal:new({ direction = "float", name = "float_1", count = 201 })
local float_2 = Terminal:new({ direction = "float", name = "float_2", count = 202 })

local map_opts = { noremap = true, silent = true }
vim.keymap.set("n", "<Leader>a", function() float_1:toggle() end, map_opts)
vim.keymap.set("n", "<Leader>A", function() float_2:toggle() end, map_opts)

-- Leave terminal mode without stealing single <Esc> presses from programs running inside.
-- Use Ctrl-] (easy to reach and rarely needed in terminal apps) to return to Normal mode.
vim.keymap.set("t", "<C-]>", [[<C-\><C-n>]], map_opts)
