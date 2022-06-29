--
-- ██╗  ██╗███████╗██╗   ██╗███╗   ███╗ █████╗ ██████╗ ███████╗
-- ██║ ██╔╝██╔════╝╚██╗ ██╔╝████╗ ████║██╔══██╗██╔══██╗██╔════╝
-- █████╔╝ █████╗   ╚████╔╝ ██╔████╔██║███████║██████╔╝███████╗
-- ██╔═██╗ ██╔══╝    ╚██╔╝  ██║╚██╔╝██║██╔══██║██╔═══╝ ╚════██║
-- ██║  ██╗███████╗   ██║   ██║ ╚═╝ ██║██║  ██║██║     ███████║
-- ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚══════╝
--

local modes = {
  normal = 'n',
  insert = 'i',
  visual = 'v',
  visual_block = 'x',
  command = 'c',
  -- add more mode here if you want
}
local opts = { noremap = true, silent = true }

function set_keymap(keys)
  for mode, map in pairs(keys) do
    local key_mode = modes[mode]
    for key, value in pairs(map) do
      vim.api.nvim_set_keymap(key_mode, key, value, opts)
    end
  end
end

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = {
  normal = {
    -- Better window navigation
    ['<C-h>'] = '<C-w>h',
    ['<C-j>'] = '<C-w>j',
    ['<C-k>'] = '<C-w>k',
    ['<C-l>'] = '<C-w>l',
    -- Resize with arrows
    ['<C-Up>'] = ':resize -2<CR>',
    ['<C-Down>'] = ':resize +2<CR>',
    ['<C-Left>'] = ':vertical resize -2<CR>',
    ['<C-Right>'] = ':vertical resize -2<CR>',
    -- Navigate buffers
    ['<S-l>'] = ':bnext<CR>',
    ['<S-h>'] = ':bprevious<CR>',
    -- Move text up and down
    ['<A-j>'] = '<Esc>:m .+1<CR>==gi',
    ['<A-k>'] = '<Esc>:m .-2<CR>==gi',
    -- Telescope
    ['<leader>f'] = '<cmd>Telescope find_files<cr>',
    ['<c-t>'] = '<cmd>Telescope live_grep<cr>',
    -- NvimTree
    ['<leader>e'] = ':NvimTreeToggle<cr>',
  },
  insert = {
    -- Press jk fast to enter normal mode
    ['jk'] = '<ESC>',
    ['<c-bs>'] = '<c-w>',
  },
  visual = {
    -- Stay in indent mode
    ['<'] = '<gv',
    ['>'] = '>gv',
    -- Move text up and down
    ['A-j'] = ':m .+1<CR>==gi',
    ['A-k'] = ':m .-2<CR>==gi',
    ['p'] = '"_dP',
  },
  visual_block = {
    -- Move text up and down
    ['J'] = ":move '>+1<CR>gv-gv",
    ['K'] = ":move '<-2<CR>gv-gv",
    ['A-j'] = ":move '>+1<CR>gv-gv",
    ['A-k'] = ":move '<-1<CR>gv-gv",
  },
  -- command = {
  -- 	["w"] = "<cmd>lua vim.lsp.buf.formatting()<CR> :w",
  -- 	["ww"] = "w",
  -- },
}

-- Default Keybinds I Might Forget
--[[
Normal Mode
  Navigation
  "gd" -> Goto Definition
  Comments
  "gcc" -> Toggles One-line Comments
  "gbc" -> Toggles Block Comments
Visual Mode
  Comments
  "gc" -> Toggles One-Line Comments
  "gb" -> Toggles Block Comments
]]

set_keymap(keymap) -- put this line at the end of file
