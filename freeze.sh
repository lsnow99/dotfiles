#!/bin/bash

freezeConfig() {
  rm -rf $1
  mkdir -p $1
  cp -r ~/.config/$1 .
}

freezeConfig nvim
freezeConfig i3

