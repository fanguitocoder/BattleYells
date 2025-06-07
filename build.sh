#!/bin/bash
set -e

ADDON_NAME="BattleYells"
DIST_DIR="dist"

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

mkdir -p "$SCRIPT_DIR/$DIST_DIR"
ZIP_PATH="$SCRIPT_DIR/$DIST_DIR/$ADDON_NAME.zip"

# Remove any existing zip
rm -f "$ZIP_PATH"

cd "$PARENT_DIR"

zip -r "$ZIP_PATH" "$ADDON_NAME" \
  -x "$ADDON_NAME/$DIST_DIR/*" \
  -x "$ADDON_NAME/.git/*" \
  -x "$ADDON_NAME/.gitignore" \
  -x "$ADDON_NAME/build.sh"

echo "Created $ZIP_PATH"

