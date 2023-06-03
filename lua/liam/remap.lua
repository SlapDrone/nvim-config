print("remap")
vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
