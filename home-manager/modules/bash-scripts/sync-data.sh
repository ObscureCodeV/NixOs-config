#!/usr/bin/env bash

HOME="/home/vanger"
OUTDIR="$HOME/sync"

DIRS=(
  "$HOME/Nixos-config"
  "$HOME/my_book"
  "$HOME/bash-scripts"
  "$HOME/study"
  "$HOME/test"
  "$HOME/doc"
)

for dir in "${DIRS[@]}"; do
  if [ -d "$dir" ]; then
    rsync -ad "$dir" "$OUTDIR"
  fi 
done
