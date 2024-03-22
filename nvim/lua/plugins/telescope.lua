return {
    name = "telescope.nvim",
    dir = "@telescope_nvim@",
    event = "VimEnter",
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                vimgrep_arguments = {
                    "rg",
                    "-uu",
                },
            },
        })
    end,
    dependencies = {
        { name = "plenary.nvim", dir = "@plenary_nvim@" },
        { name = "telescope-file-browser.nvim", dir = "@telescope_file_browser_nvim@" },
    },
}
