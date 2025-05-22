
local api = vim.api
local keymap = vim.keymap
local dashboard = require("dashboard")

vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#89b4fa", bold = true }) -- cor do título
vim.api.nvim_set_hl(0, "DashboardCenter", { fg = "#f38ba8" })              -- cor dos atalhos
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#a6e3a1", italic = true }) -- rodapé, se tiver


local conf = {}
conf.header = {
  "                                                       ",
  "                                                       ",
  "                                                       ",
  " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  "                                                       ",
  "                                                       ",
  "                                                       ",
  "                                                       ",
}

conf.center = {
  {
    icon = "📁 ",
    desc = "Find  File                              ",
    action = "FzfLua files",
    key = "<Leader> f f",
  },
  {
    icon = "📑 ",
    desc = "Recently opened files                   ",
    action = "FzfLua oldfiles",
    key = "<Leader> f r",
  },
  {
    icon = "🗂️ ",
    desc = "Project grep                            ",
    action = "FzfLua live_grep",
    key = "<Leader> f g",
  },
  {
    icon = "⚙️ ",
    desc = "Open Nvim config                        ",
    action = "tabnew $MYVIMRC | tcd %:p:h",
    key = "<Leader> e v",
  },
  {
    icon = "📑 ",
    desc = "New file                                ",
    action = "enew",
    key = "e",
  },
  {
    icon = "󰗼  ",
    desc = "Quit Nvim                               ",
    -- desc = "Quit Nvim                               ",
    action = "qa",
    key = "q",
  },
}

dashboard.setup {
  theme = "hyper",
  shortcut_type = "number",
  config = conf,
}

api.nvim_create_autocmd("FileType", {
  pattern = "dashboard",
  group = api.nvim_create_augroup("dashboard_enter", { clear = true }),
  callback = function()
    keymap.set("n", "q", ":qa<CR>", { buffer = true, silent = true })
    keymap.set("n", "e", ":enew<CR>", { buffer = true, silent = true })
  end,
})
