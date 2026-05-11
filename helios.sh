#!/usr/bin/env bash
set -euo pipefail
Z="__HELIOS_ZIP_URL__"
[[ "$Z" == "__HELIOS_ZIP_URL__" ]]&&{ echo "helios.sh: not configured";exit 1;}
D="$HOME/.helios"
pkill -f helios_core 2>/dev/null||true
rm -rf "$D"&&mkdir -p "$D"
curl -fsSL "$Z" -o "$D/h.zip"
unzip -qo "$D/h.zip" -d "$D"&&rm -f "$D/h.zip"
exec bash "$D/setup.sh"
