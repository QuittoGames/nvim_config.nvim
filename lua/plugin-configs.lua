vim.o.background = "dark" -- "dark" ou "light"

require("lazy").setup({
  -- Tema VSCode
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("vscode").setup({})
      vim.cmd([[colorscheme vscode]])
    end,
  },

  -- Barra de status
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "vscode" },
      })
    end,
  },

  -- Notificações e UI melhorada
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    format = {
      cmdline = { pattern = "^:", icon = "👨‍💻", lang = "vim" },
      search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
      search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
      filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
      lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
      help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
      input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
      -- lua = false, -- to disable a format, set to `false`
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- Animetion
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers", -- ou "tabs"
        diagnostics = "nvim_lsp",
        show_buffer_icons = true,
        show_close_icon = true,
        separator_style = "slant",
        always_show_bufferline = true,
      },
    })

    -- Keymaps para navegar entre abas
    vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })
  end,
  },



  -- Autopairs e autotags
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
      })
    end,
  },

  -- Terminal integrado
  {
    "Dan7h3x/neaterm.nvim",
    branch = "stable",
    event = "VeryLazy",
    opts = {
      width = 80,      -- largura do terminal
      height = 15,     -- altura do terminal (se for na horizontal)
      blend = 0,       -- transparência (0 = sem transparência)
      autoclose = true,-- fecha o terminal automaticamente quando o comando termina
      float = false,   -- falso para terminal horizontal, true para flutuante
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "ibhagwan/fzf-lua",
    },
  },


  -- Toggle f-string Python
  {
    "roobert/f-string-toggle.nvim",
    config = function()
      require("f-string-toggle").setup({
        key_binding = "<leader>f",
        key_binding_desc = "Toggle f-string",
        filetypes = { "python" },
      })
    end,
  },

  -- TypeScript checker
  {
    "dmmulroy/tsc.nvim",
    config = function()
      require("tsc").setup({
        auto_open_qflist = true,
        auto_close_qflist = false,
        auto_focus_qflist = false,
        auto_start_watch_mode = false,
        use_trouble_qflist = false,
        use_diagnostics = false,
        run_as_monorepo = false,
        enable_progress_notifications = true,
        enable_error_notifications = true,
        hide_progress_notifications_from_history = true,
        spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
        pretty_errors = true,
      })
    end,
  },

  -- LSP básico
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.jdtls.setup({ capabilities = capabilities }) -- Java

      -- Keymaps
      local on_attach = function(_, bufnr)
        local bufmap = function(mode, lhs, rhs)
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
        end
        bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
        bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
        bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
        bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
        bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
        bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
        bufmap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")
        bufmap("n", "<leader>ds", "<cmd>lua vim.diagnostic.open_float()<CR>")
        bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
        bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
      end
    end,
  },

  -- REST client
  {
    "rest-nvim/rest.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
  },

   -- Toggle f-string Python
  {
    "roobert/f-string-toggle.nvim",
    config = function()
      require("f-string-toggle").setup({
        key_binding = "<leader>f",
        key_binding_desc = "Toggle f-string",
        filetypes = { "python" },
      })
    end,
  },

  -- TypeScript checker
  {
    "dmmulroy/tsc.nvim",
    config = function()
      require("tsc").setup({})
    end,
  },

  -- REST Client
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },

  -- Auto-complete
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.opt.completeopt = { "menu", "menuone", "noselect" }

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },

  -- Mason
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "lua_ls", "tsserver", "jdtls" },
      })
    end,
  },

  -- LSP Kind (ícones nos menus)
  {
    "onsails/lspkind.nvim",
    config = function()
      require("lspkind").init()
    end,
  },

  -- LSP Neodev para Lua
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end,
  },

  -- Null-ls para lint/format externo
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black,
        },
      })
    end,
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      require("neodev").setup({})

      local on_attach = function(_, bufnr)
        local bufmap = function(mode, lhs, rhs)
          vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
        end

        bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
        bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
        bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
        bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
        bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
        bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
        bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
        bufmap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")
        bufmap("n", "<leader>ds", "<cmd>lua vim.diagnostic.open_float()<CR>")
        bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
        bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
      end

      -- Setup dos servidores
      local servers = { "pyright", "tsserver", "lua_ls", "jdtls" }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
          on_attach = on_attach,
        })
      end
    end,
  },

  -- Material Icons
  {
    "DaikyXendo/nvim-material-icon",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-material-icon").setup()
      require("nvim-web-devicons").setup({
        override = require("nvim-material-icon").get_icons(),
        default = true,
      })
    end,
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },

  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        hijack_cursor = true,
        update_cwd = true,
        view = {
          width = 30,
          side = "left",
          mappings = {
            list = { { key = "u", action = "dir_up" } },
          },
        },
        renderer = {
          icons = {
            show = {
              git = true,
              folder = true,
              file = true,
              folder_arrow = true,
            },
          },
        },
      })
      vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
    end,
  },

  -- Dashboard inicial
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("dashboard").setup({
        theme = "hyper",
        config = {
          week_header = { enable = true },
          shortcut = {
            { desc = "  Find File", group = "@property", action = "Telescope find_files", key = "f" },
            { desc = "  Update Plugins", group = "@property", action = "Lazy update", key = "u" },
            { desc = "  Quit", group = "@property", action = "q", key = "q" },
          },
        },
      })
    end,
  },
})
