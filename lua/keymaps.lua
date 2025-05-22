local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Básico
map("n", "<C-s>", ":w<CR>", opts)
map("i", "jj", "<Esc>", opts)
map("n", "<C-q>", ":q<CR>", opts)

-- Mover por palavra (normal mode e insert mode)
map("n", "<C-Left>", "b", opts)
map("n", "<C-Right>", "w", opts)
map("i", "<C-Left>", "<C-o>b", opts)
map("i", "<C-Right>", "<C-o>w", opts)

-- Selecionar por caractere (modo visual com Shift + ←/→)
map("n", "<S-Left>", "v<Left>", opts)
map("n", "<S-Right>", "v<Right>", opts)

-- Selecionar por palavra (Ctrl + Shift + ←/→)
map("n", "<C-S-Left>", "vb", opts)
map("n", "<C-S-Right>", "vw", opts)

-- Em modo visual, Ctrl+Shift continuar seleção por palavra
map("n", "<S-Left>", "v<Left>", opts)
map("n", "<S-Right>", "v<Right>", opts)
map("i", "<S-Left>", "<C-o>v<Left>", opts)
map("i", "<S-Right>", "<C-o>v<Right>", opts)
map("n", "<C-S-Left>", "vb", opts)
map("n", "<C-S-Right>", "vw", opts)
map("v", "<C-S-Left>", "b", opts)
map("v", "<C-S-Right>", "e", opts)
map("i", "<C-S-Left>", "<C-o>vb", opts)
map("i", "<C-S-Right>", "<C-o>ve", opts)

-- Ctrl + A (selecionar tudo)
map("n", "<C-a>", "ggVG", opts)

-- Ctrl + C (copiar seleção para clipboard do sistema)
map("v", "<C-c>", '"+y', opts)

-- Ctrl + V (colar do clipboard do sistema)
map("n", "<C-v>", '"+p', opts)
map("i", "<C-v>", '<C-r>+', opts)

-- Ctrl + Z (undo)
map("n", "<C-z>", "u", opts)
map("i", "<C-z>", "<C-o>u", opts)

-- Ctrl + Y (redo)
map("n", "<C-y>", "<C-r>", opts)
map("i", "<C-y>", "<C-o><C-r>", opts)

-- Comentário (VSCode style)
map("n", "<C-/>", ":CommentToggle<CR>", opts)    -- com plugin commentary
map("v", "<C-/>", ":CommentToggle<CR>", opts)

-- Duplicar linha/seleção
map("n", "<A-Shift-d>", ":t.<CR>", opts)         -- Duplica linha atual
map("v", "<A-Shift-d>", "y`>p", opts)            -- Duplica seleção

-- Alternar terminal (VSCode-like)
map("n", "<C-`>", ":ToggleTerm<CR>", opts)       -- Plugin toggleterm.nvim

-- Buscar/Replace rápido (VSCode style)
map("n", "<C-f>", ":FzfLua live_grep<CR>", opts) -- Buscar no projeto
map("n", "<C-h>", ":%s///g<Left><Left>", opts) -- Replace interativo

--Plugins

-- Cmd
vim.keymap.set("n", "<leader>t", "<cmd>NeatermToggle<CR>", { noremap = true, silent = true })

-- Keympas Vscode
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-c>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-c>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("v", "<C-c>", '"+y', { noremap = true, silent = true })

