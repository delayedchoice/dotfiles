local _2afile_2a = "/Users/bobby/.config/nvim/fnl/config/plugin/sexp.fnl"
local _2amodule_name_2a = "config.plugin.sexp"
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
local nvim = autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
nvim.g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel,janet"
return _2amodule_2a