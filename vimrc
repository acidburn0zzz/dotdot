" vimrc

" Pathogen will load `sensible.vim` which will provide a fair lot of defaults:
"   https://github.com/tpope/vim-sensible
" That's why a lot of "usual suspects" are missing from this vimrc.

" Turn off vi compatibility
"   This should always be set by default anyway but some distros might muck it up.
set nocompatible

" Pathogen: Includes all plugins under .vim/bundle
execute pathogen#infect()

