local M = {}

-- Find the nearest ruff config file (ruff.toml / .ruff.toml / pyproject.toml)
-- walking up from the current buffer, or nil if none is found.
M.find_ruff_config = function()
  local file = vim.api.nvim_buf_get_name(0)
  if file == "" then
    return nil
  end

  local dir = vim.fn.fnamemodify(file, ":h")
  while dir ~= "/" and dir ~= "" do
    for _, name in ipairs({ "ruff.toml", ".ruff.toml", "pyproject.toml" }) do
      local path = dir .. "/" .. name
      if vim.fn.filereadable(path) == 1 then
        return path
      end
    end
    dir = vim.fn.fnamemodify(dir, ":h")
  end

  return nil
end

-- Return ruff args pointing at the nearest config, or {} to use ruff defaults.
M.ruff_config_args = function(_ctx)
  local path = M.find_ruff_config()
  if path then
    return { "--config", path }
  end
  return {}
end

-- Lightweight TOML scan for ruff indentation settings:
-- indent-style from [format] / [tool.ruff.format], indent-width from top level / [tool.ruff].
local function parse_ruff_indent(path)
  local indent_style = "space"
  local indent_width = 4
  local section = ""

  for line in io.lines(path) do
    line = line:gsub("%s+$", "")
    local header = line:match("^%[([^%]]+)%]")
    if header then
      section = header
    elseif not line:match("^%s*#") and not line:match("^%s*$") then
      if section == "format" or section == "tool.ruff.format" then
        local style = line:match('^indent%-style%s*=%s*"([^"]+)"')
        if style then
          indent_style = style
        end
      end
      if section == "" or section == "tool.ruff" then
        local width = line:match("^indent%-width%s*=%s*(%d+)")
        if width then
          indent_width = tonumber(width)
        end
      end
    end
  end

  return indent_style, indent_width
end

-- Set buffer-local indentation to match the project's ruff config.
M.apply_python_indent = function()
  local path = M.find_ruff_config()
  if not path then
    return
  end

  local indent_style, indent_width = parse_ruff_indent(path)
  vim.opt_local.expandtab = indent_style ~= "tab"
  vim.opt_local.shiftwidth = indent_width
  vim.opt_local.tabstop = indent_width
  vim.opt_local.softtabstop = indent_width
end

return M