return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
    callback = function(args)
      require("configs.conform").format({ bufnr = args.buf })
    end,
  },
  {
    'dense-analysis/ale',
    config = function()
      -- Configuration goes here.
      local g = vim.g

      g.ale_ruby_rubocop_auto_correct_all = 1

      g.ale_linters = {
        ruby = {'rubocop', 'ruby'},
        lua = {'lua_language_server'},
        cs = {'csharpier'},
        javascript = {'prettier'},
        javascriptreact = {'prettier'},
        typescript = {'prettier'},
        typescriptreact = {'prettier'},
      }
    end
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp" ,
        "prettier",
        "omnisharp-extended-lsp",
        "json-lsp",
        "yamlls",
        "csharpier",
        "netcoredbg",
      },
    },
  },
  {
    "Hoffs/omnisharp-extended-lsp.nvim",
    lazy = true
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "python",
        "json",
        "yaml",
        "c_sharp",
      },
    },
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    lazy = false,
  },
}
