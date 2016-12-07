## Code directory jump & completion
c() {
  cd ~/code/$1
}
compctl -/ -W ~/code c
