#!/usr/bin/env bash

OUTDIR="/home/vanger/Downloads/to_send"

if [ $# -eq 0 ]; then
  echo "need file"
  exit 1
fi

for INFILE in "$@"; do
  FILENAME=$(basename "$INFILE")
  OUTFILE="$OUTDIR/$FILENAME"
  cp -rf "$INFILE" "$OUTFILE"
done



