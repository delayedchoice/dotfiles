local _2afile_2a = "/Users/bobby/.config/nvim/fnl/config/plugin/lualine.fnl"
local _2amodule_name_2a = "config.plugin.lualine"
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
local core, lsp, lualine = autoload("aniseed.core"), autoload("config.plugin.lspconfig"), autoload("lualine")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["lsp"] = lsp
_2amodule_locals_2a["lualine"] = lualine
local function lsp_connection()
  local message = lsp["get-progress-message"]()
  if ((message.status == "begin") or (message.status == "report")) then
    return (message.msg .. " : " .. message.percent .. "%% \239\130\150")
  elseif (message.status == "end") then
    return "\239\131\136"
  else
    return "\239\130\150"
  end
end
_2amodule_2a["lsp_connection"] = lsp_connection
lualine.setup({options = {theme = "tokyonight", icons_enabled = true, section_separators = {"", ""}, component_separators = {"\239\145\138", "\239\144\184"}}, sections = {lualine_a = {}, lualine_b = {{"mode", {upper = true}}}, lualine_c = {{"FugitiveHead"}, {"filename", file_status = true, path = 1, shorting_target = 40}}, lualine_x = {{"diagnostics", sections = {"error", "warn", "info", "hint"}, sources = {"nvim_lsp"}}, {lsp_connection}, "location", "filetype"}, lualine_y = {"encoding"}, lualine_z = {}}, inactive_sections = {lualine_a = {}, lualine_b = {}, lualine_c = {{"filename", file_status = true, path = 1}}, lualine_x = {}, lualine_y = {}, lualine_z = {}}})
return _2amodule_2a