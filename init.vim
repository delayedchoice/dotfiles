call plug#begin()
Plug 'clojure-vim/async-clj-omni'
Plug 'eugen0329/vim-esearch'
Plug 'Keithbsmiley/swift.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-buftabline'
Plug 'duff/vim-bufonly'
Plug 'editorconfig/editorconfig-vim'
Plug 'elixir-lang/vim-elixir'
Plug 'leshill/vim-json'
Plug 'fatih/vim-go'
Plug 'gmarik/Vundle.vim'
Plug 'godlygeek/tabular'
Plug 'groenewege/vim-less'
Plug 'guns/vim-clojure-static'
Plug 'itchyny/lightline.vim'
Plug 'itspriddle/vim-marked'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'nono/vim-handlebars'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'rizzatti/dash.vim'
Plug 'rizzatti/funcoo.vim'
Plug 'numkil/ag.nvim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'sickill/vim-pasta'
Plug 'sjbach/lusty'
Plug 'therubymug/vim-pyte'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-salve'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'
Plug 'Olical/conjure' , { 'tag': 'v2.1.2', 'do': 'bin/compile'  }
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vividchalk'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/SyntaxRange'
Plug 'wgibbs/vim-irblack'
Plug 'xolox/vim-misc'
Plug 'easymotion/vim-easymotion'
Plug 'diepm/vim-rest-console'
Plug 'tomtom/tcomment_vim'
Plug 'mtth/scratch.vim'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
"Plug 'venantius/vim-cljfmt'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'venantius/vim-cljfmt'
call plug#end()
filetype plugin indent on
"
" }}}
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'use':        ['visual', 'word_under_cursor', 'last'],
  \}
let g:ale_linters = {
      \ 'clojure': ['clj-kondo', 'joker']
      \}
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

let g:asyncrun_exit = 'e %'
autocmd BufWritePost *.js AsyncRun eslint --fix %

let g:ctrlp_working_path_mode = 0

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor
let g:paredit_mode=0

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g --hidden ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  nnoremap F :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>
"  let g:ag_working_path_mode="r"
endif
nnoremap Q q
" Basic settings {{{
syntax on
set modelines=0
set hidden                          " Hide buffer when abandoned
set backspace=indent,eol,start
set tabstop=2                       " Number of spaces for a tab
set softtabstop=2                   " Number of spaces for a tab when editing
set shiftwidth=2                    " Number of spaces to indent
set expandtab                       " Expand tabs to spaces
set smarttab                        " Use shiftwidth when inserting tabs at beginning of line
scriptencoding utf-8
set encoding=utf-8                  " Set file encoding
set shiftround                      " Round indentation to multiple of shiftwidth
set showmode                        " Show the current mode
set showmatch                       " Show matching bracker
set showcmd                         " Show command at bottom of screen
set ignorecase                      " Ignore case when searching
set smartcase                       " Override ignorecase when search string has upper case characters
set wildmenu                        " Enhanced command-line completion
set wildmode=list:longest           " List all matches
set nocursorline                      " Highlight current linek
set ttyfast                         " Fast terminal connection (faster redraw)
set ruler                           " Show current line and column
set hlsearch                        " Highlight current matches
set incsearch                       " Incremental search
set title                           " Set titlebar to current file
set visualbell                      " Use a visual bell instead of audible bell
set noerrorbells                    " Turn off error bells
set nobackup                        " Don't create a backup of a file
set noswapfile                      " Don't create a swap file
set autoindent                      " Indent like previous line
set copyindent                      " Copy indentation
set directory=/tmp                  " Directory for swap files
set laststatus=2                    " Always show status line
set scrolloff=3                     " Minimum number of lines above/below cursor
set guioptions-=r                   " Remove scrollbar
set guioptions-=T                   " Remove toolbar
set guioptions+=e                   " Use GUI tabs
set clipboard=unnamedplus               " Use system clipboard
set pastetoggle=<F3>                " Key to toggle paste mode
set gdefault                        " Set default to global
set number                          " Show line numbers
set nolist                          " Don't show $ at ends of lines
set autoread                        " Automatically reload changed files
set noshowmode
nmap ; :
map ; :
" Set up GUI options
if has("gui_running")
  :set columns=120 lines=70
  if has("gui_gtk2")
    :set guifont=Source\ Code\ Pro\ for\ Powerline\ 18
  else
    :set guifont=Source\ Code\ Pro\ for\ Powerline:h18
  endif
endif
nnoremap Q <nop>                    " Turn off Ex mode
" }}}

" Leader settings {{{
let mapleader = "\<Space>"
let maplocalleader = "\\"
" }}}

" Various mappings {{{
nnoremap / /\v
vnoremap / /\v
nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap <tab> %
vnoremap <tab> %
nnoremap <silent> <leader>/ :nohlsearch<cr>
cnoremap w!! w !sudo tee % >/dev/null
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>v V`]
nnoremap <leader>- yyp<esc>:s/./-/<cr>:nohlsearch<cr>
nnoremap <leader>= yyp<esc>:s/./=/<cr>:nohlsearch<cr>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>cd :cd %:p:h<cr>
nnoremap <leader>json :%!python -m json.tool<cr>
nnoremap <leader>xml :%!xmllint --format -<cr>
nnoremap - ddp
nnoremap _ ddkP
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
inoremap jj <esc>
inoremap kk <esc>
inoremap jk <esc>
inoremap <c-u> <esc>viwUi
nnoremap <c-u> viwU
vnoremap < <gv
vnoremap > >gv
nnoremap <leader>da :%d<cr>

" Move visual block up or down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
" }}}

" Buffer settings {{{
" New buffer
nnoremap <M-t> :enew<cr>
" Next buffer
nnoremap <M-l> :bnext<cr>
" Previous buffer
nnoremap <M-h> :bprevious<cr>
" Close current buffer and move to previous buffer
nnoremap <leader>bq :bp <bar> bd #<cr>
" }}}

" Operator Pending mappings {{{
onoremap p i(
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
" }}}

" Focus Lost settings ---------------------- {{{
augroup focus_lost
  autocmd!
  autocmd FocusLost * silent! :wa
augroup END
" }}}

" Source .vimrc on save ---------------------- {{{
autocmd! bufwritepost .vimrc source $MYVIMRC
" }}}

" JavaScript file settings {{{
augroup javascript
  autocmd!
  autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
  autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
augroup end
"}}}

" HTML file settings {{{
augroup html
  autocmd!
  autocmd FileType html nnoremap <buffer> <localleader>c I\<!-- <esc>A --\><esc>
  autocmd FileType html :iabbrev <buffer> --- &mdash;
augroup end
"}}}

" Vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Abbreviations {{{
:iabbrev ot to
:iabbrev em rwarner@grailbox.com
" }}}
" Easy Motion Settings {{{
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" }}}
" Corona SDK settings {{{
nnoremap <leader>rc :!/Applications/CoronaSDK/simulator -project %:p -skin iPhone<cr>
nnoremap <leader>rC :!/Applications/CoronaSDK/simulator -project %:p -skin iPad<cr>
" }}}

" NERDTree settings {{{
let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let NERDTreeHighlightCursorline=1
let NERDTreeMouseMode=2
nnoremap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
nnoremap <leader>N :NERDTreeClose<CR>
" }}}

" CtrlP settings {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"set wildignore+=*/tmp/*,*.so,*.o,*.swp,*.zip,*.class,*/bower_components/*,*/node_modules/*
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>o :CtrlP<cr>
" }}}

" vim-json settings {{{
let g:vim_json_syntax_conceal = 0
augroup filetype_json
  autocmd!
  autocmd FileType json setlocal foldmethod=syntax
augroup END
" }}}

" Tagbar settings {{{
"nnoremap <leader>l :TagbarToggle<cr><C-w>l
"inoremap <leader>l :TagbarToggle<cr><C-w>l
"vnoremap <leader>l :TagbarToggle<cr><C-w>l

let g:tagbar_type_objc = {
    \ 'ctagstype' : 'ObjectiveC',
    \ 'kinds'     : [
        \ 'i:interface',
        \ 'I:implementation',
        \ 'p:Protocol',
        \ 'm:Object_method',
        \ 'c:Class_method',
        \ 'v:Global_variable',
        \ 'F:Object field',
        \ 'f:function',
        \ 'p:property',
        \ 't:type_alias',
        \ 's:type_structure',
        \ 'e:enumeration',
        \ 'M:preprocessor_macro',
    \ ],
    \ 'sro'        : ' ',
    \ 'kind2scope' : {
        \ 'i' : 'interface',
        \ 'I' : 'implementation',
        \ 'p' : 'Protocol',
        \ 's' : 'type_structure',
        \ 'e' : 'enumeration'
    \ },
    \ 'scope2kind' : {
        \ 'interface'      : 'i',
        \ 'implementation' : 'I',
        \ 'Protocol'       : 'p',
        \ 'type_structure' : 's',
        \ 'enumeration'    : 'e'
    \ }
\ }
" }}}

" Latex-Suite settings {{{
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
" }}}

" Rainbow Parentheses settings {{{
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" }}}

" NeoVim does not have Ruby support yet {{{
let g:LustyJugglerSuppressRubyWarning = 1
" }}}

" GeekNote settings {{{
"nnoremap <leader>gn :Geeknote<cr>
" }}}

" incsearch settings {{{
"map /  <Plug>(incsearch-forward)
"map ?  <Plug>(incsearch-backward)
"map g/ <Plug>(incsearch-stay)
" }}}

" Livedown settings {{{
let g:livedown_autorun = 1
" }}}

" Scratch settings {{{
let g:scratch_horizontal = 1
" }}}


" Emmet settings {{
 let g:user_emmet_install_global = 1
" autocmd FileType js,html,css EmmetInstall
" let g:user_emmet_leader_key='<c z>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}
" }}}

" Syntastic settings {{{
let g:syntastic_c_checkers = ['cppcheck']
" }}}

" Buftabline settings {{{
let g:buftabline_indicators = 1
let g:buftabline_separators = 1
highlight default link BufTabLineActive TabLineSel
highlight default link BufTabLineCurrent PmenuSel
" }}}
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
" }}}
let g:ctrlp_user_command = 'ag %s -l -nocolor -g .'
let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height
" Set the background theme to dark
set background = "dark"
" Call the theme one
"set colorscheme = "one"
"(one is the name of color scheme)
" Don't forget set the airline theme as well.
let g:airline_theme = 'dark'
" This line enables the true color support.
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Note, the above line is ignored in Neovim 0.1.5 above, use this line instead.
set termguicolors
colorscheme elflord
" Lightline settings {{{
let g:lightline = {
      \   'colorscheme': 'wombat',
      \   'active': {
      \     'left': [
      \       [ 'mode', 'paste' ],
      \       [ 'fugitive', 'filename' ],
      \       [ 'ctrlpmark' ]
      \     ],
      \     'right': [
      \       [ 'syntastic', 'lineinfo' ],
      \       [ 'percent' ],
      \       [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \   },
      \   'component': {
      \     'lineinfo': '%3l:%-2v'
      \   },
      \   'component_function': {
      \     'fugitive'    : 'MyFugitive',
      \     'filename'    : 'MyFilename',
      \     'fileformat'  : 'MyFileformat',
      \     'filetype'    : 'MyFiletype',
      \     'fileencoding': 'MyFileencoding',
      \     'mode'        : 'MyMode',
      \     'ctrlpmark'   : 'CtrlPMark'
      \   },
      \   'component_expand': {
      \     'syntastic': 'SyntasticStatuslineFlag',
      \   },
      \   'component_type': {
      \     'syntastic': 'error',
      \   },
      \   'separator': {
      \     'left': '',
      \     'right': ''
      \   },
      \   'subseparator': {
      \     'left': '',
      \     'right': ''
      \   },
		  \   'tab': {
		  \     'active': [ 'tabnum', 'filename', 'modified' ],
		  \     'inactive': [ 'tabnum', 'filename', 'modified' ]
      \   },
      \   'tabline': {
      \     'left': [
      \       [ 'tabs' ]
      \     ],
      \     'right': [
      \       [ 'close' ]
      \     ]
      \   }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? '' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ' '
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
    let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
" }}}

call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
let g:deoplete#enable_at_startup = 1
set completeopt-=preview

let g:float_preview#docked = 0
let g:float_preview#max_width = 80
let g:float_preview#max_height = 40

"{{{
let g:conjure_nmap_eval_word = '<leader>ew'
let g:conjure_nmap_eval_current_form = '<leader>ei'
let g:conjure_vmap_eval_selection = '<leader>e'
let g:conjure_nmap_eval_root_form = '<leader>eo'
let g:conjure_nmap_eval_buffer = '<leader>eb'
let g:conjure_nmap_source = '<leader>ss'
let g:conjure_nmap_definition = '<leader>gd'
let g:conjure_nmap_toggle_log = '<leader>tl'
let g:conjure_nmap_run_tests =  '<leader>rt'
let g:conjure_log_direction = "horizontal"
let g:conjure_log_blacklist = ["up", "ret", "ret-multiline", "load-file", "eval"]
let g:conjure_quick_doc_normal_mode = v:false

"}}}
