require("liam.remap")
-- set semicolon key to act as colon key in normal mode (non-recursive)
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
vim.cmd([[autocmd BufEnter *.py silent! !poetry env use python]])
