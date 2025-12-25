-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  })
end
vim.opt.rtp:prepend(lazypath)
require("vim-options")
require("lazy").setup("plugins")

