(module config.plugin.fzf
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<C-t> :<nop> {:noremap true})
(nvim.set_keymap :n :<C-t> :<Cmd>FZF<CR> {:noremap true})
