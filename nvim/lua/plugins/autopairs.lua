return {
    name = "nvim-autopairs",
    dir = "@nvim_autopairs@",
    event = "InsertEnter",
    config = function()
        local nvim_autopairs = require("nvim-autopairs")
        nvim_autopairs.setup({
            enable_check_bracket_line = false
        })
    end,
}
