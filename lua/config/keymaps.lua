-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle NvimTree
vim.keymap.set("n", "<M-e>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Copy to system clipboard
vim.keymap.set({ "n", "v" }, "<M-c>", "\" +y", { desc = "Copy to system clipboard" })

-- space q for switching left windows and w for right
vim.keymap.set("n", "<leader>w", "<C-w>l", { desc = "Switch to right window" })
vim.keymap.set("n", "<leader>q", "<C-w>h", { desc = "Switch to left window" })

-- Paste from system clipboard
vim.keymap.set({ "n", "v" }, "<M-v>", "\" +p", { desc = "Paste from system clipboard" })

-- alt + s for saving file
vim.keymap.set("n", "<M-s>", "<cmd>w<CR>", { desc = "Save file" })

-- Alt + Arrow for highlighting (visual mode)
-- These mappings enter visual mode and extend the selection by one character..
-- Subsequent presses of Alt + Arrow will continue to extend the selection.
vim.keymap.set("n", "<M-Left>", "v<Left>", { desc = "Highlight left" })
vim.keymap.set("n", "<M-Right>", "v<Right>", { desc = "Highlight right" })
vim.keymap.set("n", "<M-Up>", "v<Up>", { desc = "Highlight up" })
vim.keymap.set("n", "<M-Down>", "v<Down>", { desc = "Highlight down" })

-- Shift + Space: Jump to the end of the current line
-- This is a common and practical interpretation for "jump to end of sentence"
-- when the sentence is on a single line.
vim.keymap.set("n", "<Space>", "$", { desc = "Jump to end of line/sentence" })

-- Shift + Alt + Space: Jump to the end of the current word
-- This uses the standard 'e' motion to move to the end of the current word.
vim.keymap.set("n", "<M-Space>", "e", { desc = "Jump to end of word" })

-- Toggle Comments
-- Use <leader>/ (Space + /) to toggle comments on the current line or selected lines.
-- Works in normal and visual modes.
vim.keymap.set({ "n", "v" }, "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment" })

-- Format Document
-- Use <leader>f (Space + f) to format the entire document using the LSP server.
vim.keymap.set("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format document" })

-- Find Files (Telescope)
-- Use <leader>ff (Space + f + f) to open a fuzzy finder to search and open files in your project.
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })

-- Close Current Buffer
-- Use <leader>x (Space + x) to close the current file buffer without closing the window.
vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })

-- Create New File
-- Use <M-n> (Alt + n) to create a new file. You will be prompted for the file path.
-- Directories will be created if they don't exist.
vim.keymap.set("n", "<M-n>", function()
  vim.ui.input({ prompt = "New file path: ", completion = "file" }, function(path)
    if path then
      local dir = vim.fn.fnamodify(path, ":h")
      vim.fn.mkdir(dir, "p") -- Create parent directories if they don't exist
      vim.cmd("e " .. path)  -- Open the new file for editing
    end
  end)
end, { desc = "Create new file" })

-- Create New Folder
-- Use <M-n>n (Alt + n, then n) to create a new folder. You will be prompted for the folder path.
-- Parent directories will be created if they don't exist.
vim.keymap.set("n", "<M-n>n", function()
  vim.ui.input({ prompt = "New folder path: ", completion = "dir" }, function(path)
    if path then
      vim.fn.mkdir(path, "p") -- Create the folder and any necessary parent directories
      print("Created folder: " .. path)
    end
  end)
end, { desc = "Create new folder" })

-- Jump to End of Function/Block
-- Use <Space><Space> (Space + Space) to jump to the end of the current function or code block.
-- This uses the ']]' motion, which jumps to the next '}' or ')' in the first column.
vim.keymap.set("n", "<Space><Space>", "]]", { desc = "Jump to end of function/block" })

-- Jump to Start of Function/Block
-- Use <Space><Tab> (Space + Tab) to jump to the beginning of the current function or code block.
-- This uses the '[[' motion, which jumps to the previous '{' or '(' in the first column.
vim.keymap.set("n", "<Space><Tab>", "[[", { desc = "Jump to start of function/block" })
