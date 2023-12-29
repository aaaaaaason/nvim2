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

require("lazy").setup({
  { "aaaaaaason/vscode.nvim" },
  { 
    "ggandor/leap.nvim", 
    config = function()
        require('leap').add_default_mappings() 
    end 
  },
  {
    "nvim-tree/nvim-tree.lua",
    cond = not vim.g.vscode,
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("plugin/nvim-tree")
    end,
  },
  { 
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require("plugin/telescope")
    end,
  }
})

require "basic"
