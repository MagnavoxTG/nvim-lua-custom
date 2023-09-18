local plugins = {
  {
    -- Used to import the defualt lspconfig and the custom lsp config
    -- LSP is the Language Server Provider, its an interface that allows for code completion.
    -- It prodiveds this interface as a dependency for plugins like rust-analyzer or pyright
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    -- Enables non LSP tools to have an LSP interface
    -- Usefull for Linters and Formatters
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function ()
      return require("custom.configs.null-ls")
    end
  },
  {
    -- Used to enable seemless navigation between nvim an tmux
    "christoomey/vim-tmux-navigator",
    lazy = false
  },
  {
    -- Debug Adapter Protocol
    -- Provides an interface for debugging (just like LSP).
    "mfussenegger/nvim-dap"
  },
  {
    -- DAP UI
    "rcarriga/nvim-dap-ui",
    lazy = false,
    dependencies = "mfussenegger/nvim-dap",
    config = function()
        require("dapui").setup() -- loading this function enables dapui
    end
  },
  {
    -- Mason installes dependencies (sort of a plugin manager)
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",    -- Rust LSP
        "pyright",          -- Python LSP
        "mypy",             -- Python Type Checker
        "ruff",             -- Python Linter
        "black",            -- Python Auto Formatter
        "debugpy"           -- Python Debugging Dependency
      }
    }
  },
  {
    -- Primarily used for auto formatting rust code
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1 -- Enables auto formatting on save
    end
  },
  {
    -- Among other things this plugin enables rust debugging and code completion with creates
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require("custom.configs.rust-tools")
    end,
    config = function (_, opts)
      require("rust-tools").setup(opts)
    end
  },
  {
    -- Enables python debugging
    "mfussenegger/nvim-dap-python",
    ft = {"python"},
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui"
    },
    config = function(_, opts)
      -- Enables python debugging and sets path
      require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python") 
    end
  }
}

return plugins
