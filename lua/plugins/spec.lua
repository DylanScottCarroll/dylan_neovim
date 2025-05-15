return {
  {
    "tomasiser/vim-code-dark",
    lazy = false,          -- load during startup
    priority = 1000,       -- ensure it loads before other plugins
    config = function()
      -- Optional: conservative mode
      -- vim.g.codedark_conservative = 1

      -- Optional: force 256 color support in terminal
      -- vim.g.codedark_term256 = 1

      vim.cmd("colorscheme codedark")
    end,
  },

  { "folke/todo-comments.nvim", opts = {} },


  {
    "williamboman/mason.nvim",
    version = "^1.0.0",
    build = ":MasonUpdate", -- optional: update mason registry on install
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "^1.0.0",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",     -- lua
          "pyright",    -- python
          "rust_analyzer",  -- rust
          "clangd",     -- c/c++
          "fortls",
        },
        automatic_installation = true,
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    versionn = "^1.0.0",
    config = function()
      local lspconfig = require("lspconfig")

      -- Example: only attach `lua
      -- _ls` to Lua files
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        },
      })

      -- Example: only attach `pyright` to Python files
      lspconfig.pyright.setup({
            settings = {["python.analysis.typeCheckingMode"] = "basic", },
      })

      -- You can even lazy-load servers manually if needed,
      -- but lspconfig will do it automatically when you open the right file.
    end,
  },

  {
    'stevearc/aerial.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },

  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
        bind = true,
        hint_prefix = "->"
    },
  },
 
  {
    "soulis-1256/eagle.nvim",
    opts = {
      --override the default values found in config.lua
    }
  },


  --{
  --  "ms-jpq/coq_nvim",
  --  branch = "coq", -- main plugin
  --  dependencies = {
  --    { "ms-jpq/coq.artifacts", branch = "artifacts" }, -- recommended sources
  --    { "ms-jpq/coq.thirdparty", branch = "3p" },        -- optional: external sources
  --  },
  --  build = ":COQdeps", -- runs dependency setup on install
  --  init = function()
  --    -- Optional: disable automatic startup banner
  --    vim.g.coq_settings = {
  --      keymap = {
  --          recommended = false,
  --          pre_select = true,
  --      },
  --      auto_start = "shut-up", -- don't prompt to start
  --      display = {
  --        preview = {
  --          border = "rounded",
  --        },
  --      },
  --    }
  --  end,
  --  config = function()
  --    -- Optional: use with lspconfig
  --    local lspconfig = require("lspconfig")
  --    local coq = require("coq")

  --    -- Example LSP: Lua
  --    lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
  --      settings = {
  --        Lua = {
  --          diagnostics = { globals = { "vim" } },
  --        },
  --      },
  --    }))

  --    -- Add your other LSPs here, wrapped with `coq.lsp_ensure_capabilities`
  --  end,
  --},
}

