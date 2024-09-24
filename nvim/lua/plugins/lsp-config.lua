return {
    {
        "williamboman/mason.nvim",
        config = function()
            -- setup mason with default properties
            require("mason").setup()
        end,
    },
    -- mason lsp config utilizes mason to automatically ensure lsp servers you want installed are installed
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            -- ensure that we have lua language server, typescript launguage server, java language server, and java test language server are installed
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "jdtls", "yamlls", "volar", "gopls" },
            })
        end,
    },
    -- mason nvim dap utilizes mason to automatically ensure debug adapters you want installed are installed, mason-lspconfig will not automatically install debug adapters for us
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            -- ensure the java debug adapter is installed
            require("mason-nvim-dap").setup({
                ensure_installed = { "java-debug-adapter", "java-test" },
            })
        end,
    },
    -- utility plugin for configuring the java language server for us
    {
        "mfussenegger/nvim-jdtls",
        dependencies = {
            "mfussenegger/nvim-dap",
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            -- get access to the lspconfig plugins functions
            local lspconfig = require("lspconfig")

            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            lspconfig.gopls.setup({
                capabilities = capabilities,
                gofumpt = true
            })

            -- setup the lua language server
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            -- setup the typescript language server
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.yamlls.setup({
                on_new_config = function(new_config)
                    new_config.settings.yaml.schemas = vim.tbl_deep_extend(
                        "force",
                        new_config.settings.yaml.schemas or {},
                        require("schemastore").yaml.schemas()
                    )
                end,
                capabilities = capabilities,
                settings = {
                    yaml = {
                        format = {
                            enable = true,
                        },
                        validate = true,
                        schemaStore = {
                            -- Must disable built-in schemaStore support to use
                            -- schemas from SchemaStore.nvim plugin
                            enable = false,
                            -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                            url = "",
                        },
                    },
                },
            })

            lspconfig.clangd.setup({
                cmd = {
                    "/Users/klaaspelzer/.espressif/tools/xtensa-clang/14.0.0-38679f0333/xtensa-esp32-elf-clang/bin/clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--header-insertion=iwyu",
                    "--completion-style=detailed",
                    "--function-arg-placeholders",
                    "--fallback-style=llvm",
                },
                capabilities = capabilities,
            })

            lspconfig.volar.setup({
                filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
                init_options = {
                    vue = {
                        hybridMode = false,
                    },
                },
            })

            -- Set vim motion for <Space> + c + h to show code documentation about the code the cursor is currently over if available
            vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
            -- Set vim motion for <Space> + c + d to go where the code/variable under the cursor was defined
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
            -- Set vim motion for <Space> + c + a for display code action suggestions for code diagnostics in both normal and visual mode
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
            -- Set vim motion for <Space> + c + r to display references to the code under the cursor
            vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "[G]oto [R]eferences" })
            -- Set vim motion for <Space> + c + i to display implementations to the code under the cursor
            vim.keymap.set(
                "n",
                "<leader>ci",
                require("telescope.builtin").lsp_implementations,
                { desc = "[C]ode Goto [I]mplementations" }
            )
            -- Set a vim motion for <Space> + c + <Shift>R to smartly rename the code under the cursor
            vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
            -- Set a vim motion for <Space> + c + <Shift>D to go to where the code/object was declared in the project (class file)
            vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })
        end,
    },
}
