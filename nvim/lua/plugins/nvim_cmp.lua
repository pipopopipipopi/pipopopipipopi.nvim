return {
    name = "nvim-cmp",
    dir = "@nvim_cmp@",
    event = "InsertEnter",
    config = function()
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        cmp.setup({
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol_text",
                }),
            },
            snippet = {
                expand = function(args)
                  require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<C-l>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' }, -- For luasnip users.
            }, {
              { name = 'buffer' },
            })
        })

        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'git' },
            }, {
                { name = 'buffer' },
            })
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })
    end,
    dependencies = {
        { name = "cmp-nvim-lsp", dir = "@cmp_nvim_lsp@" },
        { name = "cmp-buffer", dir = "@cmp_buffer@" },
        { name = "cmp-cmdline", dir = "@cmp_cmdline@" },
        { name = "cmp-path", dir = "@cmp_path@" },
        { name = "cmp_luasnip", dir = "@cmp_luasnip@" },
        {
            name = "lspkind.nvim",
            dir = "@lspkind_nvim@",
            config = function()
                local lspkind = require("lspkind")
                lspkind.init({
                    symbol_map = {
                        Text = "󰉿",
                        Method = "󰆧",
                        Function = "󰊕",
                        Constructor = "",
                        Field = "󰜢",
                        Variable = "󰀫",
                        Class = "󰠱",
                        Interface = "",
                        Module = "",
                        Property = "󰜢",
                        Unit = "󰑭",
                        Value = "󰎠",
                        Enum = "",
                        Keyword = "󰌋",
                        Snippet = "",
                        Color = "󰏘",
                        File = "󰈙",
                        Reference = "󰈇",
                        Folder = "󰉋",
                        EnumMember = "",
                        Constant = "󰏿",
                        Struct = "󰙅",
                        Event = "",
                        Operator = "󰆕",
                        TypeParameter = "",
                    },
                })
            end,
        }
    },
}
