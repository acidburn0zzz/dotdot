" vimrc

" Pathogen will load `sensible.vim` which will provide a fair lot of defaults:
"   https://github.com/tpope/vim-sensible
" That's why a lot of "usual suspects" are missing from this vimrc.

" Turn off vi compatibility
"   This should always be set by default anyway but some distros might muck it up.
set nocompatible

" Pathogen: Includes all plugins under .vim/bundle
execute pathogen#infect('~/.vim/bundle/{}')

" Colors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"  " Fixes tmux 24-bit color issues
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"  " Fixes tmux 24-bit color issues
set termguicolors                       " Enable 24-bit color
set background=dark
syntax on
colorscheme duotone-firewatch

" Indentation
set shiftwidth=2  " 1 tab == 2 spaces
set tabstop=2
set ai            "Auto indent
set si            "Smart indent
set wrap          "Wrap lines
