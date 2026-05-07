return {
  {
    "saghen/blink.cmp",
    lazy = true,
    opts = {
      -- Configuración de teclas (Mantenemos tu estilo)
      keymap = {
        preset = "enter", -- 'enter' es similar a lo que tenías, pero ajustamos Tab:
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },
      },

      -- Aparecerán los iconos de lspkind automáticamente
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },

      -- Ventanas con bordes (como tenías en tu config)
      completion = {
        menu = { border = "rounded" },
        documentation = { window = { border = "rounded" } },
      },

      -- Fuentes de autocompletado (LSP, Snippets, Buffer)
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
