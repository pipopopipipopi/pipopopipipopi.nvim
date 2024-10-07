-- Character code
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Scroll
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Row
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = true
vim.opt.cursorline = false

-- Tab, Indent
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.api.nvim_create_autocmd("FileType", {
  pattern = "nix",
  callback = function()
    vim.opt.tabstop = 2
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
  end
})

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true

-- UI
vim.opt.cmdheight = 0
vim.opt.showtabline = 2
vim.opt.laststatus = 3
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.conceallevel = 0
vim.opt.pumheight = 10
vim.opt.showmode = false
vim.opt.wrap = true
vim.opt.wildoptions = "pum"
vim.opt.winblend = 0
vim.opt.pumblend = 0
vim.opt.background = "dark"

-- File
vim.opt.backup = false
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.undofile = true
vim.opt.writebackup = false

-- Misc
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.timeoutlen = 300
vim.opt.shell = "fish"
vim.opt.virtualedit = "onemore"
