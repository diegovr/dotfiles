return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- source1: https://github.com/nvimtools/none-ls.nvim/discussions/81
                -- source2: https://stackoverflow.com/questions/78150730/failed-to-load-builtin-eslint-d-for-method-diagnostics
                require("none-ls.diagnostics.flake8").with({
                    extra_args = { "--max-line-length", "100" },
                }),
                require("none-ls.diagnostics.eslint_d"),
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                -- null_ls.builtins.diagnostics.eslint_d,
                null_ls.builtins.diagnostics.pylint,
            },
        })
        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
