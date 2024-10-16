return {
    -- "nvim-tree/nvim-tree.lua",
    -- config = function()
    --     vim.keymap.set('n', '<leader>e', "<cmd>NvimTreeToggle<CR>", {desc = "Toggle [E]xplorer"})
    --     require("nvim-tree").setup({
    --         hijack_netrw = true,
    --         auto_reload_on_write = true,
    --     })
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more informationj
    },
    config = function()
        vim.keymap.set('n', '<leader>e', "<cmd>Neotree toggle<CR>", { desc = "Toggle [E]xplorer" })
    end

}
