#!/usr/bin/env bash
set -euo pipefail

MY_HOME="/home/vanger"
INDIR="$MY_HOME/sync"
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
OUTFILE="/tmp/backup-$TIMESTAMP.tar.gz.age"
SSH_PUB_KEY="${SSH_PUB_KEY:-$MY_HOME/.ssh/backup/google/id_ed25519.pub}"
REMOTE="google-drive:Backups"

# Проверки
command -v age &>/dev/null || { echo "❌ age не установлен"; exit 1; }
[ -d "$INDIR" ] || { echo "❌ Директория не найдена: $INDIR"; exit 1; }
[ -f "$SSH_PUB_KEY" ] || { echo "❌ Публичный ключ не найден: $SSH_PUB_KEY"; exit 1; }

# Архивация + шифрование БЕЗ временных файлов!
echo "📦 Шифрую $INDIR → $OUTFILE"
tar -cz -C "$MY_HOME" sync | age -R "$SSH_PUB_KEY" > "$OUTFILE"

# Загрузить
rclone copy "$OUTFILE" "$REMOTE/" \
  --drive-use-trash=false \
  --tpslimit=3 \
  --drive-stop-on-upload-limit \
  --checksum  # ← проверит целостность после загрузки!

rm "$OUTFILE"

echo "✅ Бэкап завершён: $(basename "$OUTFILE")"
echo "💡 Расшифровка: age -d -i ~/.ssh/<backup-private-key> $OUTFILE | tar -xz"
