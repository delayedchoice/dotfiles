(module config.init
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util config.util
             str aniseed.string
             }
  import-macros [[ac :aniseed.macros.autocmds]]})

;generic mapping leaders configuration
(nvim.set_keymap :i :jj :<ESC> {:noremap true})
(nvim.set_keymap :i :kk :<ESC> {:noremap true})
(nvim.set_keymap :n :<space> :<nop> {:noremap true})
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ";")

;don't wrap lines
(nvim.ex.set :nowrap)

;let mapleader=" "
;let maplocalleader=";"
;nnoremap <silent> <Leader>f :Rg<CR>
;
;"easymotion
;nmap s <Plug>(easymotion-prefix)
;highlight NormalFloat ctermbg=black

;sets a nvim global options
(let [options
      {;settings needed for compe autocompletion
       :completeopt "menuone,noselect"
       ;case insensitive search
       :ignorecase true
       ;smart search case
       :smartcase true
       ;shared clipboard with linux
       :clipboard "unnamedplus"
       :relativenumber true
       :rnu  true
       :number true
       ;:nu rnu
       }]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))
;autocmd BufWinEnter,BufNewFile,BufRead *.clj* set iskeyword-=.
;autocmd BufWinEnter,BufNewFile,BufRead *.clj* set iskeyword-=-
;autocmd BufWinEnter,BufNewFile,BufRead *.clj* set iskeyword-=/
(ac.autocmd [:BufWinEnter :BufNewFile :BufRead] {:pattern [:*.clj*] :command "set iskeyword-=."})
(ac.autocmd [:BufWinEnter :BufNewFile :BufRead] {:pattern [:*.clj*] :command "set iskeyword-=-"})
(ac.autocmd [:BufWinEnter :BufNewFile :BufRead] {:pattern [:*.clj*] :command "set iskeyword-=/"})

;import plugin.fnl
(require :config.plugin)
