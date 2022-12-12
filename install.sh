
BACKUP_DIR=~/.backup/dotfileloader

mkdir -p $BACKUP_DIR

loadConfig() {
  cp -r ~/.config/$1 $BACKUP_DIR/
  rm -rf ~/.config/$1
  cp -r $1 ~/.config
}

loadConfig i3
loadConfig nvim
