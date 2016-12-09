# Use emacs-style keybindings
bindkey -e

# Make forward-delete work properly, add alt-l/r for word jumps
bindkey "^[[3~"  delete-char
bindkey "^[3;5~" delete-char
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
