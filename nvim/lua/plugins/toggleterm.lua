return {
    name = "toggleterm.nvim",
    dir = "@toggleterm_nvim@",
    event = "VimEnter",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({
            shade_terminales = false,
        })
    end,
}
