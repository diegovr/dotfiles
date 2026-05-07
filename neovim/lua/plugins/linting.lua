return {
  "mfussenegger/nvim-lint",
  event = {
    -- "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      -- markdown = { "vale" },
      -- python = { "pylint", "flake8" },
    }
    -- set pylint to work with the environment
    -- lint.linters.pylint.cmd = "python"
    -- lint.linters.pylint.args = { "-m", "pylint", "-f", "json" }

    -- lint.linters.flake8.cmd = "python"
    -- lint.linters.flake8.args = { "-m", "flake8", "--extend-ignore", "E502" }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    -- vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
    -- 	group = lint_augroup,
    -- 	callback = function()
    -- 		lint.try_lint()
    -- 	end,
    -- })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
