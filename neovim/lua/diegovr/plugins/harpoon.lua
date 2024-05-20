return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()
        vim.keymap.set("n", "<leader>..", function() harpoon:list():add() end)
        vim.keymap.set("n", "<leader>.c", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        -- vim.keymap.set("n", "<leader>..", mark.add_file)
        -- vim.keymap.set("n", "<leader>.c", ui.toggle_quick_menu)
        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<leader>k", function() harpoon:list():next() end)
        vim.keymap.set("n", "<leader>j", function() harpoon:list():prev() end)
        -- vim.keymap.set("n", "<leader>k", ui.nav_next)
        -- vim.keymap.set("n", "<leader>j", ui.nav_prev)
    end
}
