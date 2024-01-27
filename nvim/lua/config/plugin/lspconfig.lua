local _2afile_2a = "/Users/bobby/.config/nvim/fnl/config/plugin/lspconfig.fnl"
local _2amodule_name_2a = "config.plugin.lspconfig"
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
local cmplsp, lsp, nvim = autoload("cmp_nvim_lsp"), autoload("lspconfig"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["cmplsp"] = cmplsp
_2amodule_locals_2a["lsp"] = lsp
_2amodule_locals_2a["nvim"] = nvim
local progress_message = {status = "", percent = 0, msg = ""}
local function get_progress_message()
  return progress_message
end
_2amodule_2a["get-progress-message"] = get_progress_message
local function progress_handler(_, msg, info)
  local client = vim.lsp.get_client_by_id(info.client_id)
  if client then
    progress_message.status = msg.value.kind
    if (msg.value.percentage ~= nil) then
      progress_message.percent = msg.value.percentage
    else
    end
    if ((msg.value.message ~= nil) and ((msg.token ~= nil) and (type(tonumber(msg.token)) ~= "number"))) then
      progress_message.msg = (msg.token .. " : " .. msg.value.message)
      return nil
    elseif (msg.value.message ~= nil) then
      progress_message.msg = msg.value.message
      return nil
    elseif (msg.token ~= nil) then
      progress_message.msg = msg.token
      return nil
    else
      return nil
    end
  else
    return nil
  end
end
_2amodule_2a["progress-handler"] = progress_handler
local function setup_progress_handler()
  local original_handler = vim.lsp.handlers["$/progress"]
  local function _4_(...)
    local args = vim.F.pack_len(...)
    progress_handler(vim.F.unpack_len(args))
    return original_handler(...)
  end
  vim.lsp.handlers["$/progress"] = _4_
  return nil
end
_2amodule_2a["setup-progress-handler"] = setup_progress_handler
setup_progress_handler()
local function define_signs(prefix)
  local error = (prefix .. "SignError")
  local warn = (prefix .. "SignWarn")
  local info = (prefix .. "SignInfo")
  local hint = (prefix .. "SignHint")
  vim.fn.sign_define(error, {text = "\239\129\151", texthl = error})
  vim.fn.sign_define(warn, {text = "\239\129\177", texthl = warn})
  vim.fn.sign_define(info, {text = "\239\129\154", texthl = info})
  return vim.fn.sign_define(hint, {text = "\239\129\153", texthl = hint})
end
_2amodule_2a["define-signs"] = define_signs
define_signs("Diagnostic")
do
  local handlers = {["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {severity_sort = true, underline = true, virtual_text = false, update_in_insert = false}), ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "single"}), ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})}
  local capabilities = cmplsp.default_capabilities()
  local before_init
  local function _5_(params)
    params.workDoneToken = "1"
    return nil
  end
  before_init = _5_
  local on_attach
  local function _6_(client, bufnr)
    nvim.buf_set_keymap(bufnr, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>ld", "<Cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>ln", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>le", "<cmd>lua vim.diagnostic.open_float()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_action()<CR> ", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lw", ":lua require('telescope.builtin').diagnostics()<cr>", {noremap = true})
    nvim.buf_set_keymap(bufnr, "n", "<leader>lR", ":lua require('telescope.builtin').lsp_references()<cr>", {noremap = true})
    return nvim.buf_set_keymap(bufnr, "n", "<leader>li", ":lua require('telescope.builtin').lsp_implementations()<cr>", {noremap = true})
  end
  on_attach = _6_
  lsp.clojure_lsp.setup({on_attach = on_attach, handlers = handlers, before_init = before_init, capabilities = capabilities})
end
return _2amodule_2a