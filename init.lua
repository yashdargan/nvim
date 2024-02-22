vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop =2")
vim.cmd("set shiftwidth=2")
--lazy git 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
--plugins
local plugins = {
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },

  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},

  }
local opts ={}

require("lazy").setup(plugins, opts)

local configs = require("nvim-treesitter.configs")
--treesitter
configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html","python" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
})
--telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.live_grep, {})
vim.keymap.set('n', '<C-b>', builtin.buffers, {})
vim.keymap.set('n', '<C-h>', builtin.help_tags, {})
