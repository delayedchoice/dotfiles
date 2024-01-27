local _2afile_2a = "/Users/bobby/.config/nvim/fnl/config/init.fnl"
local _2amodule_name_2a = "config.init"
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
local core, nvim, str, util = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("aniseed.string"), autoload("config.util")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["str"] = str
_2amodule_locals_2a["util"] = util
nvim.set_keymap("i", "jj", "<ESC>", {noremap = true})
nvim.set_keymap("i", "kk", "<ESC>", {noremap = true})
nvim.set_keymap("n", "<space>", "<nop>", {noremap = true})
nvim.g.mapleader = " "
nvim.g.maplocalleader = ";"
nvim.ex.set("nowrap")
do
  local options = {completeopt = "menuone,noselect", ignorecase = true, smartcase = true, clipboard = "unnamedplus", relativenumber = true, rnu = true, number = true}
  for option, value in pairs(options) do
    core.assoc(nvim.o, option, value)
  end
end
require("config.plugin")
return _2amodule_2a