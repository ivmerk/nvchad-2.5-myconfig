local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = {{"prettierd", "prettier"}},
    js = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    yaml = { "prettier" },
    cs = { "csharpier" },
  },
formatters = {
    csharpier = {
      command = "dotnet-csharpier",
      args = "--write-stdout",
      stdin = true,
    },
  },
  format_on_save = {
    csharpier = {
      command = "dotnet-csharpier",
      args = { "--write-stdout" },
    },
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  format_after_save = {
    lsp_format = "fallback",
  },
}

require("conform").setup(options)
