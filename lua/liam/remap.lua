vim.api.nvim_set_keymap('n', ';', ':', {noremap = true})
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.api.nvim_set_keymap('n', '<leader>hs', ':split<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>vs', ':vsplit<CR>', {noremap = true})
