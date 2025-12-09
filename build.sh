#!/usr/bin/env bash
# Use absolute path for root to avoid path traversal errors
ROOT_DIR="$(pwd)/_site"
avon deploy site.av --root "$ROOT_DIR" --force

# Clean up source files that Avon copied to the build directory
echo "🧹 Cleaning up build artifacts..."
rm -f "$ROOT_DIR/build.sh"
rm -f "$ROOT_DIR/serve.sh"
rm -f "$ROOT_DIR/deploy.sh"
rm -f "$ROOT_DIR/shell.nix"
rm -f "$ROOT_DIR/site.av"
rm -f "$ROOT_DIR/posts.av"
rm -f "$ROOT_DIR/WRITING_REPORT.md"
rm -f "$ROOT_DIR/.gitignore"
rm -rf "$ROOT_DIR/.github"
rm -rf "$ROOT_DIR/.git"

echo "Site built in $ROOT_DIR"
