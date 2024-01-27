local _2afile_2a = "/Users/bobby/.config/nvim/fnl/config/plugin/cmp.fnl"
local _2amodule_name_2a = "config.plugin.cmp"
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
local cmp, luasnip, nvim = autoload("cmp"), autoload("luasnip"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["cmp"] = cmp
_2amodule_locals_2a["luasnip"] = luasnip
_2amodule_locals_2a["nvim"] = nvim
local cmp_src_menu_items = {buffer = "buff", conjure = "conj", nvim_lsp = "lsp", vsnip = "vsnp", luasnip = "lsnp"}
_2amodule_locals_2a["cmp-src-menu-items"] = cmp_src_menu_items
local cmp_srcs = {{name = "nvim_lsp"}, {name = "conjure"}, {name = "buffer"}, {name = "vsnip"}, {name = "luasnip"}}
_2amodule_locals_2a["cmp-srcs"] = cmp_srcs
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return ((col ~= 0) and (((vim.api.nvim_buf_get_lines(0, (line - 1), line, true))[1]):sub(col, col):match("%s") == nil))
end
local function _1_(entry, item)
  item.menu = (cmp_src_menu_items[entry.source.name] or "")
  return item
end
local function _2_(fallback)
  if cmp.visible() then
    return cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    return luasnip.expand_or_jump()
  elseif has_words_before() then
    return cmp.complete()
  elseif "else" then
    return fallback()
  else
    return nil
  end
end
local function _4_(fallback)
  if cmp.visible() then
    return cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    return luasnip.jump(-1)
  elseif "else" then
    return fallback()
  else
    return nil
  end
end
local function _6_(args)
  return luasnip.lsp_expand(args.body)
end
cmp.setup({formatting = {format = _1_}, mapping = {["<C-p>"] = cmp.mapping.select_prev_item(), ["<C-n>"] = cmp.mapping.select_next_item(), ["<C-b>"] = cmp.mapping.scroll_docs(( - 4)), ["<C-f>"] = cmp.mapping.scroll_docs(4), ["<C-Space>"] = cmp.mapping.complete(), ["<C-e>"] = cmp.mapping.close(), ["<CR>"] = cmp.mapping.confirm({behavior = cmp.ConfirmBehavior.Insert, select = true}), ["<Tab>"] = cmp.mapping(_2_, {"i", "s"}), ["<S-Tab>"] = cmp.mapping(_4_, {"i", "s"})}, snippet = {expand = _6_}, sources = cmp_srcs})
return _2amodule_2a