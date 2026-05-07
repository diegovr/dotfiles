-- Plugin: snacks.nvim
-- URL: https://github.com/folke/snacks.nvim/tree/main
-- Description: A Neovim plugin for creating a customizable dashboard.
return {
  --  {
  --    "folke/snacks.nvim",
  --    opts = {
  --      dashboard = {
  --        sections = {
  --          { section = "header" },

  --          { section = "startup" },
  --        },
  --        -- Aquí pegamos tu logo ASCII
  --        preset = {
  --          header = [[
  --                                                     
  --              ████ ██████           █████      ██
  --             ███████████             █████ 
  --             █████████ ███████████████████ ███   ███████████
  --            █████████  ███    █████████████ █████ ██████████████
  --           █████████ ██████████ █████████ █████ █████ ████ █████
  --         ███████████ ███    ███ █████████ █████ █████ ████ █████
  --        ██████  █████████████████████ ████ █████ █████ ████ ██████
  --          ]],
  --        },
  --      },
  --    },
  --  },
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>fb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Find Buffers",
      },
      { "<leader>.", false },
    },
    opts = {
      -- bigfile = { enabled = true },
      -- explorer = { enabled = false },
      -- indent = { enabled = true },
      -- input = { enabled = false },
      -- notifier = { enabled = false },
      -- quickfile = { enabled = true },
      -- scope = { enabled = false },
      -- statuscolumn = { enabled = false },
      -- words = { enabled = false },
      -- image = { enabled = false },
      -- zen = {
      --   enabled = true,
      --   toogles = {},
      -- },
      picker = {
        exclude = {
          ".git",
          "node_modules",
        },
        matcher = {
          fuzzy = true,
          smartcase = true,
          ignorecase = true,
          filename_bonus = true,
        },
        layout = { preset = "telescope" },
        sources = {
          -- explorer = {
          files = {
            exclude = { "node_modules", ".git", "dist", "build", "__pycache__", "deps", ".pyc", "media" },
          },
          --   matcher = {
          --     fuzzy = true, -- Enables fuzzy matching, so you can be a bit imprecise with your search terms
          --     smartcase = true, -- If your search term has uppercase letters, the search becomes case-sensitive
          --     ignorecase = true, -- Ignores case when searching, unless smartcase is triggered
          --     filename_bonus = true, -- Gives a higher priority to matches in filenames
          --     sort_empty = false, -- If no matches are found, it won't sort the results
          --   },
          -- },
        },
      },
      dashboard = {
        sections = {
          { section = "header" },
          { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          { section = "startup" },
        },
        preset = {
          header = [[
                                                                            
              ████ ██████           █████      ██                     
             ███████████             █████                             
             █████████ ███████████████████ ███   ███████████   
            █████████  ███    █████████████ █████ ██████████████   
           █████████ ██████████ █████████ █████ █████ ████ █████   
         ███████████ ███    ███ █████████ █████ █████ ████ █████  
        ██████  █████████████████████ ████ █████ █████ ████ ██████ 
]],
          -- stylua: ignore
          ---@type snacks.dashboard.Item[]
          keys = {
            { icon = " ", key = "ff", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
            { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
    },
  },
}
