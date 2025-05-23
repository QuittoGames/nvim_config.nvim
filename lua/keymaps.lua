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
map("v", "<C-a>", "<Esc>ggVG", opts)
map("i", "<C-a>", "<C-o>ggVG", opts)


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

-- Start Compiler 
map("n", "<C-CR>", ":w<CR>:!python3 %<CR>", opts)
map("n", "<leader>r", ":w<CR>:!python3 %<CR>", opts)

-- Tab
-- Indentar pra direita e manter seleção
vim.keymap.set("v", "<Tab>", ">gv", { noremap = true, silent = true })

-- Indentar pra esquerda e manter seleção
vim.keymap.set("v", "<S-Tab>", "<gv", { noremap = true, silent = true })


-- Split window
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- vertical
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- horizontal

-- Trocar entre janelas
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")


-- Comentário rápido
vim.keymap.set("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end)

-- Create File
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>mk", function()
  vim.ui.input({ prompt = "Nome do arquivo: " }, function(input)
    if input and input ~= "" then
      vim.cmd("edit " .. input)
    end
  end)
end, { noremap = true, silent = true })


-- Create Project (Project Stetup 2.0)
local path_app = "C:/Users/gustavoquitto-ieg/Downloads/scripts/ProjectSetup-2.0_nvim/index.py"

vim.keymap.set("n", "<leader>ps2", function()
  vim.cmd("split | terminal cmd /c python " .. path_app)
end, { noremap = true, silent = true })

--Plugins

-- Cmd
vim.keymap.set("n", "<leader>t", "<cmd>NeatermToggle<CR>", { noremap = true, silent = true })

-- Keympas Vscode
vim.keymap.set("n"  , "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-c>", "<Esc>", { noremap = true, silent = true })


-- lsp
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

-- git sings
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", opts)
map("n", "<leader>gs", "<cmd>Gitsigns stage_hunk<CR>", opts)
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", opts)
map("n", "]g", "<cmd>Gitsigns next_hunk<CR>", opts)
map("n", "[g", "<cmd>Gitsigns prev_hunk<CR>", opts)
