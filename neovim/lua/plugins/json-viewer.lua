return {
  {
    "gennaro-tedesco/nvim-jqx",
    event = { "BufReadPost", "BufNewFile" },
    ft = { "json", "yaml", "jsonl" },
    keys = {
      {
        "<leader>jj",
        function()
          local ft = vim.bo.filetype
          -- Si Neovim no lo detectó, pero la extensión es jsonl
          local ext = vim.fn.expand("%:e")

          if ft == "jsonl" or ext == "jsonl" then
            vim.cmd("JqxList jsonl")
          else
            -- Por defecto intentamos la lista normal
            vim.cmd("JqxList")
          end
        end,
        desc = "JSON/JSONL: Explorar estructura",
      },
    },
    config = function()
      -- Configuración opcional para mejorar la estética en terminales modernas
      -- como Ghostty o WezTerm
      vim.g.jqx_pull_float_window = 1 -- Abrir en ventana flotante
      vim.g.jqx_float_width = 0.6 -- Ancho de la ventana (60%)
      vim.g.jqx_float_height = 0.6 -- Alto de la ventana (60%)
    end,
  },
}
