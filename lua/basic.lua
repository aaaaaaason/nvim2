local opt = vim.opt

opt.number = true
opt.compatible = false
opt.hlsearch = true
opt.incsearch = true
opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.autoindent = true
opt.swapfile = false
opt.cursorline = true
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.completeopt = { "menuone", "noselect" }

local keymap = vim.keymap
local kopt = { silent = true, noremap = true }

if vim.g.vscode then
  -- VSCode extension
  keymap.set("n", "u", ":<C-u>call VSCodeNotify('undo')<CR>", kopt)
  keymap.set("n", "<C-r>", ":<C-u>call VSCodeNotify('redo')<CR>", kopt)
else
  -- Better window navigation
  keymap.set("n", "<C-h>", "<C-w>h", kopt)
  keymap.set("n", "<C-j>", "<C-w>j", kopt)
  keymap.set("n", "<C-k>", "<C-w>k", kopt)
  keymap.set("n", "<C-l>", "<C-w>l", kopt)
  
  -- Resize with arrows
  keymap.set("n", "<C-Up>", ":resize -2<CR>", kopt)
  keymap.set("n", "<C-Down>", ":resize +2<CR>", kopt)
  keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", kopt)
  keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", kopt)
  
  -- Press jk fast to exit insert mode
  keymap.set("i", "jk", "<ESC>", kopt)
  keymap.set("i", "kj", "<ESC>", kopt)
  
  vim.cmd("colorscheme vscode")
end