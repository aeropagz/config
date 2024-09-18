return {
    -- Shortened Github Url

    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        -- Make sure to set the color scheme when neovim loads and configures the dracula plugin
        vim.cmd.colorscheme "rose-pine-moon"
    end
}
