#!/usr/bin/env bash
set -euo pipefail
Z="https://raw.githubusercontent.com/rhenryw/helios-dist/main/built-20260511_130024.zip"
case "$Z" in __HELIOS""_ZIP_URL__) echo "helios.sh: not configured"; exit 1;; esac
D="$HOME/.helios"
pkill -f helios_core 2>/dev/null||true
rm -rf "$D"&&mkdir -p "$D"
curl -fsSL "$Z" -o "$D/h.zip"
unzip -qo "$D/h.zip" -d "$D"&&rm -f "$D/h.zip"
exec bash "$D/setup.sh"
