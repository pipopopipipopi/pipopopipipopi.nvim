-- leader
vim.g.mapleader = " "

vim.loader.enable()

local lazypath = "@lazy_nvim@"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    defaults = { lazy = true },
    spec = "plugins",
})

require("config.option")
require("config.keymaps")
require("config.colorscheme")
