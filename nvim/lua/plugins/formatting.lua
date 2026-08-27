-- Formatting: Conform.nvim configuration (ruff only)
local utils = require("core.utils")

return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true }, function(err, did_edit)
          if not err and did_edit then
            vim.notify("Formatted", vim.log.levels.INFO)
          end
        end)
      end,
      mode = { "n", "v" },
      desc = "Format",
    },
  },
  opts = {
    formatters_by_ft = {
      python = { "ruff_format", "ruff_fix" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = {
      timeout_ms = 1800,
      lsp_format = "fallback",
    },
    formatters = {
      ruff_format = {
        prepend_args = utils.ruff_config_args,
      },
      ruff_fix = {
        prepend_args = utils.ruff_config_args,
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}