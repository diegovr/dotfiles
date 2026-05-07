return {
  -- 1. Los iconos para el autocompletado
  { "onsails/lspkind.nvim" },

  -- 2. Configuración de nvim-lspconfig (La forma moderna)
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    opts = {
      -- Aquí configuramos tus servidores
      servers = {
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                -- Use "openFilesOnly" to save RAM on massive projects
                diagnosticMode = "openFilesOnly",
                typeCheckingMode = "standard", -- or "strict" for hardcore typing
                autoImportCompletions = true,
              },
            },
          },
        },
        ruff = {
          -- Specific Ruff settings
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
          },
        },
        -- pylsp = {
        --   settings = {
        --     pylsp = {
        --       plugins = { pycodestyle = { maxLineLength = 150 } },
        --     },
        --   },
        -- },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
            },
          },
        },
        ts_ls = {},
        yamlls = {},
        marksman = {},
      },
      -- Configuración de diagnósticos
      diagnostics = {
        virtual_text = true,
      },
      setup = {
        -- Tell LazyVim to ignore pyright if using basedpyright
        pyright = function()
          return true
        end,
      },
    },
    -- 3. KEYMAPS: Esta es la forma NO deprecada de añadir tus atajos
    keys = {
      { "K", vim.lsp.buf.hover, desc = "Hover Documentation" },
      { "<leader>vd", vim.lsp.buf.definition, desc = "LSP Definition" },
      { "<leader>vr", vim.lsp.buf.rename, desc = "LSP Rename" },
      { "<leader>vf", vim.lsp.buf.references, desc = "LSP References" },
      { "<leader>va", vim.lsp.buf.code_action, desc = "LSP Code Action", mode = { "n", "v" } },
    },
  },
}
