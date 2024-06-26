return {
    {
        name = "nvim-treesitter",
        dir = "@nvim_treesitter@",
        event = "BufRead",
        config = function()
            -- Add the treesitter parsers installed by Nix to the runtimepath
            vim.opt.runtimepath:append("@treesitter_parsers@")

            local nvim_treesitter_configs = require("nvim-treesitter.configs")
            nvim_treesitter_configs.setup({
                auto_install = false,
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },

    -- Enable tree-sitter highlight for inline code in .nix files
    { name = "hmts.nvim", dir = "@hmts_nvim@", event = "BufRead", version = "*" },
}
