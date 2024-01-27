(module config.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             util config.util
             packer packer}})

(defn- safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :config.plugin. name))]
    (when (not ok?)
      (print (.. "config error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name)))))))
  nil)

;;; plugins managed by packer
;;; :mod specifies namespace under plugin directory

(use
  ;; plugin Manager
  :wbthomason/packer.nvim {}
  ;; nvim config and plugins in Fennel
  :Olical/aniseed {:branch :develop}

  ;; theme
  :folke/tokyonight.nvim {:mod :theme}
  :nvim-tree/nvim-web-devicons {}

  ;; status line
  :nvim-lualine/lualine.nvim {:mod :lualine}

  ;; file searching
  :nvim-telescope/telescope.nvim {:requires [:nvim-telescope/telescope-ui-select.nvim
                                             :nvim-lua/popup.nvim
                                             :nvim-lua/plenary.nvim]
                                  :mod :telescope}

  ;; repl tools
  :Olical/conjure {:branch :master :mod :conjure}

  ;; sexp
  :guns/vim-sexp {:mod :sexp}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-repeat {}
  :tpope/vim-surround {}

  ;; parsing system
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}

  ;; lsp
  :neovim/nvim-lspconfig {:mod :lspconfig}

  ; snippets
  :L3MON4D3/LuaSnip {:requires [:saadparwaiz1/cmp_luasnip]}

  ;; autocomplete
  :hrsh7th/nvim-cmp {:requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-vsnip
                                :PaterJason/cmp-conjure]
                     :mod :cmp}
 ; " Specify your required plugins here.
 ; Plug 'liuchengxu/vim-better-default'
 ; Plug 'easymotion/vim-easymotion'
 ; Plug 'guns/vim-sexp'
 ; Plug 'tpope/vim-sexp-mappings-for-regular-people'
 ; Plug 'tpope/vim-surround'
 ; Plug 'sjbach/lusty'
 ; ""Plug 'neoclide/coc.nvim', {'branch': 'release'}
 ; ""Plug 'jiangmiao/auto-pairs', { 'tag': 'v2.0.0' }
 ; Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 ; Plug 'junegunn/fzf.vim'
 ; Plug 'Olical/conjure'
 ; Plug 'Shougo/deoplete.nvim'
 ; Plug 'ncm2/float-preview.nvim'
 ; Plug 'w0rp/ale'
 :easymotion/vim-easymotion {}
 :sjbach/lusty {}
 ;:junegunn/fzf.vim {:requires [:junegunn/fzf]}
 :ibhagwan/fzf-lua {:requires [:nvim-tree/nvim-web-devicons]}
 ;:frazrepo/vim-rainbow {:mod :parens}
 ;nmap s <Plug>(easymotion-prefix)

;(nvim.set_keymap :n :s :<nop> {:noremap true})
;(nvim.set_keymap :n :s :<Plug>:easymotion-prefix {:noremap true})
; vim.keymap.set('i', '<C-j>', '<Plug>(easymotion-bd-w)', { remap = true} ) 
  )
