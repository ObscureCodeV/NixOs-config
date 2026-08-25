#!/usr/bin/env bash

HOME="/home/vanger"

INDIRS=(
  "$HOME/sync"
  "$HOME/api-key"
  "$HOME/.ssh"
  "$HOME/test"
)

OUTDEVICE="/mnt/HDD"
DAY=$(date +%Y-%m-%d)

OUTDIR="$OUTDEVICE/backup/$DAY"
mkdir -p "$OUTDIR"

for dir in "${INDIRS[@]}"; do
  if [ -d "$dir" ]; then
    DIRNAME=$(basename "$dir")
    echo "Копирую $dir -> $OUTDIR/$DIRNAME"
    rsync -aHAX --delete "$dir/" "$OUTDIR/$DIRNAME/"
  else
    echo "Предупреждение: $dir не существует, пропускаю" >&2
  fi
done

echo "Бэкап завершён: $OUTDIR"
