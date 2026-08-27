-- Colorschemes: Theme configurations
return {
  -- ════════════════════════════════════════════════════════════════════════════
  -- Gruvbox Material (default) - matches VSCode "Gruvbox Dark Hard"
  -- Additional VSCode-aligned overrides live in lua/core/colors.lua
  -- ════════════════════════════════════════════════════════════════════════════
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_foreground = "mix"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_float_style = "bright"
      vim.g.gruvbox_material_statusline_style = "mix"
      vim.g.gruvbox_material_cursor = "auto"
      vim.cmd("colorscheme gruvbox-material")
    end,
  },
}
