#!/bin/bash
set -e

TIMESTAMP=$(date +%s)
BACKUP_DIR=~/.backup/dotfileloader
REGISTERED_CONFIGS=("nvim" "i3" "alacritty")

backupConfig() {
  LOCAL_BACKUP_DIR=$BACKUP_DIR/$1/$TIMESTAMP
  mkdir -p $LOCAL_BACKUP_DIR
  cp -r ~/.config/$1/* $LOCAL_BACKUP_DIR
  echo "backed up $1 to $LOCAL_BACKUP_DIR"
}

loadConfig() {
  cp -r ~/.config/$1 $BACKUP_DIR/
  rm -rf ~/.config/$1
  cp -r $1 ~/.config
  echo "loaded $1"
}

freezeConfig() {
  rm -rf $1
  mkdir -p $1
  cp -r ~/.config/$1 .
  echo "froze $1"
}


# MAIN

SELECTED_CONFIGS=()
i=1
for conf in "$@"
do
  if [ $i -ne 1 ]
  then
    SELECTED_CONFIGS+=$conf
  fi
  i+=1
done

if [ ${#SELECTED_CONFIGS[@]} -eq 0 ]
then
  SELECTED_CONFIGS=("${REGISTERED_CONFIGS[@]}")
fi


if [ "$1" = "freeze" ]
then
  for conf in ${SELECTED_CONFIGS[@]}
  do
    freezeConfig $conf
  done
elif [ "$1" = "backup" ]
then
  for conf in ${SELECTED_CONFIGS[@]}
  do
    backupConfig $conf
  done
elif [ "$1" = "load" ]
then
  for conf in ${SELECTED_CONFIGS[@]}
  do
    backupConfig $conf
    loadConfig $conf
  done
fi

echo "done"

