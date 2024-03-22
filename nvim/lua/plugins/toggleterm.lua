return {
    name = "toggleterm.nvim",
    dir = "@toggleterm_nvim@",
    config = function()
        local toggleterm = require("toggleterm")
        toggleterm.setup({
            shade_terminales = false,
        })
    end,
}
