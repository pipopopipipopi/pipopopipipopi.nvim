-- ESC*2 nohlsearch
vim.keymap.set("n", "<Esc><Esc>", ":<C-u>set nohlsearch<Return>", { noremap = true, silent = true })

-- jj ESC
vim.keymap.set("i", "jj", "<ESC>", { noremap = true, silent = true })

-- better move
vim.keymap.set("n", "j", "gj", { noremap = true, silent = true })
vim.keymap.set("n", "k", "gk", { noremap = true, silent = true })

-- terminal
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { noremap = true, silent = true })

-- telescope
vim.keymap.set("n", "<leader>p", ":Telescope find_files<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>f", ":Telescope live_grep<CR>", { noremap = true, silent = true })
