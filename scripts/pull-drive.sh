#!/usr/bin/env bash
# Fetch heavy design files (.blend, 3d-files/) from Google Drive via rclone.
# Run after a fresh `git clone` to get the files git doesn't track.
set -euo pipefail
REMOTE="${RCLONE_REMOTE:-gdrive}"
DEST="${RCLONE_DEST:-weapon-x-fishtank}"
RCLONE="${RCLONE:-rclone}"                 # override if rclone not on PATH
cd "$(dirname "$0")/.."

echo "[pull-drive] downloading heavy files from ${REMOTE}:${DEST} ..."
"$RCLONE" copy "${REMOTE}:${DEST}/wolverine-fishtank.blend" . --progress
"$RCLONE" copy "${REMOTE}:${DEST}/3d-files" 3d-files --progress
echo "[pull-drive] done."
