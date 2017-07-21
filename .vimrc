set nocompatible

" ---------------------------------------------------------------------
" ----- Plugins through Vim-plug --------------------------------------
" ---------------------------------------------------------------------
  call plug#begin('~/.vim/plugged')

  " plugins will go here (see next step)
  " (be sure to replace 'Plugin' with 'Plug')
  Plug 'altercation/vim-colors-solarized'
  Plug 'tomasr/molokai'
  Plug 'bling/vim-airline'
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
"  Plug 'scrooloose/syntastic'
"  Plug 'xolox/vim-misc'
"  Plug 'xolox/vim-easytags'
  Plug 'majutsushi/tagbar'
  Plug 'kien/ctrlp.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
"  Plug 'Raimondi/delimitMate'
  Plug 'christoomey/vim-tmux-navigator'
"  Plug 'cakebaker/scss-syntax.vim'
  Plug 'mileszs/ack.vim'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-endwise'
  Plug 'ervandew/supertab'
  Plug 'scrooloose/nerdcommenter'
"  Plug 'mattn/emmet-vim'
"  Plug 'pangloss/vim-javascript'
"  Plug 'mxw/vim-jsx'
"  Plug 'junegunn/vim-easy-align'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'slim-template/vim-slim'
  Plug 'mustache/vim-mustache-handlebars'

  " Highlight and strip trailing whitespace
  Plug 'ntpeters/vim-better-whitespace'

  " Align CSV files at commas, align Markdown tables, and more
  Plug 'godlygeek/tabular'


  call plug#end()

" ---------------------------------------------------------------------
" ----- General Settings ---------------------------------------------------
" ---------------------------------------------------------------------
  " Use Vim settings, rather than Vi settings (much better!).
  " This must be first, because it changes other options as a side effect.
  set nocompatible

  " allow backspacing over everything in insert mode
  set backspace=indent,eol,start

  set history=1000       " keep 1000 lines of command line history
  set number             " line numbers
  set ruler              " show the cursor position all the time
  set showcmd            " display incomplete commands
  set incsearch          " do incremental searching
  set linebreak          " wrap lines on 'word' boundaries
  set scrolloff=3        " don't let the cursor touch the edge of the viewport
  set splitright         " Vertical splits use right half of screen
  set timeoutlen=800     " Lower ^[ timeout
  set fillchars=fold:\ , " get rid of obnoxious '-' characters in folds
  set tildeop            " use ~ to toggle case as an operator, not a motion
  set showcmd
  set incsearch
  set hlsearch
  set ignorecase        " Ignore case when searching. Use \C for case sensitive searches
  set hidden            " Hiding the buffer without first saving the buffer. You will be asked to save the modified buffers when quiting VIM
  set autoread          " VIM reloads file that has been changed externally

  syntax on
  filetype on           " Enable filetype detection
  filetype indent on    " Enable filetype-specific indenting
  filetype plugin on    " Enable filetype-specific plugins

  set mouse=a

  if exists('&breakindent')
    set breakindent      " Indent wrapped lines up to the same level
  endif

  " 80 column line
  if exists('+colorcolumn')
    set colorcolumn=80
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  endif

  :au FocusLost * :wa    "autosave

  " Set the colorscheme
  colorscheme molokai

" ---------------------------------------------------------------------
" ----- UNDO ---------------------------------------------------
" ---------------------------------------------------------------------
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

" ---------------------------------------------------------------------
" ----- VIM-JSX ---------------------------------------------------
" ---------------------------------------------------------------------
  let g:jsx_ext_required = 0

" ---------------------------------------------------------------------
" ----- Tab Setting ---------------------------------------------------
" ---------------------------------------------------------------------
  set expandtab          " Expand tabs into spaces
  set tabstop=2          " default to 2 spaces for a hard tab
  set softtabstop=2      " default to 2 spaces for the soft tab
  set shiftwidth=2       " for when <TAB> is pressed at the beginning of a line

" ---------------------------------------------------------------------
" ----- Key Binding ---------------------------------------------------
" ---------------------------------------------------------------------
  " map <leader> to ,
  let mapleader = " "

  " make jj do ESC
  inoremap jj <esc>

  " Open/close NERDTree Tabs with \t
  nmap <silent> <leader>t :NERDTreeTabsToggle<CR>

  " Navigate buffer
  nnoremap <C-n> :bnext<CR>
  nnoremap <C-p> :bprevious<CR>
  nnoremap <C-b> :CtrlPBuffer<CR>

  " Resize
  nnoremap <silent> <leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
  nnoremap <silent> <leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" ---------------------------------------------------------------------
" ----- Plugin-Specific Settings --------------------------------------
" ---------------------------------------------------------------------
  " ---- NERDCommenter  -------------------------------------------------------
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

  " ---- CTRLP  ---------------------------------------------------------------
    let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|\tags\'

  " ---- Vim-Ruby, Vim-Rails  -------------------------------------------------
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

  " ---- Better Whitespace ------------------------------------------------------
    autocmd FileType javascript,html,ruby autocmd BufWritePre <buffer> StripWhitespace

  " ---- NERDTree ------------------------------------------------------
    " To have NERDTree always open on startup
    " let g:nerdtree_tabs_open_on_console_startup = 0

  " ----- Solarized ----------------------------------------------------
    " Toggle this to "light" for light colorscheme
    set background=dark

    " Uncomment the next line if your terminal is not configured for solarized
    " let g:solarized_termcolors=256


  " ----- Airline ----------------------------------------------------
    " Always show statusbar
    set laststatus=2

    " Fancy arrow symbols, requires a patched font
    " To install a patched font, run over to
    "     https://github.com/abertsch/Menlo-for-Powerline
    " download all the .ttf files, double-click on them and click "Install"
    " Finally, uncomment the next line
    "let g:airline_powerline_fonts = 1

    " Show PASTE if in paste mode
    let g:airline_detect_paste=1

    " Show airline for tabs too
    let g:airline#extensions#tabline#enabled = 1

  " ----- Syntastic ----------------------------------------------------
    let g:syntastic_error_symbol = '✘'
    let g:syntastic_warning_symbol = "▲"
    let g:syntastic_javascript_checkers = ['eslint']

    augroup mySyntastic
      au!
      au FileType tex let b:syntastic_mode = "passive"
    augroup END

  " ----- vim-easytags ----------------------------------
    " Where to look for tags files
     set tags=./tags;,~/.vimtags

    " Sensible defaults
     let g:easytags_events = ['BufReadPost', 'BufWritePost']
     let g:easytags_async = 1
     let g:easytags_dynamic_files = 2
     let g:easytags_resolve_links = 1
     let g:easytags_suppress_ctags_warning = 1

  " ----- Tagbar  -----------------------------------------------
    " Open/close tagbar with \b
    nmap <silent> <leader>b :TagbarToggle<CR>

  " ----- vim-gitgutter ------------------------------------------
    " Required after having changed the colorscheme
    hi clear SignColumn

    " In vim-airline, only display "hunks" if the diff is non-zero
    let g:airline#extensions#hunks#non_zero_only = 1


  " ----- DelimitMate ----------------------------------------------
    let delimitMate_expand_cr = 1
    augroup mydelimitMate
      au!
      au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
      au FileType tex let b:delimitMate_quotes = ""
      au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
      au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
    augroup END

  " ----- Ag ------------------------------------------------------
    if executable('ag')
        let g:ackprg = 'ag --vimgrep'
    endif

    cnoreabbrev Ack Ack!
    nnoremap <Leader>a :Ack!<Space>
