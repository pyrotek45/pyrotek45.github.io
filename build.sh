#!/usr/bin/env bash
# Use absolute path for root to avoid path traversal errors
ROOT_DIR="$(pwd)/_site"
avon deploy site.av --root "$ROOT_DIR" --force
echo "Site built in $ROOT_DIR"

# Add .nojekyll to bypass Jekyll processing
touch "$ROOT_DIR/.nojekyll"
