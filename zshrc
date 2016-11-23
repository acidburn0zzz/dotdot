# Load custom functions
for function in ~/.zsh/functions/*; do
  source $function
done

# Load custom config
for config in ~/.zsh/config/*; do
  source $config
done

# Load aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Load local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
