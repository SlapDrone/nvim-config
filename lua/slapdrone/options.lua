-- https://www.youtube.com/watch?v=BGleksgsiD8 "neovim to lunarvim justin"
vim.opt.relativenumber = true
vim.opt.timeoutlen = 333
vim.opt.showcmd = true
vim.opt.clipboard = "unnamedplus"
vim.opt_local.conceallevel = 2
lvim.transparent_window = true
lvim.builtin.treesitter.ensure_installed = true
-- Keymaps
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.g.maplocalleader = '\\'
-- normal
keymap('n', ';', ':', {noremap = true})
keymap('n', ':', ';', {noremap = true})
keymap('n', "<LocalLeader>b", ":BufferLinePick<CR>", opts)
keymap('n', "<LocalLeader>w", ":w<CR>", opts)
keymap('n', "<LocalLeader>c", ":BufferKill<cr>", opts)
keymap('n', "<LocalLeader>s", ":%s///g", opts)
keymap('n', "<LocalLeader>j", ":lua require('trevj').format_at_cursor()<CR>", opts)
keymap("n", "<S-h>", ":bprev<CR>", opts)
keymap("n", "<S-l>", ":bnext<CR>", opts)

keymap('n', '<Leader>o', 'o<Esc>0"_D', {noremap = true, silent = true})
keymap('n', '<Leader>O', 'O<Esc>0"_D', {noremap = true, silent = true})

keymap('n', '<Leader>m', ':MarkdownPreview<CR>', opts)

pcall(function()
  require("colorizer").setup(
    { "css", "scss", "html", "lua", "json", "toml", "yaml", },
    {
      RGB = true,
      RRGGBB = true,
      RRGGBBAA = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
    }
  )
end)

pcall(function()
  require("Comment").setup()
end)

pcall(function()
  require("scope").setup({
    restore_state = true,
  })
end)

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "yamlfmt", filetypes = { "yaml"}} -- also black
}

local which_key = lvim.builtin.which_key
which_key.setup = {
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20
    },
  }
}
which_key.mappings["w"]  = {
  name = "Window",
  c = { "<cmd>close<CR>", "Close Window"},
}
which_key.mappings["t"] = {
  name = "Tabs",
  n = { "<cmd>tabnew<CR>", "New Tab" },
  c = { "<cmd>tabclose<cr>", "Close Tab"},
}
