# Start or attach to tmux session
tm() {
  [[ -z "$1" ]] && { echo "usage: tm <session>" >&2; return 1; }
  tmux has -t $1 &> /dev/null && tmux attach -t $1 || tmux new -s $1
}
