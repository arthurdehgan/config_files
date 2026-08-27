-- ============================================================================
-- VSCode Gruvbox Dark Hard overrides
-- Matches the custom colors in $HOME/.config/Code/User/settings.json
-- ============================================================================

local M = {}

-- VSCode custom palette
local c = {
  editor_bg      = "#181818", -- editor.background
  panel_bg       = "#2a2727", -- panel.background
  sidebar_bg     = "#232121", -- sideBar.background
  statusline_bg  = "#0c1116", -- statusBar.background
  foreground     = "#e3e3e3", -- foreground / editor.foreground
  active_fg      = "#ffffff", -- tab.activeForeground
  inactive_fg    = "#d5d5d5", -- tab.inactiveForeground
  string         = "#d99077", -- Python strings (textmate)
  comment        = "#b2b0b4", -- docstrings/comments (italic)
  variable       = "#f3f2e6", -- variables/params/properties (semantic)
  muted          = "#9a9a9a", -- muted foreground for line numbers
}

local function set_hl(name, val)
  vim.api.nvim_set_hl(0, name, val)
end

function M.setup()
  -- Core
  set_hl("Normal", { fg = c.foreground, bg = c.editor_bg })
  set_hl("NormalNC", { fg = c.foreground, bg = c.editor_bg })
  set_hl("NormalFloat", { fg = c.foreground, bg = c.panel_bg })
  set_hl("FloatBorder", { fg = c.panel_bg, bg = c.panel_bg })
  set_hl("SignColumn", { fg = c.foreground, bg = c.editor_bg })
  set_hl("StatusColumn", { fg = c.foreground, bg = c.editor_bg })
  set_hl("CursorLine", { bg = "#1f1f1f" })
  set_hl("LineNr", { fg = c.muted, bg = c.editor_bg })
  set_hl("CursorLineNr", { fg = c.foreground, bg = c.editor_bg })

  -- Statusline (VSCode statusBar #0c1116)
  set_hl("StatusLine", { fg = c.foreground, bg = c.statusline_bg })
  set_hl("StatusLineNC", { fg = c.inactive_fg, bg = c.statusline_bg })
  set_hl("MiniStatuslineModeNormal", { fg = c.foreground, bg = c.statusline_bg })
  set_hl("MiniStatuslineModeInsert", { fg = c.foreground, bg = c.statusline_bg })
  set_hl("MiniStatuslineModeVisual", { fg = c.foreground, bg = c.statusline_bg })
  set_hl("MiniStatuslineModeReplace", { fg = c.foreground, bg = c.statusline_bg })
  set_hl("MiniStatuslineModeCommand", { fg = c.foreground, bg = c.statusline_bg })
  set_hl("MiniStatuslineModeOther", { fg = c.foreground, bg = c.statusline_bg })
  set_hl("MiniStatuslineDevinfo", { fg = c.foreground, bg = c.statusline_bg })
  set_hl("MiniStatuslineFilename", { fg = c.foreground, bg = c.statusline_bg })
  set_hl("MiniStatuslineFileinfo", { fg = c.foreground, bg = c.statusline_bg })
  set_hl("MiniStatuslineInactive", { fg = c.inactive_fg, bg = c.statusline_bg })

  -- Completion menu (quickInput #181818, dropdown #181818)
  set_hl("Pmenu", { fg = c.foreground, bg = c.sidebar_bg })
  set_hl("PmenuSel", { fg = c.active_fg, bg = "#3a3636" })
  set_hl("PmenuSbar", { bg = c.sidebar_bg })
  set_hl("PmenuThumb", { bg = "#504945" })
  set_hl("PmenuExtra", { fg = c.inactive_fg, bg = c.sidebar_bg })
  set_hl("BlinkCmpMenu", { fg = c.foreground, bg = c.sidebar_bg })
  set_hl("BlinkCmpMenuBorder", { fg = c.sidebar_bg, bg = c.sidebar_bg })
  set_hl("BlinkCmpMenuSelection", { fg = c.active_fg, bg = "#3a3636" })
  set_hl("BlinkCmpLabel", { fg = c.foreground, bg = c.sidebar_bg })
  set_hl("BlinkCmpLabelDetail", { fg = c.inactive_fg, bg = c.sidebar_bg })
  set_hl("BlinkCmpLabelDescription", { fg = c.inactive_fg, bg = c.sidebar_bg })
  set_hl("BlinkCmpDoc", { fg = c.foreground, bg = c.panel_bg })
  set_hl("BlinkCmpDocBorder", { fg = c.panel_bg, bg = c.panel_bg })

  -- Floats / pickers (panel #2a2727)
  set_hl("WhichKeyFloat", { fg = c.foreground, bg = c.panel_bg })
  set_hl("SnacksPicker", { fg = c.foreground, bg = c.panel_bg })
  set_hl("SnacksPickerBorder", { fg = c.panel_bg, bg = c.panel_bg })
  set_hl("SnacksPickerPreview", { bg = c.panel_bg })
  set_hl("SnacksPickerPreviewBorder", { fg = c.panel_bg, bg = c.panel_bg })
  set_hl("SnacksPickerInputBorder", { fg = c.inactive_fg, bg = c.panel_bg })
  set_hl("SnacksPickerInputSearch", { fg = c.foreground, bg = c.panel_bg })
  set_hl("SnacksPickerList", { bg = c.panel_bg })
  set_hl("SnacksPickerListBorder", { fg = c.panel_bg, bg = c.panel_bg })
  set_hl("SnacksPickerListTitle", { fg = c.panel_bg, bg = c.panel_bg })
  set_hl("SnacksPickerSelected", { bg = "#3a3636", fg = c.active_fg })
  set_hl("SnacksPickerCursor", { bg = "#3a3636", fg = c.active_fg })
  set_hl("SnacksPickerPrompt", { fg = c.foreground })
  set_hl("SnacksNotifierNormal", { fg = c.foreground, bg = c.panel_bg })
  set_hl("SnacksNotifierBorder", { fg = c.panel_bg, bg = c.panel_bg })

  -- Explorer (sidebar #232121)
  set_hl("SnacksExplorerNormal", { fg = c.foreground, bg = c.sidebar_bg })
  set_hl("SnacksExplorerDir", { fg = c.foreground })
  set_hl("SnacksExplorerFile", { fg = c.foreground })
  set_hl("SnacksExplorerTitle", { fg = c.sidebar_bg, bg = c.sidebar_bg })
  set_hl("SnacksExplorerBorder", { fg = c.sidebar_bg, bg = c.sidebar_bg })
  set_hl("SnacksExplorerSelected", { bg = "#3a3636", fg = c.active_fg })

  -- Syntax tokens (VSCode customizations, applied globally)
  set_hl("String", { fg = c.string })
  set_hl("TSString", { fg = c.string })
  set_hl("Comment", { fg = c.comment, italic = true })
  set_hl("TSComment", { fg = c.comment, italic = true })
  set_hl("SpecialComment", { fg = c.comment, italic = true })
  set_hl("Todo", { fg = c.comment, italic = true })

  -- Variables / parameters / properties (#f3f2e6)
  set_hl("TSVariable", { fg = c.variable })
  set_hl("TSParameter", { fg = c.variable })
  set_hl("TSProperty", { fg = c.variable })
  set_hl("TSField", { fg = c.variable })
  set_hl("TSVariableBuiltin", { fg = c.variable })
  set_hl("TSParameterReference", { fg = c.variable })

  set_hl("LspInlayHint", { fg = c.muted, bg = c.editor_bg })
end

-- Re-apply on colorscheme changes (e.g. via <leader>uC)
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    M.setup()
  end,
})

return M