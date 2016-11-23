## Code directory jump & completion
c() {
  cd ~/Projects/$1
}
compctl -/ -W ~/Projects c
