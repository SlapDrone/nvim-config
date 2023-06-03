require("liam.remap")
print("init.lua inner")
-- set semicolon key to act as colon key in normal mode (non-recursive)
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
