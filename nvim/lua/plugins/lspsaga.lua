return {
    name = "lspsaga.nvim",
    dir = "@lspsaga_nvim@",
    event = "BufRead",
    config = function()
        local lspsaga = require("lspsaga")
        lspsaga.setup({
            lightbulb = {
                enable = false,
            },
        })
    end,
}
