return
{
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
        defaults = {},
        spec = {
            {
                mode = { "n", "v" },
                { "<leader><tab>", group = "tabs" },
                { "<leader>c",     group = "code" },
                { "<leader>f",     group = "file/find" },
                { "<leader>g",     group = "git" },
                { "<leader>d",     group = "debug" },
                { "<leader>q",     group = "quit/session" },
                { "<leader>s",     group = "search" },
                { '<leader>J',     group = '[J]ava' },
                { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
                {
                    "<leader>w",
                    group = "windows",
                    proxy = "<c-w>",
                    expand = function()
                        return require("which-key.extras").expand.win()
                    end,
                },
            },
        },
    },
    config = function(_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        if not vim.tbl_isempty(opts.defaults) then
            LazyVim.warn("which-key: opts.defaults is deprecated. Please use opts.spec instead.")
            wk.register(opts.defaults)
        end
    end,
}
