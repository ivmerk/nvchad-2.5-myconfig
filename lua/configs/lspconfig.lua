-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {"omnisharp", "pyright", "tsserver", "lua_ls", "html", "cssls", "jsonls", "yamlls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- omnisharp
lspconfig.omnisharp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
  cmd = {
    "/Users/ivanmerkulov/.local/share/nvim/mason/bin/omnisharp",
    "--languageserver",
    "--hostPID",
    tostring(vim.fn.getpid()),
  },
  keys = {
    {
      "gd",
      function()
        require("omnisharp_extended").telescope_lsp_definitions()
      end,
      desc = "Goto Definition",
    },
  },
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
  enable_import_completion = true,
  sdk_include_prereleases = true,

  root_dir = function()
    return require("lspconfig/util").root_pattern(
      "*.sln",
      "*.csproj",
      "omnisharp.json",
      "*.godot",
      "function.json",
      ".git"
    )(vim.fn.expand "%:p:h") or vim.fn.expand "%:p:h"
  end,
}
