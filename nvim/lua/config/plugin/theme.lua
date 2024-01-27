local _2afile_2a = "/Users/bobby/.config/nvim/fnl/config/plugin/theme.fnl"
local _2amodule_name_2a = "config.plugin.theme"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local core, nvim, theme, util = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("tokyonight"), autoload("tokyonight.util")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["theme"] = theme
_2amodule_locals_2a["util"] = util
local function _1_(colors)
  colors.bg_statusline = util.darken(colors.bg_dark, 0.5)
  return nil
end
local function _2_(highlight, colors)
  highlight.String = {fg = colors.green2}
  highlight.TelescopeNormal = {bg = colors.bg_statusline, fg = colors.fg_dark}
  highlight.TelescopeBorder = {bg = colors.bg_statusline, fg = colors.fg_dark}
  highlight.NvimTreeNormal = {bg = colors.bg_statusline, fg = colors.fg_dark}
  highlight.NvimTreeNormalNC = {bg = colors.bg_statusline, fg = colors.fg_dark}
  highlight.NvimTreeWinSeparator = {bg = colors.bg_statusline, fg = colors.bg_dark}
  highlight.FloatBorder = {bg = colors.bg_statusline, fg = colors.fg_dark}
  highlight.ColorColumn = {bg = colors.bg_statusline, fg = colors.fg_dark}
  highlight.Pmenu = {bg = colors.bg_statusline, fg = colors.fg_dark}
  highlight.NonText = {fg = util.lighten(colors.bg, 0.9)}
  return nil
end
theme.setup({style = "night", styles = {comments = {italic = true}, floats = "dark", functions = {}, keywords = {italic = true}, sidebars = "dark", variables = {}}, on_colors = _1_, on_highlights = _2_, terminal_colors = true})
vim.cmd("colorscheme tokyonight")
return _2amodule_2a