#!/usr/bin/env bash
# Use absolute path for root to avoid path traversal errors
ROOT_DIR="$(pwd)/_site"
avon deploy site.av --root "$ROOT_DIR" --force
echo "Site built in $ROOT_DIR"

# Generate OG images
echo "Generating Open Graph images..."
bash create_og_images.sh

# Add .nojekyll to bypass Jekyll processing
touch "$ROOT_DIR/.nojekyll"
