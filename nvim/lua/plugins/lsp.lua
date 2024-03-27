return {
	{
		name = "nvim-lspconfig",
		dir = "@nvim_lspconfig@",
		event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lspconfig = require("lspconfig")
            -- Lua
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})
			-- Nix
			lspconfig.nil_ls.setup({})
        end,
	},
}
