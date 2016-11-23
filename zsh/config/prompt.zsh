# Git prompt tweaking
autoload -Uz vcs_info
precmd () {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    zstyle ':vcs_info:*' formats '%F{white}@%b%u%c%f'
  } else {
    zstyle ':vcs_info:*' formats '%F{white}@%b%f%F{red}•%f%u%c'
  }

  vcs_info
}
zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:*' stagedstr '%F{green}•%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}•%f'
zstyle ':vcs_info:*' check-for-changes true

# Prompt
setopt prompt_subst
PS1='${PWD/#$HOME/~}'
PROMPT='%{$fg_bold[black]%}%~%b$vcs_info_msg_0_%{$fg_bold[black]%}%%%{$reset_color%} '
