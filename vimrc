" vimrc

" Turn off vi compatibility
"   This should always be set by default anyway but some distros might muck it up.
set nocompatible

" Pathogen: Includes all plugins under .vim/bundle
execute pathogen#infect('~/.vim/bundle/{}')

" Sensible.vim - provides a lot of sane defaults.
"   https://github.com/tpope/vim-sensible
" That's why many "usual suspects" are missing from this vimrc.
" Loading it now with `runtime!` allows us to override things later in this
" file.
runtime! plugin/sensible.vim

" Colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  " Fixes tmux 24-bit color issues
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"  " Fixes tmux 24-bit color issues
set termguicolors                       " Enable 24-bit color
syntax on
set background=dark
colorscheme Base2Tone-Evening-dark
let g:airline_theme='one'

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

" Remove trailing whitespace for non-whitespace sensitive file types
autocmd FileType c,cpp,java,php,html,ruby autocmd BufWritePre <buffer> %s/\s\+$//e

" Pane/window management
"" Remap Ctrl-W to Space for easier pane management
nmap <silent> <Space> <C-w>
" Space Space to switch windows
nmap <silent> <Space><Space> :wincmd w<CR>
" Space / to vsplit and focus new pane
nmap <silent> <Space>/ :vsplit<CR>:wincmd w<CR>
" Space ? to (h)split and focus new pane
nmap <silent> <Space>? :split<CR>:wincmd w<CR>
" Space Tab to open/close NERDTree
nmap <silent> <Space><Tab> :NERDTreeToggle<CR>
" Ctrl-d to :q
nmap <C-d> :q<CR>

" Leader shortcuts
"" Set/unset list
map <silent> <Leader>l :set list!<CR>
"" Run the current file's spec
map <Leader>r :Rake<CR>
"" Run rake without an argument (runs all specs)
map <Leader>R :Make<CR>
