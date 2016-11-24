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
colorscheme one
let g:airline_theme='one'

" Indentation
set shiftwidth=2  " 1 tab == 2 spaces
set tabstop=2
set ai            "Auto indent
set si            "Smart indent
set wrap          "Wrap lines

" UI Tweaks
set number        " Line numbers
set foldcolumn=1  " Add some padding left of the line numbers
set noshowmode    " Don't need showmode as lightline status line is enough
