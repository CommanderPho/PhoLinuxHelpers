#!/usr/bin/env bash

set -euo pipefail

SNAPSHOT_DIR="/timeshift/snapshots"
GRUB_CUSTOM="/etc/grub.d/41_timeshift_snapshots"

ROOT_DEV="$(findmnt -n -o SOURCE /)"
GRUB_ROOT="$(grub-probe --target=device /boot)"
GRUB_ROOT_ID="$(grub-probe --target=drive /boot)"

mapfile -t SNAPSHOTS < <(ls -1dt "${SNAPSHOT_DIR}"/* 2>/dev/null | head -n 5)

TMP="$(mktemp)"

{
echo '#!/bin/sh'
echo 'exec tail -n +3 $0'
echo
for SNAP in "${SNAPSHOTS[@]}"; do
    NAME="$(basename "$SNAP")"
    echo "menuentry 'Timeshift Snapshot $NAME' {"
    echo "    insmod ext2"
    echo "    set root=${GRUB_ROOT_ID}"
    echo "    linux ${SNAP}/@/boot/vmlinuz root=${ROOT_DEV} rw"
    echo "    initrd ${SNAP}/@/boot/initrd.img"
    echo "}"
    echo
done
} > "$TMP"

sudo mv "$TMP" "$GRUB_CUSTOM"
sudo chmod +x "$GRUB_CUSTOM"

sudo update-grub
