zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit

# Case insensitive, colourful autocomplete
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' special-dirs true
