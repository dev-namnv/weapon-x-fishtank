#!/usr/bin/env bash
# Push heavy design files (.blend, 3d-files/) up to Google Drive via rclone.
# Runs automatically on `git push` (via .git/hooks/pre-push), or manually.
set -euo pipefail
REMOTE="${RCLONE_REMOTE:-gdrive}"          # rclone remote name (see `rclone config`)
DEST="${RCLONE_DEST:-weapon-x-fishtank}"   # folder on the Drive
RCLONE="${RCLONE:-rclone}"                 # override if rclone not on PATH
cd "$(dirname "$0")/.."

echo "[sync-drive] uploading heavy files to ${REMOTE}:${DEST} ..."
"$RCLONE" copy wolverine-fishtank.blend "${REMOTE}:${DEST}/" --progress
"$RCLONE" copy 3d-files "${REMOTE}:${DEST}/3d-files" --progress
echo "[sync-drive] done."
