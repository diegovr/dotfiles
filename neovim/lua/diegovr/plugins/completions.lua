return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    -- {
    --     "github/copilot.vim",
    -- },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            local lspkind = require("lspkind")
            local cmp_select = {behavior = cmp.SelectBehavior.Select}

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                    -- The following configuration defines a key mapping to show completion only for vsnip snippets.
                    -- ["<C-Space>"] = cmp.mapping.complete(),
                }),
                -- mapping = cmp.mapping.preset.insert({
                --     ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                --     ["<C-f>"] = cmp.mapping.scroll_docs(4),
                --     ["<C-Space>"] = cmp.mapping.complete(),
                --     ["<C-e>"] = cmp.mapping.abort(),
                --     ["<CR>"] = cmp.mapping.confirm({ select = true }),
                -- }),
                sources = cmp.config.sources({
                    -- Copilot Source
                    -- { name = "copilot", group_index = 2 },
                    -- Other sources
                    { name = "nvim_lsp"},
                    { name = "luasnip"}, -- For luasnip users.
                }, {
                        { name = "buffer" },
                    }),
                formatting = {
                    fields = { "abbr", "kind" },
                    format = lspkind.cmp_format({
                        -- mode = "symbol", -- show only symbol annotations
                        -- max_width = 50,
                        -- symbol_map = { Copilot = ""},
                         mode = "symbol_text", -- show only symbol annotations
                         maxwidth = 30, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

                        -- The function below will be called before any actual modifications from lspkind
                        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                        before = function (_, vim_item)
                            vim_item.menu = nil
                            return vim_item
                        end
                    })
                },
            })
        end,
    },
}
