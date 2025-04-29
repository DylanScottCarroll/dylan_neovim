--
-- Sane Defaults
--

-- Enable line numbers
vim.opt.number = true

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set tab width to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Enable mouse support
vim.opt.mouse = 'a'
vim.o.mousemoveevent = true

-- Enable syntax highlighting
vim.cmd('syntax on')

-- Set default encoding to UTF-8
vim.opt.encoding = 'utf-8'

-- Enable persistent undo
vim.opt.undofile = true

-- Case-insensitive search, unless capital letter or `/C` is used
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Incremental search
vim.opt.incsearch = true

-- Highlight search results
vim.opt.hlsearch = true

-- Show matching brackets
vim.opt.showmatch = true

-- Remove numbers of some files
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"markdown", "text"},
  callback = function()
    vim.wo.wrap = true
  end
})


-- Let the cursor go one past the end of the line in normal mode
vim.opt.virtualedit=onemore

--
-- Plugin Manager
--

require("config.lazy")
require('lsp_signature').on_attach()

--
-- Customizations 
--

--vim.cmd.normal("c

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Change delete to use the d register
map("n", "d", '"dd', opts)   
map("v", "d", '"dd', opts)   
map("n", "dd", '"ddd', opts) 
map("n", "D", '"dD', opts)  

-- Change the clipboard to be the unnamed register
vim.opt.clipboard = "unnamedplus"


-- Alt Dragging!
map('n', '<A-Up>', ':m .-2<CR>', opts)  -- Move the current line up by 1
map('n', '<A-Down>', ':m .+1<CR>', opts) -- Move the current line down by 1

map('v', '<A-Up>', ":move '<-2<CR>gv", opts)  -- Move selected lines up and reselect them
map('v', '<A-Down>', ":move '>+1<CR>gv", opts)  -- Move selected lines down and reselect them

-- Enter and Delete Being Nice in Normal mode
map('n', '<Enter>', 'a<Enter><Esc>', opts)
map('n', '<BS>', 'i<BS><Esc><Right>', opts)



-- Move Around tabs with alt

for i = 1, 9 do
    map("n", "<A-" .. tostring(i) .. ">", tostring(i) .. "gt", opts)
end

map("n", "<A-Left>", "gT", opts)
map("n", "<A-Right>", "gt", opts)

