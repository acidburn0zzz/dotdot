" vimrc

" Turn off vi compatibility
"   This should always be set by default anyway but some distros might muck it up.
set nocompatible

" Sensible.vim - provides a lot of sane defaults.
"   https://github.com/tpope/vim-sensible
" That's why many "usual suspects" are missing from this vimrc.
" Loading it now with `runtime!` allows us to override things later in this
" file.
runtime! plugin/sensible.vim

" Enable matchit
runtime macros/matchit.vim

" Colors
if has("mac")
  " Eventually I'd like to get true colour working over SSH too, but for now
  " we'll have to settle for 256 colours on non-Mac machines.
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  " Fixes tmux 24-bit color issues
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"  " Fixes tmux 24-bit color issues
  set termguicolors                       " Enable 24-bit color
endif
syntax on
set background=dark
colorscheme gruvbox 
let g:airline_theme='gruvbox'

" Airline
"   - Don't use powerline font separator symbols
"   - Set up some sensible symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Indentation
set shiftwidth=2  " 1 tab == 2 spaces
set tabstop=2
set expandtab     " Spaces instead of tabs
set ai            " Auto indent
set si            " Smart indent

" Word wrapping
set wrap          " Wrap lines
set breakindent   " Word wrap continues at same column

" List mode
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" UI Tweaks
set number        " Line numbers
set foldcolumn=1  " Add some padding left of the line numbers
set noshowmode    " Don't need showmode as lightline status line is enough
set cursorline    " Highlight current line

" Remove trailing whitespace for non-whitespace sensitive file types
autocmd FileType c,cpp,java,php,html,ruby,yaml,css autocmd BufWritePre <buffer> %s/\s\+$//e

" Add ignore option to not have CtrlP and wild menu look in useless folders
set wildignore+=*/tmp/*,*/_site/*

" Don't create backup and swap files (that's what Git is for)
set nobackup
set noswapfile

" Make ; behave like :
nmap ; :

" Make the quickfix window auto-open
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Pane/window management
"" vim-tmux-navigator: Don't use default mappings
let g:tmux_navigator_no_mappings = 1

"" vim-tmux-navigator: Mappings to match tmux.conf
nnoremap <silent> <Leader><Left>  :TmuxNavigateLeft<cr>
nnoremap <silent> <Leader><Down>  :TmuxNavigateDown<cr>
nnoremap <silent> <Leader><Up>    :TmuxNavigateUp<cr>
nnoremap <silent> <Leader><Right> :TmuxNavigateRight<cr>
nnoremap <silent> <Leader>\       :TmuxNavigatePrevious<cr>

"" Remap Ctrl-W to Space for easier pane management
nmap <silent> <Space> <C-w>
" Space Space to switch windows
nmap <silent> <Space><Space> :wincmd w<CR>
" Space | to vsplit and focus new pane
nmap <silent> <Space><bar> :vsplit<CR>:wincmd w<CR>
" Space - to (h)split and focus new pane
nmap <silent> <Space>- :split<CR>:wincmd w<CR>
" Space Tab to open/close NERDTree
nmap <silent> <Space><Tab> :NERDTreeToggle<CR>
" Space C to close quickfix window
nmap <silent> <Space>C :ccl<CR>
" Ctrl-d to :q
nmap <C-d> :q<CR>

" Leader shortcuts
"" Set/unset list
map <silent> <Leader>l :set list!<CR>
"" Set/unset paste
map <silent> <Leader>p :set paste!<CR>
"" Run the current file in rspec
map <silent> <Leader>r :AsyncRun bundle exec rspec %<CR>
"" Run rake without an argument (runs all specs)
map <silent> <Leader>R :AsyncRun bundle exec rake<CR>
