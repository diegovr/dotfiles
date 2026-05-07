--Set Leader Key
vim.g.mapleader = " "
vim.g.nvcode_termcolors = 256

-- Quick nohlsearch
vim.keymap.set("n", "<Leader><Esc>", "<cmd>noh<CR>")

-- Yank and paste from clipboard
vim.keymap.set("v", "<Leader>y", '"+y')
vim.keymap.set("v", "<Leader>p", '"+p')
vim.keymap.set("n", "<Leader>p", '"+p')

-- Quickfix
-- vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zzzv")
-- vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zzzv")

-- Select the last changed text
vim.keymap.set("n", "gp", "`[v`]")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--------------------------------------------------------------------------
-- Json viewer with JqxList
-- Open a float buffer to check the current line JSON
vim.keymap.set("n", "<leader>jl", function()
  local valid_ft = { "json", "jsonl", "jsonlines", "yaml" }
  local current_ft = vim.bo.filetype

  local file_ext = vim.fn.expand("%:e")
  local is_json_ext = vim.tbl_contains({ "jsonl", "jsonlines", "json" }, file_ext)

  if not vim.tbl_contains(valid_ft, current_ft) and not is_json_ext then
    vim.notify("only JSON or YAML files", vim.log.levels.WARN)
    return
  end
  local line = vim.api.nvim_get_current_line()
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { line })

  local width = math.ceil(vim.o.columns * 0.8)
  local height = math.ceil(vim.o.lines * 0.8)

  -- Open the window
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = math.ceil((vim.o.lines - height) / 2),
    col = math.ceil((vim.o.columns - width) / 2),
    style = "minimal",
    border = "rounded",
  })

  -- Apply syntax and format
  vim.bo[buf].filetype = "json"
  -- Using jq (faster) if it is installed, else python
  if vim.fn.executable("jq") == 1 then
    vim.cmd("silent! %!jq .")
  else
    vim.cmd("silent! %!python3 -m json.tool")
  end

  -- map to close the float buffer (q or Esc)
  local opts = { buffer = buf, silent = true }
  vim.keymap.set("n", "q", "<cmd>close<cr>", opts)
  vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", opts)

  -- Important: The buffer is only-readable to avoid modify it by accident
  vim.bo[buf].modifiable = false
end, { desc = "JSONL: Previsualizar línea actual" })

--------------------------------------------------------------------------
-- Redefine Ctrl+s to save with the custom function
vim.api.nvim_set_keymap("n", "<C-s>", ":lua SaveFile()<CR>", { noremap = true, silent = true })

-- Custom save function
function SaveFile()
  -- Check if a buffer with a file is open
  if vim.fn.empty(vim.fn.expand("%:t")) == 1 then
    vim.notify("No file to save", vim.log.levels.WARN)
    return
  end

  local filename = vim.fn.expand("%:t") -- Get only the filename
  local success, err = pcall(function()
    vim.cmd("silent! write") -- Try to save the file without showing the default message
  end)

  if success then
    vim.notify(filename .. " Saved!") -- Show only the custom message if successful
  else
    vim.notify("Error: " .. err, vim.log.levels.ERROR) -- Show the error message if it fails
  end
end
