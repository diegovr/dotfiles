return {
    -- Custom styles
    {
        'onsails/lspkind.nvim',
    },
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
        },
    },
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function()
            local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lsp_attach = function (_, bufnr)
                local opts = {buffer = bufnr, remap = false}
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                vim.keymap.set("n", "<leader>vd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "<leader>vt", vim.lsp.buf.type_definition, opts)
                vim.keymap.set("n", "<leader>vi", vim.lsp.buf.implementation, opts)
                vim.keymap.set("n", "<leader>vr", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>vf", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "<leader>va", vim.lsp.buf.code_action, opts)
                vim.keymap.set("n", "<leader>vh", vim.lsp.buf.signature_help, opts)
                vim.keymap.set("n", "<leader>v<down>", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "<leader>v<up>", vim.diagnostic.goto_prev, opts)
            end

            local lspconfig = require("lspconfig")

            -- lspconfig.ruff_lsp.setup({
            --     on_attach = lsp_attach,
            --     capabilities = lsp_capabilities,
            -- })

            lspconfig.pylsp.setup({
                on_attach = lsp_attach,
                capabilities = lsp_capabilities,
                settings={
                    pylsp={
                        plugins={
                            pycodestyle={
                                -- ignore={"W391"},
                                maxLineLength=120
                            }
                        }
                    }
                }
            })

            -- Fix Undefined global 'vim'
            -- Sample to use with NeoVim https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
            lspconfig.lua_ls.setup({
                on_attach = lsp_attach,
                capabilities = lsp_capabilities,
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
                        return
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT'
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- Depending on the usage, you might want to add additional paths here.
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            }
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        }
                    })
                end,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" }
                        }
                    }
                }
            })

            lspconfig.rust_analyzer.setup({
                on_attach = lsp_attach,
                capabilities = lsp_capabilities,
                cmd = {
                    "rustup", "run", "stable", "rust-analyzer",
                },
                settings = {
                    ["rust-analyzer"] = {
                        diagnostics = {
                            enable = true;
                        }
                    }
                }
            })

            lspconfig.tsserver.setup({
                on_attach = lsp_attach,
                capabilities = lsp_capabilities,
            })

            lspconfig.vuels.setup({
                on_attach = lsp_attach,
                capabilities = lsp_capabilities,
            })

            lspconfig.yamlls.setup({
                on_attach = lsp_attach,
                capabilities = lsp_capabilities,
            })

            lspconfig.marksman.setup({
                on_attach = lsp_attach,
                capabilities = lsp_capabilities,
            })

            vim.diagnostic.config({
                virtual_text = true
            })
        end
    },
}
