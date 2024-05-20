local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local function isempty(s)
    return s == nil or s == ''
end

-- if vim.fn.has('nvim') == 1 and !isempty(os.getenv("CONDA_PREFIX")) then
--   local conda_pref = os.getenv("CONDA_PREFIX") .. 'bin/python'
--   vim.g.python3_host_prog = $CONDA_PREFIX . '/bin/python'
--  vim.g.python3_host_prog = conda_pref
-- end

require('lazy').setup('diegovr.plugins',{
    change_detection = {
        notify = false,
    },
})
-- require('lazy').setup(
--     {
--         -- tpope
--         'tpope/vim-fugitive',
--         'tpope/vim-rhubarb',
--         'tpope/vim-vinegar',
--         'tpope/vim-surround',
--         -- treesitter
--         {
--             'nvim-treesitter/nvim-treesitter',
--             build = ':TSUpdate'
--         },
--         'nvim-treesitter/playground',
--         'nvim-treesitter/nvim-treesitter-textobjects',
--         'nvim-treesitter/nvim-treesitter-context',
--         -- tresitter color scheme
--         'christianchiarulli/nvcode-color-schemes.vim',
--         -- Neo Tree
--         {
--             "nvim-neo-tree/neo-tree.nvim",
--             branch = "v3.x",
--             dependencies = {
--                 "nvim-lua/plenary.nvim",
--                 "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
--                 "MunifTanjim/nui.nvim",
--                 -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
--             }
--         },
--         -- LSP
--         'neovim/nvim-lspconfig',
--         'williamboman/mason.nvim',
--         'williamboman/mason-lspconfig.nvim',
--         -- Autocompletion
--         'saadparwaiz1/cmp_luasnip',
--         'hrsh7th/nvim-cmp',
--         'hrsh7th/cmp-nvim-lsp',
--         'hrsh7th/cmp-nvim-lua',
--         'hrsh7th/cmp-buffer',
--         'hrsh7th/cmp-path',
--         -- Snippets
--         -- LuaSnip
--         {
--             "L3MON4D3/LuaSnip",
--             -- follow latest release.
--             version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
--             -- install jsregexp (optional!).
--             build = "make install_jsregexp"
--         },
--         'rafamadriz/friendly-snippets',
--         -- Custom styles
--         'onsails/lspkind.nvim',
--         -- productivity
--         {
--             'nvim-telescope/telescope.nvim',
--             version = '0.1.1',
--             -- branch = '0.1.x',
--             dependencies = { {'nvim-lua/plenary.nvim'} }
--         },
--         'ThePrimeagen/git-worktree.nvim',
--         -- Tmux-Nvim Navigator
--         -- 'alexghergh/nvim-tmux-navigation',
--         {
--             'alexghergh/nvim-tmux-navigation',
--             config = function()
--                 require'nvim-tmux-navigation'.setup {
--                     disable_when_zoomed = true, -- defaults to false
--                     keybindings = {
--                         left = "<C-h>",
--                         down = "<C-j>",
--                         up = "<C-k>",
--                         right = "<C-l>",
--                         last_active = "<C-\\>",
--                         next = "<C-Space>",
--                     }
--                 }
--             end
--         },
--         -- harpoon
--         {
--             "ThePrimeagen/harpoon",
--             branch = "harpoon2",
--             dependencies = { "nvim-lua/plenary.nvim" }
--         },
--         -- Codi
--         'metakirby5/codi.vim',
--         -- 'numToStr/Comment.nvim',
--         -- 'mbbill/undotree',
--         -- 'folke/zen-mode.nvim',
--         -- look and feel
--         -- Coloschemes and styles
--         'nvim-tree/nvim-web-devicons',
--         {
--             'catppuccin/nvim',
--             name = 'catppuccin',
--             priority = 420,
--             lazy = false,
--         },
--         'norcalli/nvim-colorizer.lua',
--         {
--             'sainnhe/everforest',
--             name = 'everforest',
--             priority = 1000,
--             lazy = false,
--         },
--         {
--             'sainnhe/edge',
--             name = 'edge',
--             priority = 500,
--             lazy = false,
--         },
--         'EdenEast/nightfox.nvim',
--         -- Statusline
--         'nvim-lualine/lualine.nvim',
--         -- Latex
--         -- 'lervag/vimtex',
--     },
--     {
--         ui = {
--             icons = {
--                 cmd = "⌘",
--                 config = "🛠",
--                 event = "📅",
--                 ft = "📂",
--                 init = "⚙",
--                 keys = "🗝",
--                 plugin = "🔌",
--                 runtime = "💻",
--                 source = "📄",
--                 start = "🚀",
--                 task = "📌",
--             },
--         },
--     }
-- )
